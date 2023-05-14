let index = {
	init: function() {
		$("#btn-save").on("click", () => { //function(){}, ()=>{} this를 바인딩하기 위해서!!
			this.save();
		});

		$("#btn-delete").on("click", () => { //function(){}, ()=>{} this를 바인딩하기 위해서!!
			this.deleteById();
		});

		$("#btn-update").on("click", () => { //function(){}, ()=>{} this를 바인딩하기 위해서!!
			this.update();
		});

		$("#btn-reply-save").on("click", () => {
			this.replySave();
		});

	},

	save: function() {
		//alert('user의 함수 호츨됨');
		let data = {
			title: $("#title").val(),
			content: $("#content").val(),
			email: $("#email").val()
		};

		$.ajax({
			type: "POST",
			url: "/api/board",
			data: JSON.stringify(data), // http body 데이터
			contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지(MIME)
			dataType: "json" //요청을 서버로해서 응답이 왔을 떄 기본적으로 모든 것이 버퍼로 오기 때문에 문자열 (생긴게 json이라면) => javascript 오브젝트로 변경됨
			// 회원가입 수행 요청
		}).done(function(resp) {
			alert("글쓰기가 완료되었습니다.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},


	deleteById: function() {
		let id = $("#id").text();

		$.ajax({
			type: "DELETE",
			url: "/api/board/" + id,
			dataType: "json"
		}).done(function(resp) {
			alert("삭제가 완료되었습니다.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},


	update: function() {
		let id = $("#id").val();

		let data = {
			title: $("#title").val(),
			content: $("#content").val()
		};

		$.ajax({
			type: "PUT",
			url: "/api/board/" + id,
			data: JSON.stringify(data), // http body 데이터
			contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지(MIME)
			dataType: "json" //요청을 서버로해서 응답이 왔을 떄 기본적으로 모든 것이 버퍼로 오기 때문에 문자열 (생긴게 json이라면) => javascript 오브젝트로 변경됨
			// 회원가입 수행 요청
		}).done(function(resp) {
			alert("글 수정이 완료되었습니다.");
			location.href = "/";
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},


	replySave: function() {
		let data = {
			content: $("#reply-content").val()
		};
		let boardId = $("#boardId").val();
		
		consle.log(data);

		$.ajax({
			type: "POST",
			url: '/api/board/${boardId}/reply',
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp) {
			alert("댓글 작성이 완료되었습니다.");
			location.href = '/board';
		}).fail(function(error) {
			alert(JSON.stringify(error));
		});
	},

}

index.init();