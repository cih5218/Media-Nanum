<!-- 

	@FileName : forgot_account.jsp
	@Project : NANUM
	

-->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- reset -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					$("#loginBtn").click(
							function() {
								$.ajax({
									type : "post",
									url : "id_search.nn",
									data : {"name":$('#name').val(), "number" :$('#number').val()},
									success : function(data) {  
										data = JSON.parse(data);
										if(data.email == null){
											alert("해당되는 이메일이 없습니다. 다시 확인해 주세요");
										}else{
											alert("사용하시는 이메일은 " + data.email + " 입니다.");
										}
									},
									error: function(xhr){						
									alert(xhr.status);
								}
								});
							});
					$("#pwdBtn").click(
							function() {
								$.ajax({
									type : "post",
									url : "forgot.nn",
									data : {"pwdname":$('#pwdname').val(), "email":$('#email').val()},
									success : function(data) {
										data = JSON.parse(data);
										if(data.result == 0){
											alert("등록되어있지 않는 이메일 입니다.");
										}else{
											alert("임시 비밀번호를 발송하였습니다");
										}
									},
									error: function(xhr){						
										alert(xhr.status);
									}
								});
							});		
				})
	</script>  
	<title>NANUM 계정 관리</title>
</head>
<body>
	<div id="wrap">
        <div id="login-wrap">
            <div class="login-logo">
                <a href="index.nn">
                    <img src="${pageContext.request.contextPath}/resources/images/login-logo.png" alt="login-logo">
                </a>
            </div>
            
            
            <div class="login-box">
                <div class="margin-b15">
                    <h3>아이디 찾기</h3>
                </div>
                <form method="post" action="">
                    <div class="login-form">
                        <label for="name">본명</label>
                        <input type="text" name="name" id="name" class="form-controll" placeholder="본명">
                    </div>
                    <div class="login-form">
                        <label for="password">휴대폰 번호</label>
                        <input type="text" name="number" id="number" class="form-controll" placeholder="휴대폰 번호">
                    </div>
                    <ul class="sub-list">
                        <li>NANUM 본인인증시 사용하였던 휴대전화로 가입 시 등록했던 이메일을 보내드립니다</li>	   
                    </ul>
                    <div class="margin-15">
                        <input type="button" name="loginBtn" id="loginBtn" class="btn btn-primary" value="아이디 찾기">
                    </div>
                </form>
            </div>
            <div class="login-box">
                <div class="margin-b15">
                    <h3>비밀빈호 찾기</h3>
                </div>
                <form method="post" action="">
                    <div class="login-form">
                        <label for="pwdname">본명</label>
                        <input type="text" name="pwdname" id="pwdname" class="form-controll" placeholder="본명">
                    </div>
                    <div class="login-form">
                        <label for="email">이메일</label>
                        <input type="text" name="email" id="email" class="form-controll" placeholder="이메일">
                    </div>
                    <ul class="sub-list">
                        <li>NANUM 가입 시 등록했던 이메일 입력시, 임시 비밀번호가 발급됩니다</li>	          
                    </ul>
                    <div class="margin-15">
                        <input type="button" name="loginBtn" id="pwdBtn" class="btn btn-primary" value="비밀번호 찾기">
                    </div>
                </form>
                
                <div class="row-login">
                    <div class="r-l-left">
                        <a href="login.nn">로그인</a>
                    </div>
                    <div class="r-l-right">
                        <a href="signup.nn">무료 회원가입</a>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <h5>Copyright &copy; 2017 Nanum Inc. All rights reserved.</h5>
            </div>
            
        </div>
	</div>
</body>
</html>