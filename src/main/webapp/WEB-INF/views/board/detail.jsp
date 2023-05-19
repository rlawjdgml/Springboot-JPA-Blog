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
		<h1 class="h2">상세 화면</h1>
	</div>
	<div class="container">

		<form>
			<div>
			<!-- 
				글 번호 :<sapn id="id"> <i>${board.id} </i></sapn>  -->
				작성자 :
				<sapn id="id"> <i>${board.user.username} </i></sapn>
			</div>
			<br />
			<div class="form-group">

				<h3>${board.title}</h3>
			</div>
			<hr />
			<div class="form-group">
				<label for="content">내용</label>
				<div>${board.content}</div>
			</div>
			<hr />
		</form>
			<button class="btn btn-outline-secondary" onclick="history.back()">뒤로가기</button>
			<c:if test="${board.user.id == principal.user.id}">
				<a href="/board/${board.id}/updateForm" class="btn btn-outline-warning">수정하기</a>
				<button id="btn-delete" class="btn btn-outline-danger">삭제하기</button>
			</c:if>
		<br /> <br />

		<div class="card">
			<form>
				<input type="hidden" id="boardId" value="${board.id}" />
				<div class="card-body">
					<textarea id="reply-content" class="form-control" rows="1"></textarea>
				</div>
				<div class="card-footer">

					<button id="btn-reply-save" class="btn btn-primary">등록하기</button>
				</div>
			</form>
		</div>

		<br />
		<div class="card">
			<div class="card-header">댓글 목록</div>
			<ul id="reply--box" class="list-group">
				<c:forEach var="reply" items="${board.replys}">
					<li id="reply--1"
						class="list-group-item d-flex justify-content-between">
						<div>${reply.content}</div>
						<div class="d-flex">
							<div class="font-italic">작성자 : ${reply.user.username}&nbsp;</div>
							<c:if test="${reply.user.username == principal.user.username}">
								<button type="button" class="btn btn-outline-secondary">삭제</button>
							</c:if>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>


	</div>

	<script src="/js/board.js"></script>
	<%@ include file="../layout/footer.jsp"%>