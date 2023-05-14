<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<div class="container">

	<form>
		<div class="form-group">
			<label for="title">제목</label> <input type="text" class="form-control"
				placeholder="제목을 입력하세요." id="title">
		</div>

		<div class="form-group">
			<label for="content">내용</label>
			<textarea class="form-control summernote" rows="5" id="content"></textarea>
		</div>

	</form>
	<button id="btn-save" class="btn btn-primary">저장하기</button>

</div>

<script>
	$('.summernote').summernote({
		placeholder : '내용을 입력하세요.',
		tabsize : 2,
		height : 100
	});
</script>
<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>
