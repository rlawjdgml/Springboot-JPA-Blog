<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
<br>
<br>
	<div class="container d-flex justify-content-center"">
		<div class="card" style="width: 30rem;">
			<div class="card-body">
				<br> <br> <br>
				<h2 class="card-title text-center">LOGIN</h2>
				<br>

				<div class="form-floating">
					<form action="/auth/loginProc" method="post">
						<div class="form-check mb-3">
							<label class="form-check-label"> <input id="remember"
								type="checkbox" class="form-check-input" name="remember">
								아이디 저장
							</label>
						</div>
						<div class="form-group">
							<input type="text" name="username" class="form-control"
								placeholder="아이디" id="username">
						</div>

						<div class="form-group">
							<input type="password" name="password" class="form-control"
								placeholder="비밀번호" id="password">
						</div>
						<br />
						<button id="btn-login" class="w-100 btn btn-lg btn-primary" onclick="loginProcess()">로그인</button>
				</div>
				</form>
				<br /><br />
			</div>
		</div>
	</div>
	</div>

	<script src="/js/login.js"></script>