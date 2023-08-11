<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <div id="editorContainer1"></div>
  <button id="createEditorButton">두 번째 에디터 생성</button>
  <div id="editorContainer2"></div>

  <script>
  $(document).ready(function() {
      // 첫 번째 편집기 생성 및 초기화
      tinymce.init({
        selector: '#editorContainer1',
        plugins: 'link image media',
        toolbar: 'bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | numlist bullist outdent indent | link',
      });

      // 두 번째 편집기 생성 버튼 클릭 이벤트 처리
      $('#createEditorButton').click(function() {
        // 두 번째 편집기 생성 및 초기화
        tinymce.init({
          selector: '#editorContainer2',
          plugins: 'link image media',
          toolbar: 'bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | numlist bullist outdent indent | link',
        });
      });
    });
  </script>
</body>
</html>