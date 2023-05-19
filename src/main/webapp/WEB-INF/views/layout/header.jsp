<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

<!DOCTYPE html>
<html lang="utf-8">
<head>
<title>정희의 블로그</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
</script>

</head>

<body>

	<header class="p-3 mb-3 border-bottom">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
				<a href="/"
					class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
					<svg class="bi me-2" width="40" height="32" role="img"
						aria-label="Bootstrap">
						<use xlink:href="#bootstrap" /></svg>
				</a>

				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="/" class="nav-link px-2 link-secondary"><h4>BLOG</h4></a></li>
				</ul>

				<div class="dropdown text-end">
					<div class="text-end">
						<c:choose>
							<c:when test="${empty principal}">
								<a href="/auth/loginForm">로그인</a>&nbsp;
								<a class="btn btn-primary rounded-pill px-3"
									href="/auth/joinForm">회원가입</a>
							</c:when>
							<c:otherwise>
								<div class="dropdown">
									<a class="btn" data-toggle="dropdown"><img class="me-3"
										src="/image/human.png" href="/auth/loginForm" alt=""
										data-bs-toggle="dropdown" width="30" height="30"></a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="/user/updateForm">회원정보</a> <a
											class="dropdown-item" href="/logout">로그아웃</a>
									</div>
								</div>

							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</header>
