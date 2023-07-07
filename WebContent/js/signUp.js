/* const form = document.querySelector("#signup-form");
	const idCheckButton = document.querySelector("#idCheckButton");
	const inputId = document.querySelector("#id");
	
	idCheckButton.addEventListener('click', function (event) {
		event.preventDefault();
		const xhr = new XMLHttpRequest();
		xhr.onload = function (){
			const result = this.responseText;
			if(result == "true"){
				inputId.value = "";
				inputId.classList.add("duplicate");
				inputId.setAttribute("placeholder", "이미 존재하는 ID입니다.")
				form.setAttribute("duplicateCheck", "fail");
			}else{
				inputId.classList.remove("duplicate");
				inputId.setAttribute("placeholder", "ID")
				form.setAttribute("duplicateCheck", "pass");
			}
		}
		xhr.open("Post", "idcheck", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("id=" + inputId.value);
	});
	
	inputId.addEventListener("change", function(){
		form.setAttribute("duplicateCheck", "fail");
	});
	
	form.addEventListener("submit", function (event) {
		event.preventDefault();
		if (form.getAttribute("duplicateCheck") == "pass") {
			form.submit();
		}
	}); */
	
	const form = $("#signup-form");
	const idCheckButton = $("#idCheckButton");
	const inputId = $("#id");
	
	idCheckButton.on("click", function(event){
		event.preventDefault();
		$.ajax({
			url: "idCheck",
			type: "post",
			data: {"id": inputId.val()},
			success: function (resp) {
				if (resp == "true") {
					inputId.val("");
					inputId.addClass("duplicate");
					inputId.attr("placeholder", "이미 존재하는 ID입니다.");
					form.attr("data-duplicateCheck", "fail");
				} else {
					inputId.removeClass("duplicate");
					inputId.attr("placeholder", "ID");
					form.attr("data-duplicateCheck", "pass");
				}
			}
		});
	});
	
	inputId.on("change", function(){
		form.attr("data-duplicateCheck", 'fail');
	});
	
	$("#btn").on("click", function(event){
		event.preventDefault();
		if (form.attr("data-duplicateCheck") == "pass") {
			form.submit();
		}else {
			alert("ID 중복확인 해주세요.")
		}
	});
	