<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav.jsp"%>
<html>
<head>
	<!-- CKEditor5 코드 -->
	<script>
		function MyCustomUploadAdapterPlugin(editor) {
		    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
		        return new UploadAdapter(loader);
		    }
		}
	</script>
	<!-- /CKEditor5 코드 -->
	<style>
		.ck-editor__editable {min-height:500px;}
	</style>
	<script>
		$(function() {
			$("#board_subject").on("propertychange change paste input", function() {
				if($("#board_subject").val().replace(/\s+/g,"")=="") {
					$("#board_subject").val(null);
				}
			});
		});
	</script>
	<link href="${pageContext.request.contextPath}/resources/css/form-validation.css" rel="stylesheet">
</head>
<main style="padding-top:60px;">
	<form class="row g-1 needs-validation" method="post" action="${pageContext.request.contextPath}/insert_board.do" enctype="multipart/form-data" style="margin:5% 20% 5% 20%;" novalidate>
		<div class="col-md-12">
			<input type="text" name="board_subject" class="form-control" id="board_subject" required placeholder="제목을 입력하세요" required>
			<div class="invalid-feedback">
				제목을 입력하세요
			</div>
		</div>
		<div class="col-md-12">
			<textarea class="editor" name="board_content" id="board_content" required placeholder="내용을 입력하세요"></textarea>
			<div class="invalid-feedback">
				내용을 입력하세요
			</div>
		</div>
		<div class="col-12" style="text-align:right;">
			<button class="btn btn-primary" type="submit">확인</button>
			<button type="button" class="btn btn-danger" onclick="history.go(-1)">취소</button>
		</div>
		<input type="hidden" name="code" value="${code}">
	</form>
</main>
<!-- CKEditor5 -->
<script src="${pageContext.request.contextPath}/resources/ckeditor/build/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/resources/ckeditor/UploadAdapter.js"></script>
<script>
	ClassicEditor
		.create( document.querySelector( '.editor' ), {
			extraPlugins: [MyCustomUploadAdapterPlugin],	// 이미지 업로드 어댑터
			licenseKey: '',
			mediaEmbed: {									// 동영상 업로드
			    previewsInData:true
			},
		})
		.then( editor => {
			window.editor = editor;
		})
		.catch( error => {
			console.error( error );
		});
</script>
<!-- /CKEditor5 -->
<script src="${pageContext.request.contextPath}/resources/js/form-validation.js"></script>
</html>
<%@ include file="../footer.jsp"%>