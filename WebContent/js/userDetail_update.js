const updateButton = document.querySelector("#updateButton");
updateButton.addEventListener("click", function (event) {
	event.preventDefault();
	
	// 아이디
	const userId = document.querySelector("#user-id");
	const userIdInput = document.createElement("input");
	userIdInput.value = userId.innerText;
	userIdInput.setAttribute("hidden", "hidden");
	userIdInput.setAttribute("name", "id");
	userId.parentElement.append(userIdInput);
	
	// 이름
	const userName = document.querySelector("#user-name");
	const userNameInput = document.createElement("input");
	userNameInput.setAttribute("name", "name");
	userNameInput.value = userName.innerText;
	userNameInput.classList.add("form-control");
	userName.parentElement.append(userNameInput);
	userName.remove();
	
	// 생년월일
	const userBirth = document.querySelector("#user-birthdate");
	const userBirthInput = document.createElement("input");
	userBirthInput.setAttribute("name", "birth");
	userBirthInput.value = userBirth.innerText;
	userBirthInput.classList.add("form-control");
	userBirth.parentElement.append(userBirthInput);
	userBirth.remove();
	
	// 연락처
	const userPhone = document.querySelector("#user-phone");
	const userPhoneInput = document.createElement("input");
	userPhoneInput.setAttribute("name", "phone");
	userPhoneInput.value = userPhone.innerText;
	userPhoneInput.classList.add("form-control");
	userPhone.parentElement.append(userPhoneInput);
	userPhone.remove();
	
	// 이메일
	const userEmail = document.querySelector("#user-email");
	const userEmailInput = document.createElement("input");
	userEmailInput.setAttribute("name", "email");
	userEmailInput.value = userEmail.innerText;
	userEmailInput.classList.add("form-control");
	userEmail.parentElement.append(userEmailInput);
	userEmail.remove();
	
	// 성별
	const userGender = document.querySelector("#user-gender");
	const userGenderMale = document.createElement("input");
	const userGenderFemale = document.createElement("input");
	
	userGenderMale.setAttribute("name", "gender");
	userGenderMale.setAttribute("type", "radio");
	userGenderMale.value = "m"
	
	userGenderFemale.setAttribute("name", "gender");
	userGenderFemale.setAttribute("type", "radio");
	userGenderFemale.value = "f"
	
	if (userGender.innerText == "남성") {
		userGenderMale.setAttribute("checked", "checked");
	} else{
		userGenderFemale.setAttribute("checked", "checked");
	}
	
	const maleLabel = document.createElement("label");
	maleLabel.innerText = "남성";
	maleLabel.classList.add("ms-2");
	userGender.parentElement.append(maleLabel);
	userGender.parentElement.append(userGenderMale);
	
	const femaleLabel = document.createElement("label");
	femaleLabel.innerText = "여성";
	femaleLabel.classList.add("ms-2");
	userGender.parentElement.append(femaleLabel)
	userGender.parentElement.append(userGenderFemale);
	
	userGender.remove();
	
	// 가입일자
	const userSignupDate = document.querySelector("#user-signupdate");
	const userSignupDateInput = document.createElement("input");
	userSignupDateInput.setAttribute("name", "signupdate");
	userSignupDateInput.value = userSignupDate.innerText;
	userSignupDateInput.classList.add("form-control");
	userSignupDate.parentElement.append(userSignupDateInput);
	userSignupDate.remove();
	
	// 닉네임
	const userNickname = document.querySelector("#user-nickname");
	const userNicknameInput = document.createElement("input");
	userNicknameInput.setAttribute("name", "nickname");
	userNicknameInput.value = userNickname.innerText;
	userNicknameInput.classList.add("form-control");
	userNickname.parentElement.append(userNicknameInput);
	userNickname.remove();
	
	// 회원등급
	const userGrade = document.querySelector("#user-grade");
	const userGradeSelect = document.createElement("select");
	userGradeSelect.setAttribute("name", "grade");
	userGradeSelect.classList.add("form-select");
	
	const optionRegular = document.createElement("option");
	optionRegular.value = "regular";
	optionRegular.innerText = "일반";
	const optionCritic = document.createElement("option");
	optionCritic.value = "critic";
	optionCritic.innerText = "평론가";
	
	userGradeSelect.appendChild(optionRegular);
	userGradeSelect.appendChild(optionCritic);
	userGrade.parentElement.append(userGradeSelect);
	userGrade.remove();
	
	// 이용자 차단 여부
	const userBlocked = document.querySelector("#user-blocked");
	const userBlockedDiv = document.createElement("div");
	userBlockedDiv.classList.add("form-check");
	userBlockedDiv.classList.add("form-switch");
	
	const userBlockedToggle = document.createElement("input");
	userBlockedToggle.setAttribute("type", "checkbox");
	userBlockedToggle.setAttribute("role", "switch");
	userBlockedToggle.classList.add("form-check-input");
	
	if (userBlocked.innerText != "X") {
		userBlockedToggle.setAttribute("checked", "checked")
	}
	
	userBlockedDiv.appendChild(userBlockedToggle);
	userBlocked.parentElement.appendChild(userBlockedDiv);
	userBlocked.remove();
	
	
	
	// submit
	const submitButton = document.createElement("input");
	submitButton.setAttribute("type", "submit");
	submitButton.value = "확인";
	submitButton.className = "btn btn-primary";
	
	event.target.parentElement.append(submitButton);
	event.target.remove();
});