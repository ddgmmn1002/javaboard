$("#signin-btn").on("click", function (event) {
  console.log(event);
  const id = $("#signin-id").val();
  const pw = $("#signin-password").val();
  $.ajax({
    url: "signIn",
    type: "post",
    data: {
      id: id,
      pw: pw,
    },
    success: (response) => {
      if (response == "1") {
        location.reload();
      } else {
        alert("로그인 정보를 확인해주세요.");
      }
    },
  });
});
