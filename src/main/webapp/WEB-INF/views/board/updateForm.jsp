<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	<div
		class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">게시글 수정</h1>
	</div>
	<div class="container">

		<form>
			<input type="hidden" id="id" value="${board.id}" />
			<div class="form-group">
				<label for="title">제목</label> <input value="${board.title}"
					type="text" class="form-control" placeholder="제목을 입력하세요."
					id="title">
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control summernote" rows="5" id="content">${board.content}</textarea>
			</div>

		</form>
		<button id="btn-update" class="btn btn-primary">수정완료</button>
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