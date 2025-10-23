/**
 * @file adminPage.js
 * @description 관리자 페이지의 대시보드, 상품/회원/주문 관리 기능을 담당하는 스크립트입니다.
 * 각 섹션의 콘텐츠를 동적으로 로드하고, 검색, 필터링, 페이지네이션 기능을 제공합니다.
 */

/**
 * 특정 콘텐츠 섹션을 보여주고 다른 섹션은 숨깁니다.
 * 사이드바 메뉴 클릭에 따라 해당 관리 섹션을 표시하고, 메뉴에 활성화 스타일을 적용합니다.
 * @param {string} contentId - 표시할 콘텐츠 섹션의 ID ('dashboard', 'product-management' 등)
 */
function showContent(contentId) {
    // 모든 주요 콘텐츠 섹션 ID 목록
    const sections = ['dashboard-content', 'product-management-content', 'member-management-content', 'order-management-content'];
    
    // 모든 섹션을 숨김
    sections.forEach(id => {
        const el = document.getElementById(id);
        if (el) el.style.display = 'none';
    });

    // 선택된 콘텐츠 섹션을 표시
    const activeSection = document.getElementById(contentId + '-content');
    if (activeSection) {
        activeSection.style.display = 'block';
    } else {
        // 요청된 섹션이 없으면 대시보드를 기본으로 표시
        document.getElementById('dashboard-content').style.display = 'block';
        contentId = 'dashboard'; // contentId를 'dashboard'로 설정하여 사이드바 활성화 클래스 적용
    }

    // 'product-management' 섹션일 경우, 데이터가 아직 로드되지 않았다면 상품 목록을 비동기적으로 불러옵니다.
    if (contentId === 'product-management') {
        const tbody = document.getElementById('products-tbody');
        if (tbody.children.length === 0) {
             productList();
        }
    }

    // 'member-management' 섹션일 경우, 데이터가 아직 로드되지 않았다면 회원 목록을 불러옵니다.
    if (contentId === 'member-management') {
        const tbody = document.getElementById('members-tbody');
        if (tbody.children.length === 0) {
             userList();
        }
    }

    // 'order-management' 섹션일 경우, 데이터가 아직 로드되지 않았다면 주문 목록을 불러옵니다.
    if (contentId === 'order-management') {
        const tbody = document.getElementById('orders-tbody');
        if (tbody.children.length === 0) {
             orderList();
        }
    }

    // 모든 사이드바 메뉴에서 'active' 클래스를 제거하여 비활성화합니다.
    document.querySelectorAll('.sidebar-menu a').forEach(item => {
        item.classList.remove('active');
    });
    
    // 현재 활성화된 메뉴 항목에 'active' 클래스를 추가하여 시각적으로 표시합니다.
    const activeMenu = document.getElementById(contentId + '-menu');
    if (activeMenu) {
        activeMenu.classList.add('active');
    }
}

/**
 * 페이지네이션 UI를 생성하고 렌더링하는 범용 함수입니다.
 * @param {string} containerId - 페이지네이션 UI가 삽입될 컨테이너의 DOM ID.
 * @param {object} pager - 페이지 번호, 이전/다음 페이지 등 페이지네이션 정보를 담은 객체.
 */
function renderPagination(containerId, pager) {
    const paginationContainer = document.getElementById(containerId);
    if (!paginationContainer) return;

    let html = '';
    
    // 이전 페이지 버튼 (첫 페이지가 아닐 경우에만 표시)
    if (pager.page > 1) {
        html += `<a href="#" data-page="${pager.prev}">&laquo;</a>`;
    }

    // 페이지 번호 목록
    if(pager.pageList) {
        pager.pageList.forEach(page => {
            html += `<a href="#" data-page="${page}" class="${page === pager.page ? 'active' : ''}">${page}</a>`;
        });
    }

    // 다음 페이지 버튼 (마지막 페이지가 아닐 경우에만 표시)
    if (pager.page < pager.last) {
        html += `<a href="#" data-page="${pager.next}">&raquo;</a>`;
    }

    paginationContainer.innerHTML = html;
}

/**
 * 상품 목록을 서버에서 비동기적으로 불러와 테이블에 렌더링합니다.
 * @param {object} params - 검색/필터링 조건을 담은 객체 (page, keyword 등).
 */
async function productList(params = {}) {
    try {
        // URLSearchParams를 사용하여 파라미터를 쿼리 문자열로 변환합니다.
        const query = new URLSearchParams(params).toString();
        const response = await fetch(`${CONTEXT_PATH}/api/admin/products?${query}`);
        if (!response.ok) {
            throw new Error(`Network response was not ok: ${response.statusText}`);
        }
        
        // 응답 데이터를 JSON으로 파싱합니다.
        const data = await response.json();
        const products = data.products;
        const pager = data.pager;

        const tbody = document.getElementById('products-tbody');
        tbody.innerHTML = ''; // 기존 목록을 지웁니다.

        // 검색 결과가 없으면 메시지를 표시합니다.
        if (!products || products.length === 0) {
            tbody.innerHTML = '<tr><td colspan="7" class="empty-state">검색된 상품이 없습니다.</td></tr>';
            renderPagination('product-pagination', { page: 1, pageList: [1], last: 1 });
            return;
        }

        // 각 상품 데이터를 순회하며 테이블 행(row)을 생성합니다.
        products.forEach(product => {
            const formattedPrice = new Intl.NumberFormat('ko-KR').format(product.price);
            let formattedDate = 'N/A';
            if (product.createdAt) {
                const dateObj = new Date(product.createdAt);
                if (!isNaN(dateObj.getTime())) { 
                    formattedDate = dateObj.toISOString().split('T')[0];
                }
            }

            const row = `
                <tr>
                    <td>${product.id}</td>
                    <td>
                        <a href="${CONTEXT_PATH}/product/detail?prodId=${product.id}">
                            <div class="product-info">
                                ${product.filename ?
                                    `<img src="${CONTEXT_PATH}/uploads/${product.filename}" alt="${product.title}" class="product-image">` :
                                    `<div class="product-placeholder"></div>`
                                }
                                <span>${product.title}</span>
                            </div>
                        </a>
                    </td>
                    <td>${formattedPrice}원</td>
                    <td>${product.amount}개</td>
                    <td>${product.nickname}</td>
                    <td>${formattedDate}</td>
                    <td>
                        <div class="action-links">
                            <a href="${CONTEXT_PATH}/product/update/${product.id}">수정</a>
                            <span>|</span>
                            <a href="${CONTEXT_PATH}/product/delete/${product.id}" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
                        </div>
                    </td>
                </tr>
            `;
            tbody.insertAdjacentHTML('beforeend', row);
        });

        // 페이지네이션 UI를 렌더링합니다.
        renderPagination('product-pagination', pager);

    } catch (error) {
        console.error('Failed to load products:', error);
        const tbody = document.getElementById('products-tbody');
        tbody.innerHTML = '<tr><td colspan="7" class="empty-state">상품을 불러오는 데 실패했습니다.</td></tr>';
    }
}

/**
 * 상품 목록 페이지네이션 클릭 이벤트를 처리합니다.
 * 페이지 번호를 클릭하면 해당 페이지의 데이터를 새로 불러옵니다.
 */
document.getElementById('product-pagination')?.addEventListener('click', (e) => {
    e.preventDefault();
    const target = e.target.closest('a');
    if (target && target.dataset.page) {
        const page = parseInt(target.dataset.page, 10);
        const params = {
            page: page,
            outOfStock: document.getElementById('outOfStock-checkbox').checked,
            startDate: document.getElementById('product-start-date').value,
            endDate: document.getElementById('product-end-date').value,
            search: document.getElementById('product-search-type').value,
            keyword: document.getElementById('product-search-keyword').value
        };
        productList(params);
    }
});

/**
 * 회원 목록을 서버에서 비동기적으로 불러와 테이블에 렌더링합니다.
 * @param {object} params - 검색/필터링 조건을 담은 객체.
 */
async function userList(params = {}) {
    try {
        const query = new URLSearchParams(params).toString();
        const response = await fetch(`${CONTEXT_PATH}/api/admin/users?${query}`);
        if (!response.ok) {
            throw new Error(`Network response was not ok: ${response.statusText}`);
        }
        const data = await response.json();
        const members = data.users;
        const pager = data.pager;

        const tbody = document.getElementById('members-tbody');
        tbody.innerHTML = ''; // 이전 내용 지우기

        if (!members || members.length === 0) {
            tbody.innerHTML = '<tr><td colspan="7" class="empty-state">검색된 회원이 없습니다.</td></tr>';
            renderPagination('user-pagination', { page: 1, pageList: [1], last: 1 });
            return;
        }

        members.forEach(member => {
            let formattedDate = 'N/A';
            if (member.createdAt) {
                const dateObj = new Date(member.createdAt);
                if (!isNaN(dateObj.getTime())) {
                    formattedDate = dateObj.toISOString().split('T')[0];
                }
            }

            const row = `
                <tr>
                    <td>${member.id}</td>
                    <td>${member.username}</td>
                    <td>${member.nickname}</td>
                    <td>${member.email}</td>
                    <td>${member.phone}</td>
                    <td>${formattedDate}</td>
                    <td>
                        <div class="action-links">
                            <a href="#">수정</a>
                            <span>|</span>
                            <a href="#">삭제</a>
                        </div>
                    </td>
                </tr>
            `;
            tbody.insertAdjacentHTML('beforeend', row);
        });
        renderPagination('user-pagination', pager);
    } catch (error) {
        console.error('Failed to load members:', error);
        const tbody = document.getElementById('members-tbody');
        tbody.innerHTML = '<tr><td colspan="7" class="empty-state">회원 정보를 불러오는 데 실패했습니다.</td></tr>';
    }
}

/**
 * 회원 목록 페이지네이션 클릭 이벤트를 처리합니다.
 */
document.getElementById('user-pagination')?.addEventListener('click', (e) => {
    e.preventDefault();
    const target = e.target.closest('a');
    if (target && target.dataset.page) {
        const page = parseInt(target.dataset.page, 10);
        const params = {
            page: page,
            startDate: document.getElementById('user-start-date').value,
            endDate: document.getElementById('user-end-date').value,
        };
        const searchType = document.getElementById('user-search-type').value;
        const searchKeyword = document.getElementById('user-search-keyword').value;
        
        if(searchKeyword) {
            switch(searchType) {
                case '1': params.id = searchKeyword; break;
                case '2': params.username = searchKeyword; break;
                case '3': params.nickname = searchKeyword; break;
                case '4': params.email = searchKeyword; break;
                case '5': params.phone = searchKeyword; break;
            }
        }
        userList(params);
    }
});

/**
 * 주문 목록을 서버에서 비동기적으로 불러와 테이블에 렌더링합니다.
 * @param {object} params - 검색/필터링 조건을 담은 객체.
 */
async function orderList(params = {}) {
    try {
        const query = new URLSearchParams(params).toString();
        const response = await fetch(`${CONTEXT_PATH}/api/admin/orders?${query}`);
        if (!response.ok) {
            throw new Error(`Network response was not ok: ${response.statusText}`);
        }
        const data = await response.json();
        const orders = data.orders;
        const pager = data.pager;

        const tbody = document.getElementById('orders-tbody');
        tbody.innerHTML = ''; // 이전 내용 지우기

        if (!orders || orders.length === 0) {
            tbody.innerHTML = '<tr><td colspan="7" class="empty-state">검색된 주문이 없습니다.</td></tr>';
            renderPagination('order-pagination', { page: 1, pageList: [1], last: 1 });
            return;
        }

        orders.forEach(order => {
            const formattedTotalPrice = new Intl.NumberFormat('ko-KR').format(order.totalPrice);
            let formattedDate = 'N/A';
            if (order.createdAt) {
                const dateObj = new Date(order.createdAt);
                if (!isNaN(dateObj.getTime())) {
                    formattedDate = dateObj.toISOString().split('T')[0];
                }
            }

            const row = `
                <tr>
                    <td>${order.id}</td>
                    <td>${order.nickname}</td>
                    <td>${order.title}</td>
                    <td>${order.amount}</td>
                    <td>${formattedTotalPrice}원</td>
                    <td>${formattedDate}</td>
                    <td>${order.orderStatus}</td>
                </tr>
            `;
            tbody.insertAdjacentHTML('beforeend', row);
        });
        renderPagination('order-pagination', pager);
    } catch (error) {
        console.error('Failed to load orders:', error);
        const tbody = document.getElementById('orders-tbody');
        tbody.innerHTML = '<tr><td colspan="7" class="empty-state">주문 정보를 불러오는 데 실패했습니다.</td></tr>';
    }
}

/**
 * 주문 목록 페이지네이션 클릭 이벤트를 처리합니다.
 */
document.getElementById('order-pagination')?.addEventListener('click', (e) => {
    e.preventDefault();
    const target = e.target.closest('a');
    if (target && target.dataset.page) {
        const page = parseInt(target.dataset.page, 10);
        const params = {
            page: page,
            startDate: document.getElementById('order-start-date').value,
            endDate: document.getElementById('order-end-date').value,
            orderStatus: document.getElementById('order-status-filter').value
        };
        const searchType = document.getElementById('order-search-type').value;
        const searchKeyword = document.getElementById('order-search-keyword').value;

        if(searchKeyword) {
            switch(searchType) {
                case '1': params.id = searchKeyword; break;
                case '2': params.nickname = searchKeyword; break;
                case '3': params.title = searchKeyword; break;
            }
        }
        orderList(params);
    }
});

/**
 * 페이지 로드 시 실행되는 초기화 함수입니다.
 * 사이드바 메뉴, Datepicker, 각종 검색 및 초기화 버튼에 대한 이벤트 리스너를 설정합니다.
 */
window.addEventListener("load", function() {
    // 사이드바 메뉴 클릭에 따른 콘텐츠 표시 이벤트 리스너 설정
    const sidebar = document.querySelector('.sidebar');
    sidebar.addEventListener('click', (event) => {
        const link = event.target.closest('a');
        if (link && link.dataset.contentId) {
            event.preventDefault();
            showContent(link.dataset.contentId);
        }
    });

    // Datepicker 라이브러리(flatpickr)를 한국어 설정으로 초기화합니다.
    flatpickr(".datepicker", {
        dateFormat: "Y-m-d",
        locale: "ko",
    });

    // 상품 검색 버튼 이벤트 리스너
    const productSearchBtn = document.getElementById('product-search-btn');
    if(productSearchBtn) {
        productSearchBtn.addEventListener('click', () => {
            const params = {
                page: 1,
                outOfStock: document.getElementById('outOfStock-checkbox').checked,
                startDate: document.getElementById('product-start-date').value,
                endDate: document.getElementById('product-end-date').value,
                search: document.getElementById('product-search-type').value,
                keyword: document.getElementById('product-search-keyword').value
            };
            productList(params);
        });
    }

    // 상품 검색 초기화 버튼 이벤트 리스너
    const productResetBtn = document.getElementById('product-reset-btn');
    if(productResetBtn) {
        productResetBtn.addEventListener('click', () => {
            document.getElementById('outOfStock-checkbox').checked = false;
            document.getElementById('product-start-date').value = '';
            document.getElementById('product-end-date').value = '';
            document.getElementById('product-search-type').value = '1';
            document.getElementById('product-search-keyword').value = '';
            productList(); // 파라미터 없이 호출하여 전체 목록을 다시 불러옵니다.
        });
    }

    // 사용자 검색 버튼 이벤트 리스너
    const userSearchBtn = document.getElementById('user-search-btn');
    if(userSearchBtn) {
        userSearchBtn.addEventListener('click', () => {
            const searchType = document.getElementById('user-search-type').value;
            const searchKeyword = document.getElementById('user-search-keyword').value;
            const params = {
                page: 1,
                startDate: document.getElementById('user-start-date').value,
                endDate: document.getElementById('user-end-date').value
            };

            if(searchKeyword) {
                switch(searchType) {
                    case '1': params.id = searchKeyword; break;
                    case '2': params.username = searchKeyword; break;
                    case '3': params.nickname = searchKeyword; break;
                    case '4': params.email = searchKeyword; break;
                    case '5': params.phone = searchKeyword; break;
                }
            }
            userList(params);
        });
    }

    // 사용자 검색 초기화 버튼 이벤트 리스너
    const userResetBtn = document.getElementById('user-reset-btn');
    if(userResetBtn) {
        userResetBtn.addEventListener('click', () => {
            document.getElementById('user-start-date').value = '';
            document.getElementById('user-end-date').value = '';
            document.getElementById('user-search-type').value = '1';
            document.getElementById('user-search-keyword').value = '';
            userList(); // 파라미터 없이 호출하여 전체 목록을 다시 불러옵니다.
        });
    }

    // 주문 검색 버튼 이벤트 리스너
    const orderSearchBtn = document.getElementById('order-search-btn');
    if(orderSearchBtn) {
        orderSearchBtn.addEventListener('click', () => {
            const searchType = document.getElementById('order-search-type').value;
            const searchKeyword = document.getElementById('order-search-keyword').value;
            const params = {
                page: 1,
                startDate: document.getElementById('order-start-date').value,
                endDate: document.getElementById('order-end-date').value,
                orderStatus: document.getElementById('order-status-filter').value
            };

            if(searchKeyword) {
                switch(searchType) {
                    case '1': params.id = searchKeyword; break;
                    case '2': params.nickname = searchKeyword; break;
                    case '3': params.title = searchKeyword; break;
                }
            }
            orderList(params);
        });
    }

    // 주문 검색 초기화 버튼 이벤트 리스너
    const orderResetBtn = document.getElementById('order-reset-btn');
    if(orderResetBtn) {
        orderResetBtn.addEventListener('click', () => {
            document.getElementById('order-start-date').value = '';
            document.getElementById('order-end-date').value = '';
            document.getElementById('order-search-type').value = '1';
            document.getElementById('order-search-keyword').value = '';
            document.getElementById('order-status-filter').value = '';
            orderList(); // 파라미터 없이 호출하여 전체 목록을 다시 불러옵니다.
        });
    }

    // 페이지가 처음 로드될 때 기본적으로 대시보드 콘텐츠를 표시합니다.
    showContent('dashboard');
});