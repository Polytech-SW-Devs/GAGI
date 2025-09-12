# BookShop 프로젝트 분석 보고서

## 1. 프로젝트 개요

이 프로젝트는 Spring Framework 기반의 Java 웹 애플리케이션으로, 도서 정보를 관리하는 온라인 서점 시스템의 백엔드 및 웹 UI를 구현합니다.

주요 기능으로는 도서 관리(CRUD), 회원 관리 및 인증(로그인, 회원가입), 파일 업로드(도서 이미지), 동적 검색 및 페이지네이션이 있습니다.

## 2. 기술 스택

`pom.xml` 파일을 기반으로 다음과 같은 주요 기술 스택을 사용합니다.

- **언어:** Java 11
- **빌드 도구:** Apache Maven
- **핵심 프레임워크:** Spring Framework (4.3.30.RELEASE)
  - `spring-webmvc`: MVC 패턴 구현 및 웹 요청 처리
  - `spring-jdbc`: 데이터베이스 연동 및 트랜잭션 관리
- **데이터베이스 연동:**
  - `MyBatis`: SQL Mapper 프레임워크
  - `mybatis-spring`: Spring과 MyBatis 연동
  - `ojdbc11`: Oracle 데이터베이스 드라이버
  - `commons-dbcp2`: 데이터베이스 커넥션 풀(DBCP)
- **프론트엔드(View):**
  - `JSP (JavaServer Pages)` & `JSTL (JSP Standard Tag Library)`
  - `Bootstrap 5`: UI 프레임워크
- **파일 처리:** `commons-fileupload`
- **로깅:** `SLF4J`, `Log4j`
- **Servlet API:** `javax.servlet-api` (version 2.5)

## 3. 아키텍처

전형적인 계층형 MVC 아키텍처(Layered MVC Architecture)를 따릅니다. 각 계층은 명확하게 분리되어 있으며, 인터페이스를 통해 의존성을 주입받아 결합도를 낮추고 있습니다.

![Architecture Diagram](https://i.imgur.com/g4s5w4o.png)

### 3.1. Presentation Layer (View)

- **위치:** `src/main/webapp/WEB-INF/views/`
- **기술:** JSP와 JSTL을 사용하여 동적인 웹 페이지를 생성합니다.
- **특징:**
  - `InternalResourceViewResolver`가 컨트롤러에서 반환된 뷰 이름(String)을 실제 JSP 파일 경로로 변환합니다. (`servlet-context.xml`에 설정)
  - 모든 페이지는 `include/head.jsp`를 공통으로 포함하여 Bootstrap CSS/JS를 일관되게 적용합니다.
  - JSTL의 `<c:if>`, `<c:forEach>` 등을 활용하여 컨트롤러에서 전달된 모델 데이터(도서 목록, 회원 정보 등)를 화면에 렌더링합니다.

### 3.2. Controller Layer

- **위치:** `src/main/java/kr/ac/kopo/bookshop/controller/`
- **역할:** HTTP 요청을 받아 해당 요청을 처리할 서비스 메소드를 호출하고, 처리 결과를 뷰에 전달합니다.
- **주요 컨트롤러:**
  - `RootController`: 로그인, 로그아웃, 회원가입 등 시스템의 핵심 진입점 및 인증 관련 URL을 처리합니다.
  - `BookController`: `/book/**` 경로의 요청을 받아 도서 정보의 CRUD를 담당합니다.
  - `MemberController`: `/member/**` 경로의 요청을 받아 회원 관리 CRUD를 담당합니다.
- **구현 방식:**
  - `@Controller`, `@RequestMapping`, `@GetMapping`, `@PostMapping` 어노테이션을 사용하여 URL과 메소드를 매핑합니다.
  - `@PathVariable`을 통해 RESTful URL의 파라미터를 추출합니다.
  - `@ResponseBody`를 사용하여 AJAX 요청에 대해 JSON 형태의 응답(실제로는 String "OK" 또는 "FAIL")을 반환합니다. (예: 아이디 중복 확인)
  - `HttpSession`을 사용하여 사용자 로그인 상태를 관리합니다.
  - @Controller
@RequestMapping("/book")
public class BookController {
	final String path = "book/";
	final String uploadPath = "d:/upload/";

	@Autowired
	BookService service;

	@ResponseBody
	@GetMapping("/attach/delete/{code}")
	String deleteAttach(@PathVariable Long code) {
		if (service.deleteAttach(code))
			return "OK";
		return "FAIL";
	}

	@GetMapping("/detail/{code}")
	String detail(@PathVariable Long code, Model model) {
		Book item = service.item(code);

		model.addAttribute("item", item);
		return path + "detail";
	}

	@GetMapping("/dummy")
	String dummy() {
		service.dummy();

		return "redirect:list";
	}

	@GetMapping("/init")
	String init() {
		service.init();

		return "redirect:list";
	}

	@GetMapping("/list")
	String list(Model model, Pager pager) {
		List<Book> list = service.list(pager);
		model.addAttribute("list", list);
		return path + "list";
	}

	@GetMapping("/add")
	String add() {
		return path + "add";
	}

	@PostMapping("/add")
	String add(Book item, MultipartFile[] uploadFile) {
		if (uploadFile != null) {

			// 목록만들기
			List<Attach> attachs = new ArrayList<Attach>();

			for (MultipartFile file : uploadFile) {
				String filename = file.getOriginalFilename();
				String uuid = UUID.randomUUID().toString();

				try {
					file.transferTo(new File(uploadPath + uuid + "_" + filename));

					Attach image = new Attach();
					image.setFilename(filename);
					image.setUuid(uuid);

					attachs.add(image);
				} catch (IllegalStateException | IOException e) {

					System.out.println(e.getLocalizedMessage());
				}
			}

			item.setAttachs(attachs);
		}

		service.add(item);

		return "redirect:list";
	}

	@GetMapping("/delete/{code}")
	String delete(@PathVariable Long code) {
		service.delete(code);
		return "redirect:../list";
	}

	@GetMapping("/update/{code}")
	String update(@PathVariable Long code, Model model) {
		Book item = service.item(code);
		model.addAttribute("item", item);
		return path + "update";
	}

	@PostMapping("/update/{code}")
	String update(@PathVariable Long code, Book item) {
		item.setCode(code);

		service.update(item);
		return "redirect:../list";
	}
}


### 3.3. Service Layer (Business Logic)

- **위치:** `src/main/java/kr/ac/kopo/bookshop/service/`
- **역할:** 비즈니스 로직을 수행하며, 여러 DAO를 조합하거나 트랜잭션을 관리하는 등 핵심적인 역할을 담당합니다.
- **구현 방식:**
  - 인터페이스(`BookService`)와 구현체(`BookServiceImpl`)로 분리하여 설계되었습니다.
  - `@Service` 어노테이션으로 Spring Bean으로 등록됩니다.
  - **트랜잭션 관리:** `BookServiceImpl`의 `add` 메소드에 `@Transactional` 어노테이션을 사용하여, 도서 정보 저장과 첨부파일 정보 저장이 하나의 작업 단위(원자성)로 처리되도록 보장합니다. 둘 중 하나라도 실패하면 모두 롤백됩니다.
  - `MemberServiceImpl`의 `login` 메소드에서는 비밀번호를 비교하고, 로그인 성공 시 `BeanUtils.copyProperties`를 사용해 사용자 정보를 복사한 후 비밀번호를 `null`로 설정하여 민감한 정보가 세션에 남지 않도록 처리합니다.
  @Service
public class BookServiceImpl implements BookService {
	@Autowired
	BookDao dao;

	@Override
	public List<Book> list(Pager pager) {
		int total = dao.total(pager);
		pager.setTotal(total);

		return dao.list(pager);
	}

	@Transactional
	@Override
	public void add(Book item) {
		dao.add(item);

		for (Attach image : item.getAttachs()) {
			image.setBookCode(item.getCode());

			dao.addAttach(image);
		}
	}

	@Override
	public void delete(Long code) {
		dao.delete(code);
	}

	@Override
	public Book item(Long code) {
		return dao.item(code);
	}

	@Override
	public void update(Book item) {
		dao.update(item);

	}

	@Override
	public void dummy() {
		for (int i = 1; i < 100; i++) {
			Book item = new Book();

			item.setTitle("도서명 " + i);
			item.setPublisher("출판사 " + i);
			item.setPrice(i * 1000);
			item.setPubDate(LocalDate.now());
			dao.add(item);
		}
	}

	@Override
	public void init() {
		Pager pager = new Pager();
		pager.setPerPage(0);

		List<Book> list = dao.list(pager);

		for (Book item : list) {
			dao.delete(item.getCode());
		}

	}

	@Override
	public boolean deleteAttach(Long code) {
		if (dao.deleteAttach(code) == 1)
			return true;
		return false;
	}

}

### 3.4. Data Access Layer (DAO)

- **위치:** `src/main/java/kr/ac/kopo/bookshop/dao/`
- **역할:** 데이터베이스에 직접 접근하여 SQL을 실행하는 역할을 합니다.
- **구현 방식:**
  - 서비스 계층과 마찬가지로 인터페이스(`BookDao`)와 구현체(`BookDaoImpl`)로 분리되어 있습니다.
  - `@Repository` 어노테이션으로 Spring의 데이터 접근 예외 변환 기능이 적용된 Bean으로 등록됩니다.
  - `SqlSession` 객체를 주입받아 MyBatis 매퍼에 정의된 SQL을 호출합니다. (예: `sql.selectList("book.list", pager)`)
  @Repository
public class BookDaoImpl implements BookDao {

	@Autowired
	SqlSession sql;

	@Override
	public List<Book> list(Pager pager) {

		return sql.selectList("book.list", pager);
	}

	@Override
	public void add(Book item) {
		sql.insert("book.add", item);
	}

	@Override
	public void delete(Long code) {
		sql.delete("book.delete", code);
	}

	@Override
	public Book item(Long code) {

		return sql.selectOne("book.item", code);
	}

	@Override
	public void update(Book item) {
		sql.update("book.update", item);
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("book.total", pager);
	}

	@Override
	public void addAttach(Attach image) {
		sql.insert("book.add_attach", image);
	}

	@Override
	public int deleteAttach(Long code) {

		return sql.delete("book.delete_attach", code);
	}

}


### 3.5. Database (SQL Mappers)

- **위치:** `src/main/resources/mapper/`
- **역할:** 실행할 SQL 문과 ORM(Object-Relational Mapping) 규칙을 XML 파일에 정의합니다.
- **주요 특징:**
  - **동적 SQL:** `book.xml`의 `<sql id="search">` 부분에서 `<if>` 태그를 사용하여 검색 조건에 따라 동적으로 `WHERE` 절을 생성합니다.
  - **1:N 관계 매핑:** `book.xml`의 `<resultMap id="BookMap">`에서 `<collection>` 태그를 사용하여, 도서(Book)와 첨부파일(Attach)의 1:N 관계를 조인 쿼리 한 번으로 객체에 매핑합니다.
  - **Primary Key 조회:** `book.xml`의 `add` 쿼리에서 `<selectKey>`를 사용하여, `INSERT` 직후 생성된 시퀀스 값(`BOOK_SEQ.currval`)을 다시 `Book` 객체의 `code` 프로퍼티에 담아 서비스 계층으로 반환합니다. 이는 트랜잭션 내에서 방금 생성된 `bookCode`를 첨부파일 저장에 사용하는 핵심적인 부분입니다.
  - **Oracle 전용 페이징:** `ROWNUM`을 사용하여 Oracle 데이터베이스에 특화된 페이징 쿼리를 구현했습니다.
  <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "https://mybatis.org/dtd/mybatis-3-mapper.dtd">
  
  <mapper namespace="book">
  
  	<sql id="search">
  		SELECT * FROM BOOK
  		
  		<where>
  			<if test="search == 1">
  				code=#{keyword}
  			</if>
  			
  			<if test="search == 2">
  				title LIKE CONCAT(CONCAT('%', #{keyword}), '%')
  			</if>
  			
  			<if test="search == 3">
  				publisher LIKE CONCAT(CONCAT('%', #{keyword}), '%')
  			</if>
  		</where>
  		
  		ORDER BY code
  	</sql>
  	
  	<select id="total" resultType="Integer">
  		SELECT COUNT(*) FROM (<include refid="search"></include>) T1
  	</select>
  
  	<select id="list" resultType="Book">
  		SELECT * FROM
    		(SELECT T1.*, ROWNUM rnum FROM 
        		(<include refid="search"></include>) T1)
        <if test="perPage != 0">
		WHERE rnum BETWEEN ((#{page}-1) * #{perPage})+1 AND (#{page}*#{perPage})
		</if>
  	</select>
  	
  	<insert id="add">
  		INSERT INTO BOOK
  		 VALUES (BOOK_SEQ.NEXTVAL, #{title}, #{publisher}, #{price}, #{pubDate})
  		 
  		 <!-- 현재 시퀀스 값을 유지함 -> 트랜잭션 발동 -->
  		 <selectKey keyProperty="code" resultType="Long" order="AFTER">
  		 	SELECT BOOK_SEQ.currval FROM dual
  		 </selectKey>
  	</insert>
  	
  	<delete id="delete">
  		DELETE FROM BOOK WHERE code = #{code}
  	</delete>
  	
  	<resultMap type="Book" id="BookMap" autoMapping="true">
  		<id column="code" property="code"/>
  		
  		<collection property="attachs" column="book_code" javaType="ArrayList" ofType="Attach" autoMapping="true">
  			<id column="attach_code" property="code"/>
  		</collection>
  	</resultMap>
  	
  	<select id="item" resultMap="BookMap">
  		SELECT 
  		 b.*,
  		 a.*,
  		 a.code attach_code
  		FROM book b
  		LEFT JOIN attach a ON b.code=a.book_code
  		WHERE b.code=#{code}
  	</select>
  	
  	<update id="update">
  		UPDATE BOOK
  		 SET title=#{title}, publisher=#{publisher}, price=#{price}, pub_date=#{pubDate}
  		  WHERE code=#{code}
  	</update>
	
	<insert id="add_attach">
		INSERT INTO attach
		VALUES (IMAGE_SEQ.NEXTVAL, #{bookCode}, #{filename}, #{uuid})
	</insert>
	
	<delete id="delete_attach">
		DELETE FROM attach
		WHERE code=#{code}
	</delete>
	
  </mapper>

## 4. 주요 기능 및 구현 방식

### 4.1. 도서 관리 (Book Management)

- **파일 업로드:**
  1. `root-context.xml`에 `CommonsMultipartResolver`가 Bean으로 등록되어 파일 업로드를 활성화합니다.
  2. `BookController`의 `add` 메소드는 `MultipartFile[]` 타입의 파라미터로 업로드된 파일들을 받습니다.
  3. `UUID`를 사용하여 파일명의 중복을 방지하고, 지정된 경로(`d:/upload/`)에 파일을 저장합니다.
  4. `BookServiceImpl`의 `add` 메소드는 `@Transactional`로 보호되며, `book` 정보 INSERT 후 반환된 `bookCode`를 사용하여 `attach` 테이블에 파일 메타데이터를 INSERT 합니다.
- **페이지네이션 및 검색:**
  1. `Pager` 클래스가 페이징 관련 모든 계산(현재 페이지, 전체 항목 수, 이전/다음 그룹 등)을 담당합니다.
  2. `BookController`의 `list` 메소드는 `Pager` 객체를 파라미터로 받아 서비스에 전달합니다.
  3. `BookDao`는 `Pager` 객체를 `book.xml` 매퍼에 전달하고, 매퍼는 이 객체의 `page`, `perPage`, `keyword` 등의 값을 사용하여 동적 검색 및 페이징 쿼리를 완성합니다.

### 4.2. 회원 관리 및 인증 (Member Management & Authentication)

- **인증 (Authentication):**
  - `RootController`의 `login` 메소드가 `id`와 `password`를 받아 `MemberService`의 `login` 메소드를 호출합니다.
  - `MemberService`는 DAO를 통해 ID로 회원 정보를 조회한 후, DB에 저장된 비밀번호와 사용자가 입력한 비밀번호를 비교합니다.
  - 인증 성공 시, `HttpSession`에 `member`라는 키로 사용자 정보를 저장합니다.
- **권한 제어 (Authorization):**
  - `servlet-context.xml`에 주석 처리된 `<interceptors>` 설정이 존재합니다.
  - `UserInterceptor`: 로그인이 필요한 페이지(`book`, `customer`, `orders`)에 접근 시 세션에 `member` 정보가 없으면 `/login`으로 리다이렉트합니다.
  - `AdminInterceptor`: 관리자 페이지(`member`)에 접근 시 세션의 `member` ID가 "admin"이 아니면 루트("/")로 리다이렉트합니다.
- **AJAX 아이디 중복 확인:**
  - `signup.jsp`에서 JavaScript(`fetch` 또는 `XMLHttpRequest`)를 사용하여 `/check_id/{id}` URL을 호출합니다.
  - `RootController`의 `checkId` 메소드는 `@ResponseBody`를 통해 "OK" 또는 "FAIL" 문자열을 반환하여, 클라이언트 측에서 실시간으로 중복 여부를 확인할 수 있게 합니다.

## 5. 코드 스타일 및 규칙

- **인터페이스 기반 프로그래밍:** `Service`와 `DAO` 계층 모두 인터페이스와 구현체로 분리하여, 계층 간의 의존성을 낮추고 테스트 용이성을 높였습니다.
- **명명 규칙:** Java의 표준 명명 규칙(클래스는 `PascalCase`, 메소드/변수는 `camelCase`)을 일관되게 따르고 있습니다.
- **DTO/Model 사용:** `Book`, `Member` 등 데이터 전송을 위한 모델 객체를 사용하여 각 계층 간에 데이터를 명확하고 구조적으로 전달합니다.
- **설정 분리:** `root-context.xml`(공통 설정)과 `servlet-context.xml`(웹 관련 설정)으로 Spring 설정을 분리하여 관리하고 있습니다.

## 6. 종합 의견

이 프로젝트는 Spring MVC의 기본적인 원칙과 계층형 아키텍처를 충실히 따르고 있는 잘 구성된 웹 애플리케이션입니다. 특히 MyBatis의 동적 SQL, `<selectKey>`, `<resultMap>` 등을 효과적으로 활용하여 데이터베이스와의 연동을 유연하게 처리하고 있으며, `@Transactional`을 통한 서비스 계층의 트랜잭션 관리가 돋보입니다.

프론트엔드와 백엔드의 역할이 명확히 분리되어 있어 유지보수 및 기능 확장이 용이한 구조입니다.
