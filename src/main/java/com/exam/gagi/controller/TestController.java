package com.exam.gagi.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.exam.gagi.model.ItemImage;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.Member;
import com.exam.gagi.service.ProductService;

@Controller
@RequestMapping("/test")
public class TestController {
	@Autowired
	ProductService service;

	private final String uploadFolder = "D:\\upload";

	// 상품+이미지 등록
	@PostMapping("/testUpload")
	String postUpload(Items item, @RequestParam("imageFileNames") String imageFileNames,
			@RequestParam("representativeImage") String representativeImage,
			@SessionAttribute(name = "loginUser", required = false) Member loginUser) {

		if (loginUser == null) {
			return "redirect:/login";
		}

		List<ItemImage> itemImages = new ArrayList<ItemImage>();
		List<String> allImageFiles = Arrays.asList(imageFileNames.split(","));

		ItemImage mainImage = new ItemImage();
		mainImage.setImageUrl("d:/upload/" + representativeImage);
		mainImage.setSortOrder(1);
		mainImage.setFileName(representativeImage); // 파일 이름 설정
		itemImages.add(mainImage);

		int sortOrder = 2;
		for (String fileName : allImageFiles) {
			if (!fileName.equals(representativeImage)) {
				ItemImage otherImage = new ItemImage();
				otherImage.setImageUrl("d:/upload/" + fileName);
				otherImage.setSortOrder(sortOrder++);
				otherImage.setFileName(fileName); // 파일 이름 설정
				itemImages.add(otherImage);
			}
		}

		item.setUserId(loginUser.getId());
		item.setItemImages(itemImages);
		System.out.println("### CONTROLLER: 서비스 호출 직전 이미지 리스트 사이즈: " + item.getItemImages().size());
		service.addWithImage(item);
		return "redirect:/home";
	}

	// 상품 등록 진입
	@GetMapping("/testUpload")
	String testUpload(@SessionAttribute(name = "loginUser", required = false) Member loginUser, Model model) {
		if (loginUser == null) {
			return "redirect:/login";
		}
		model.addAttribute("loginUser", loginUser);
		return "/test/testUpload";
	}

	/**
	 * Ajax를 이용한 다중 파일 업로드를 처리하는 메서드
	 * 
	 * @param uploadFiles JS의 FormData에 담겨온 파일 목록
	 * @param request     서버의 실제 경로를 얻기 위해 사용
	 * @return 클라이언트에 전달할 파일 정보(URL, 파일명 등) 리스트
	 */
	@PostMapping("/upload")
	@ResponseBody // 이 어노테이션을 통해 반환값이 View가 아닌 JSON 데이터임을 명시
	public List<Map<String, Object>> uploadAjaxPost(@RequestParam("uploadFiles") List<MultipartFile> uploadFiles,
			HttpServletRequest request) {

		// 반환할 파일 정보 리스트를 생성
		List<Map<String, Object>> resultList = new ArrayList<>();

		// 파일을 저장할 외부 경로를 지정

		// 저장 경로에 해당하는 디렉토리가 존재하지 않으면 생성
		File uploadPath = new File(uploadFolder);
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		// 업로드된 각 파일에 대해 처리
		for (MultipartFile multipartFile : uploadFiles) {
			// 파일이 비어있지 않은 경우에만 처리
			if (multipartFile.getSize() == 0) {
				continue;
			}

			String originalName = multipartFile.getOriginalFilename(); // 원본 파일 이름
			String savedName = UUID.randomUUID().toString() + "_" + originalName; // 고유한 파일 이름 생성

			// 파일을 저장할 최종 경로 객체
			File saveFile = new File(uploadPath, savedName);

			try {
				// 파일을 실제 경로에 저장
				multipartFile.transferTo(saveFile);

				// 클라이언트에 반환할 파일 정보를 Map에 담기
				Map<String, Object> fileInfo = new HashMap<>();
				// 미리보기를 위해 클라이언트가 접근할 수 있는 URL 경로 (컨텍스트 경로 포함)
				fileInfo.put("url", request.getContextPath() + "/upload/" + savedName);
				fileInfo.put("filename", savedName); // 고유 파일명
				fileInfo.put("originalName", originalName); // 원본 파일명

				// 리스트에 파일 정보 추가
				resultList.add(fileInfo);

			} catch (IllegalStateException | IOException e) {
				// 파일 저장 중 오류 발생 시 로그 출력
				System.err.println("File upload failed: " + e.getMessage());
			}
		}

		// 파일 정보 리스트를 JSON 형태로 클라이언트에 반환
		return resultList;
	}

	/**
	 * 임시 업로드된 파일을 삭제하는 메서드
	 * 
	 * @param filename URL 경로에서 추출한 삭제할 파일의 고유 이름
	 * @return 성공 또는 실패 메시지를 담은 ResponseEntity
	 */
	@DeleteMapping("/delete/{filename:.+}")
	@ResponseBody
	public ResponseEntity<String> deleteAjaxDelete(@PathVariable String filename) {

		// 파일을 저장했던 외부 경로를 지정

		try {
			File fileToDelete = new File(uploadFolder, filename);

			// 파일이 존재하면 삭제
			if (fileToDelete.exists()) {
				if (fileToDelete.delete()) {
					// 성공적으로 삭제된 경우
					return new ResponseEntity<>("deleted", HttpStatus.OK);
				} else {
					// 삭제에 실패한 경우 (예: 파일 권한 문제)
					return new ResponseEntity<>("delete failed", HttpStatus.INTERNAL_SERVER_ERROR);
				}
			} else {
				// 삭제할 파일이 존재하지 않는 경우
				return new ResponseEntity<>("file not found", HttpStatus.NOT_FOUND);
			}
		} catch (Exception e) {
			// 그 외 예외 처리
			return new ResponseEntity<>("error", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}


