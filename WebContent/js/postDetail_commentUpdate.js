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
	
	// 댓글 수정 창 생성 (이미 존재하면 삭제)
	if(document.querySelector("#update-div") != null){
		document.querySelector("#update-div").remove();
	} else {
		const updateDiv = createUpdateDiv(
			content,
			() => {
				const updateContent = document.querySelector("#update-input").value;
				updateComment(cno, updateContent, contentElement);
				updateDiv.remove();
			},
			() => {updateDiv.remove()}
		);
		
		event.target.parentElement.parentElement.parentElement.parentElement.appendChild(updateDiv);
	}
}

// 댓글 수정 div 생성 함수
function createUpdateDiv(content, confirmButtonFunction, cancelButtonFunction){
	const updateDiv = document.createElement("div");
	updateDiv.id = "update-div";
	
	const updateInput = document.createElement("input");
	updateInput.id = "update-input";
	updateInput.value = content;
	
	const confirmButton = document.createElement("button");
	confirmButton.id = "confirm-button";
	confirmButton.innerText = "확인";
	confirmButton.className = "btn btn-outline-secondary";
	confirmButton.addEventListener("click", confirmButtonFunction);
		
	const cancelButton = document.createElement("button");
	cancelButton.id = "cancel-button";
	cancelButton.innerText = "취소";
	cancelButton.className = "btn btn-outline-danger";
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