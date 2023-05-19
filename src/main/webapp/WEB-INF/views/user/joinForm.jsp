<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 ">
	<br> <br>
	<div class="container d-flex justify-content-center">

		<div class="card" style="width: 30rem;">
			<div class="card-body">
				<br> <br> <br>
				<h2 class="card-title text-center">JOIN US</h2>
				<br>

				<div class="form-floating">
					<form>
						<div class="form-group">
							<p class="fw-semibold">아이디</p>
							<input type="text" class="form-control"  id="user">
						</div>
						
						<div class="form-group">
							<p class="text-start">이름</p>
							<input type="text" class="form-control"  id="username">
						</div>

						<div class="form-group">
						<p class="text-start">비밀번호</p>
							<input type="password" class="form-control" id="password">
						</div>
						
						<div class="form-group">
						<p class="text-start">비밀번호 확인</p>
							<input type="password" class="form-control" id="password">
						</div>

						<div class="form-group">
						<p class="text-start">이메일</p>
							<input type="email" class="form-control" id="email">
						</div>
					</form>
					<br>
					<button id="btn-save" class="w-100 btn btn-lg btn-primary">가입하기</button>
				</div>
				</br />
				<br />
			</div>
		</div>
	</div>


	<script src="/js/user.js"></script>