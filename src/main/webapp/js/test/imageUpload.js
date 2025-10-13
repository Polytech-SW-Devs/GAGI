/**
 * 상품 등록 페이지의 다중 이미지 업로드, 미리보기, 삭제 기능을 처리하는 스크립트
 */
window.addEventListener("load", function() {
    // DOM 요소 가져오기
    const addImageBtn = this.document.getElementById("add-image-btn");
    const fileInput = this.document.getElementById("file-input");
    const previewContainer = this.document.getElementById("image-list-display");
    const filenamesInput = this.document.getElementById("image-filenames-input");
    const representativeImageInput = this.document.getElementById("representative-image-input");
    const mainPreviewImage = this.document.getElementById("main-preview-image");
    const mainPreviewPlaceholder = this.document.getElementById("main-preview-placeholder");

    let uploadedFileNames = [];

    // '사진 올리기' 버튼 클릭 시, 숨겨진 파일 입력(fileInput)을 대신 클릭해줌
    addImageBtn.addEventListener("click", e => {
        fileInput.click();
    });

    // 파일 입력(fileInput)에 변경이 생겼을 때 (사용자가 파일을 선택했을 때)
    fileInput.addEventListener("change", e => {
        const files = e.target.files; // 선택된 파일 목록(FileList)
        if(files.length === 0) {
            return; // 파일 선택이 취소된 경우 함수 종료
        }

        // 서버에 파일을 보내기 위한 FormData 객체 생성
        const formData = new FormData();
        // 선택된 모든 파일을 FormData에 추가
        for (const file of files) {
            formData.append("uploadFiles", file); // "uploadFiles"는 서버 컨트롤러에서 받을 때 사용할 이름
        }

        // FormData를 서버로 전송하여 업로드 처리
        uploadFilesToServer(formData);

        // 중요: 동일한 파일을 다시 선택할 수 있도록 입력 값을 초기화
        fileInput.value = "";
    });

    /**
     * FormData를 서버로 비동기 전송(AJAX)하여 파일을 업로드하는 함수
     * @param {FormData} formData - 업로드할 파일들이 담긴 FormData 객체
     */
    function uploadFilesToServer(formData) {
        fetch(contextPath + "/test/upload", { // 파일 업로드를 처리할 서버의 API 경로
            method: "POST",
            body: formData
        })
        .then(response => {
            if (!response.ok) { // HTTP 상태 코드가 200-299가 아닌 경우
                throw new Error('서버 응답이 올바르지 않습니다.');
            }
            return response.json(); // 서버로부터 받은 JSON 데이터를 파싱
        })
        .then(result => {
            // 서버로부터 받은 파일 정보 배열(result)을 순회
            // 서버 응답 예시: [{ url: '/path/to/image.jpg', filename: 'unique-name.jpg', originalName: 'original.jpg' }]
            result.forEach(fileInfo => {
                // 1. 화면에 이미지 미리보기 추가
                addPreview(fileInfo);
                // 2. 파일 이름 관리 배열에 서버에서 받은 고유 파일 이름 추가
                uploadedFileNames.push(fileInfo.filename);
            });
            // 3. 숨겨진 입력 필드의 값을 최신 상태로 업데이트
            updateFilenamesInput();
        })
        .catch(error => {
            console.error('Upload failed:', error);
            alert('파일 업로드에 실패했습니다.');
        });
    }

    /**
     * 서버로부터 받은 파일 정보로 이미지 미리보기 요소를 생성하고 화면에 추가하는 함수
     * @param {object} fileInfo - 파일 정보 객체
     */
    function addPreview(fileInfo) {
        // 리스트 아이템 역할을 할 wrapper div 생성
        const previewWrapper = document.createElement('div');
        previewWrapper.className = 'image-preview-item';
        previewWrapper.setAttribute('data-filename', fileInfo.filename);

        // 썸네일 이미지(img) 태그 생성
        const img = document.createElement('img');
        img.src = fileInfo.url;

        // *** 대표 사진 지정을 위한 클릭 이벤트 추가 ***
        img.addEventListener('click', (e) => {
            if (confirm("이 사진을 대표사진으로 하시겠습니까?")) {
                const clickedWrapper = e.target.closest('.image-preview-item');
                const filename = clickedWrapper.getAttribute('data-filename');

                // 1. 대표 사진 파일명을 숨겨진 input에 저장
                representativeImageInput.value = filename;

                // 2. 상단 대표 이미지 뷰 업데이트
                mainPreviewImage.src = e.target.src;
                mainPreviewImage.style.display = 'block';
                mainPreviewPlaceholder.style.display = 'none';

                // 3. 모든 썸네일에서 'selected-image' 클래스 제거
                document.querySelectorAll('.image-preview-item').forEach(item => {
                    item.classList.remove('selected-image');
                });

                // 4. 클릭된 썸네일에만 'selected-image' 클래스 추가
                clickedWrapper.classList.add('selected-image');
            }
        });

        // 삭제(button) 태그 생성
        const deleteBtn = document.createElement('button');
        deleteBtn.type = 'button';
        deleteBtn.className = 'delete-image-btn';
        deleteBtn.innerText = 'X';
        
        // 삭제 버튼 클릭 이벤트
        deleteBtn.addEventListener('click', (e) => {
            e.stopPropagation(); // 대표사진 지정 클릭 이벤트가 함께 실행되는 것을 방지

            const filenameToDelete = e.target.closest('.image-preview-item').getAttribute('data-filename');
            
            // 만약 삭제하려는 사진이 대표사진이었다면, 대표사진 정보 초기화
            if (representativeImageInput.value === filenameToDelete) {
                representativeImageInput.value = '';
                mainPreviewImage.src = '#';
                mainPreviewImage.style.display = 'none';
                mainPreviewPlaceholder.style.display = 'block';
            }

            e.target.closest('.image-preview-item').remove();
            uploadedFileNames = uploadedFileNames.filter(name => name !== filenameToDelete);
            updateFilenamesInput();
            
            fetch(`${contextPath}/test/delete/${filenameToDelete}`, { method: 'DELETE' });
        });

        // wrapper에 이미지와 삭제 버튼 순서대로 추가
        previewWrapper.appendChild(img);
        previewWrapper.appendChild(deleteBtn);
        // 최종적으로 컨테이너에 wrapper 추가
        previewContainer.appendChild(previewWrapper);
    }
    
    /**
     * `uploadedFileNames` 배열의 현재 상태를 숨겨진 입력 필드(`filenamesInput`)의 값으로 업데이트하는 함수
     */
    function updateFilenamesInput() {
        filenamesInput.value = uploadedFileNames.join(',');
    }
});