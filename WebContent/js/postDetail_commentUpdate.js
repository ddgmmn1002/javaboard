// 모든 수정 버튼에 이벤트 등록
const updateComments = document.querySelectorAll(".update-comment");
updateComments.forEach(
	(updateComment) => {
		updateComment.addEventListener("click", updateButtonIsClicked);
	}
)

// 수정 버튼 이벤트 함수
function updateButtonIsClicked(event){
	// 버튼이 클릭된 댓글의 번호와 내용 선택
	const cno = event.target.closest(".comment").dataset.cno;
	const contentElement = event.target.closest(".comment").children[1].children[0]
	const content = contentElement.innerHTML.replace(/\t/ig, "").replace("\n","");
	
	let updateEditor = null;
	
	// 댓글 수정 창 생성 (이미 존재하면 삭제)
	if(document.querySelector("#update-div") != null){
		updateEditor = null;
		tinymce.remove(updateEditor);
		document.querySelector("#update-div").remove();
		initCommentEditor();
		return;
	}
	const updateDiv = createUpdateDiv(
		content,
		() => {
			const updateContent = tinymce.get("update-input").getContent();
			updateComment(cno, updateContent, contentElement);
			updateEditor = null;
			tinymce.remove(updateEditor);
			updateDiv.remove();
			initCommentEditor();
		},
		() => {
			updateEditor = null;
			tinymce.remove(updateEditor);
			updateDiv.remove();
			initCommentEditor();
		}
	);
	
	event.target.parentElement.parentElement.parentElement.parentElement.appendChild(updateDiv);
	
	updateEditor = tinymce.init({
		selector: "#update-input",
		language: "ko_KR",
		height: 200,
		menubar: false,
		resize: false,
		plugins: [
			"advlist", "autolink", "lists", "link",
			"image", "charmap", "preview", "anchor",
			"searchreplace", "visualblocks", "code", "fullscreen",
			"insertdatetime", "media", "table", "help",
			"wordcount", "emoticons",
		],
		toolbar:
			"bold italic underline strikethrough | forecolor backcolor | bullist numlist | outdent indent | charmap emoticons",
		content_style:
			"body { font-family:Helvetica,Arial,sans-serif; font-size:16px }",
	});
	
}

// 댓글 수정 div 생성 함수
function createUpdateDiv(content, confirmButtonFunction, cancelButtonFunction){
	const updateDiv = document.createElement("div");
	updateDiv.id = "update-div";
	
	const updateInput = document.createElement("textarea");
	updateInput.id = "update-input";
	updateInput.value = content;
	
	
	const confirmButton = document.createElement("button");
	confirmButton.id = "confirm-button";
	confirmButton.innerText = "확인";
	confirmButton.className = "btn btn-sm btn-outline-secondary";
	confirmButton.addEventListener("click", confirmButtonFunction);
		
	const cancelButton = document.createElement("button");
	cancelButton.id = "cancel-button";
	cancelButton.innerText = "취소";
	cancelButton.className = "btn btn-sm btn-outline-danger";
	cancelButton.addEventListener("click", cancelButtonFunction);
		
	updateDiv.appendChild(updateInput);
	updateDiv.appendChild(confirmButton);
	updateDiv.appendChild(cancelButton);
	
	return updateDiv;
}

// 댓글 수정 요청 함수
function updateComment(cno, updateContent, contentElement){
	fetch('updateComment', {
		method: "POST",
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			cno: cno,
			content: updateContent,
		})
	})
	.then(() => {
		contentElement.innerHTML = updateContent;
	})
	.catch(error => {
        console.error(error);
    });
}

// 댓글 추가 함수
function initCommentEditor() {
	return tinymce.init({
		selector: ".comment-tinyeditor",
		language: "ko_KR",
		height: 200,
		menubar: false,
		resize: false,
		plugins: [
    		"advlist", "autolink", "lists", "link",
    		"image",  "charmap", "preview", "anchor",
    		"searchreplace", "visualblocks", "code", "fullscreen",
    		"insertdatetime", "media", "table", "help",
    		"wordcount", "emoticons",
  		],
		toolbar:
			"bold italic underline strikethrough | forecolor backcolor | bullist numlist | outdent indent | charmap emoticons",
		content_style:
			"body { font-family:Helvetica,Arial,sans-serif; font-size:16px }",
		});
}