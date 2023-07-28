// 댓글 수정 요청 처리 AJAX
$(".update-comment").on("click", function (event) {
  const cno = $(event.target)
    .parent()
    .parent()
    .parent()
    .siblings()[0].innerText;
  const content = $(event.target)
    .parent()
    .parent()
    .parent()
    .siblings()[2].innerHTML;

  if ($("#update-div").length) {
    $("#update-div").remove();
  } else {
    const updateDiv = $("<div>").prop("id", "update-div");
    const updateInput = $("<input>").prop("id", "update-input").val(content);
    const updateButton = $("<button>")
      .prop("id", "update-button")
      .text("수정")
      .click(function (event) {
        const updateContent = $(event.target).siblings()[0].value;
        $.ajax({
          url: "updateComment",
          type: "post",
          data: {
            cno: cno,
            content: updateContent,
          },
          success: function () {
            updateDiv.parent().siblings()[2].innerHTML = updateContent;
            updateDiv.remove();
          },
        });
      });
    updateButton.addClass("update-comment btn btn-outline-secondary");
    const cancelButton = $("<button>")
      .text("취소")
      .click(function (event) {
        updateDiv.remove();
      });
    cancelButton.addClass("btn btn-outline-danger");
    updateDiv.append(updateInput);
    updateDiv.append(updateButton);
    updateDiv.append(cancelButton);
    $(this).parent().parent().parent().append(updateDiv);
  }
});
