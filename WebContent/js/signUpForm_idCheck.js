const form = $("#signup-form");
const idCheckButton = $("#id-check");
const inputId = $("#id");

idCheckButton.on("click", function (event) {
  event.preventDefault();
  $.ajax({
    url: "idCheck",
    type: "post",
    data: { id: inputId.val() },
    success: function (resp) {
      if (resp == "true") {
        inputId.val("");
        inputId.addClass("is-invalid");
        inputId.siblings()[0].innerText = "이미 존재하는 ID입니다.";
        form.attr("data-duplicateCheck", "fail");
      } else {
        inputId.removeClass("is-invalid");
        inputId.siblings()[0].innerText = "ID";
        form.attr("data-duplicateCheck", "pass");
      }
    },
  });
});

inputId.on("change", function () {
  form.attr("data-duplicateCheck", "fail");
});

$("#btn-submit").on("click", function (event) {
  event.preventDefault();
  if (form.attr("data-duplicateCheck") == "pass") {
    form.submit();
  } else {
    inputId.addClass("is-invalid");
    inputId.siblings()[0].innerText = "ID 중복 검사를 해주세요.";
    inputId.focus();
  }
});
