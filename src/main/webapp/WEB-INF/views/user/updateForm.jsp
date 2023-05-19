<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>


<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	<div class="container d-flex justify-content-center">
		<div class="card" style="width: 30rem;">
			<div class="card-body">
				<br>

				<div class="container ">
				<center><img src="/image/human.png" class="rounded-circle" width="150" height="150"></center>
				<br> <br>
					<input type="hidden" id="id" value="${principal.user.id}" />
					<div class="form-group">
						<label for="username">아이디</label> <input type="text"
							value="${principal.user.username}" class="form-control"
							placeholder="Enter username" id="username" readonly>
					</div>

					<div class="form-group">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" placeholder="변경할 비밀번호를 입력하세요" id="password">
					</div>

					<div class="form-group">
						<label for="email">이메일</label> <input type="email"
							value="${principal.user.email}" class="form-control"
							placeholder="변경할 이메일을 입력하세요" id="email">
					</div>
					<button id="btn-update" class="btn btn-primary">수정 완료</button>
				</div>
			</div>
		</div>
	</div>
	<!--  -->

		<script src="/js/user.js"></script>
