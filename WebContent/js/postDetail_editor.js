//댓글용 텍스트 에디터 객체
tinymce.init({
  selector: ".comment-tinyeditor",
  language: "ko_KR",
  height: 200,
  menubar: false,
  resize: false,
  plugins: [
    "advlist",
    "autolink",
    "lists",
    "link",
    "image",
    "charmap",
    "preview",
    "anchor",
    "searchreplace",
    "visualblocks",
    "code",
    "fullscreen",
    "insertdatetime",
    "media",
    "table",
    "help",
    "wordcount",
    "emoticons",
  ],
  toolbar:
    "bold italic underline strikethrough | forecolor backcolor | bullist numlist | outdent indent | charmap emoticons",
  content_style:
    "body { font-family:Helvetica,Arial,sans-serif; font-size:16px }",
});
