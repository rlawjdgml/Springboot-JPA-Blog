<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu"
			class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="sidebar-sticky pt-3">
				<ul class="nav flex-column">
					<a type="button" class="btn btn-primary" href="/board/saveForm">
						+ 글쓰기</a>
					<br />
					<ul class="list-unstyled mb-0">
						<li><a href="/"
							class="dropdown-item d-flex align-items-center gap-2 py-2 bg-light text-gray-darktext-primary">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
									fill="currentColor" class="bi bi-file-earmark-text"
									viewBox="0 0 16 16">
  <path
										d="M5.5 7a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1h-5zM5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z" />
  <path
										d="M9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.5L9.5 0zm0 1v2A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z" />
</svg>&nbsp;&nbsp;게시판
						</a></li>
						<li><a
							class="dropdown-item d-flex align-items-center gap-2 py-2 text-primary"
							href="/favoriteForm"><svg xmlns="http://www.w3.org/2000/svg" width="16"
									height="16" fill="currentColor" class="bi bi-bookmarks-fill"
									viewBox="0 0 16 16">
  <path
										d="M2 4a2 2 0 0 1 2-2h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L7 13.101l-4.223 2.815A.5.5 0 0 1 2 15.5V4z" />
  <path
										d="M4.268 1A2 2 0 0 1 6 0h6a2 2 0 0 1 2 2v11.5a.5.5 0 0 1-.777.416L13 13.768V2a1 1 0 0 0-1-1H4.268z" />
</svg>&nbsp;&nbsp;즐겨찾기 </a></li>
						<li><a
							class="dropdown-item d-flex align-items-center gap-2 py-2 text-gray-dark"
							"
								href="/monthlyForm"><svg xmlns="http://www.w3.org/2000/svg"
									width="16" height="16" fill="currentColor"
									class="bi bi-calendar3" viewBox="0 0 16 16">
  <path
										d="M14 0H2a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zM1 3.857C1 3.384 1.448 3 2 3h12c.552 0 1 .384 1 .857v10.286c0 .473-.448.857-1 .857H2c-.552 0-1-.384-1-.857V3.857z" />
  <path
										d="M6.5 7a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm-9 3a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm3 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" />
</svg>&nbsp;&nbsp;일정 확인 </a></li>
			</div>
		</nav>
		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

			<!-- <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas> -->


			<div class="container">
				<form class="form-inline d-flex justify-content-end" method="GET"
					th:action="@{/}">
					<div class="input-group mb-3">
						<input type="searchText" name="searchText" class="form-control"
							placeholder="검색어를 입력하세요">
						<div class="input-group-append">
							<button class="btn" type="submit">
								<img class="me-3" src="/image/search.png" href="/auth/loginForm"
									alt="" width="25" height="25">
							</button>
						</div>
					</div>
				</form>
				<br>

				<div
					class="d-flex align-items-center p-3 my-3 text-white bg-purple rounded shadow-sm">
					<img class="me-3" src="/image/clipboard.png" alt="" width="48"
						height="38">
					<div class="lh-1">
						<h1 class="h6 mb-0 text-dark lh-1">게시판의 글을 남겨주세요</h1>
					</div>
				</div>

				<div class="my-3 p-3 bg-white rounded shadow-sm">
					<h6 class="border-bottom border-gray pb-2 mb-0">
						<input class="form-check-input" type="checkbox" name="chkAll" onclick="selectAll(this)"
							id="flexCheckDefault" />게시글 목록
					</h6>
					<c:forEach var="board" items="${boards.content}">
						<div class="media text-muted pt-3">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="chk"
									id="flexCheckDefault"> <label class="form-check-label"
									for="flexCheckDefault"> </label>
							</div>
							&nbsp;
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								fill="currentColor" class="bi bi-star" viewBox="0 0 16 16">
  <path
									d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
</svg>
							&nbsp; <img class="me-3" src="/image/star1.png" id="img1" alt=""
								width="25" height="25">&nbsp;

							<div
								class="media-body pb-3 mb-0 lh-125 border-bottom border-gray">
								<div
									class="d-flex justify-content-between align-items-center w-100">

									<strong class="text-gray-dark fs-2">${board.title}</strong> <a
										href="/board/${board.id}" class="btn btn-primary">상세보기</a>
									<!-- <a href="#">Follow</a> -->
								</div>
								<span class="d-block">&nbsp;${board.user.username}</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 
		<c:forEach var="board" items="${boards.content}">
			<div class="card m-2">
				<div class="card-body">
					<h4 class="card-title">${board.title}</h4>
					<a href="/board/${board.id}" class="btn btn-primary">상세보기</a>
				</div>
			</div>
		</c:forEach>
		<br />
		 -->
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${boards.first}">
						<li class="page-item disabled"><a class="page-link"
							href="?page=${boards.number-1}">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="?page=${boards.number-1}">Previous</a></li>
					</c:otherwise>
				</c:choose>

				<c:choose>
					<c:when test="${boards.last}">
						<li class="page-item disabled"><a class="page-link"
							href="?page=${boards.number+1}">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link"
							href="?page=${boards.number+1}">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
	</div>

	<script src="/js/like.js"></script>
	<%@ include file="layout/footer.jsp"%>