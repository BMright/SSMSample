<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<!Doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<base href="<%= basePath %>" />
		<title>登录页面</title>
		<style type="text/css">
			body{
				background-image:url(<%=basePath %>/assets/imgs/bg_login.jpg);
				background-repeat:no-repeat;
				background-size:100% 100%;
			}
			#main_login{
				width:500px;
				margin:0 auto;
			}
			.logo_login{
				margin:128px 0 20px 0;
			}
			input{
				border:0;
			}
			.p_login{
				font-size:18px;
				color:#074BA0;
				border-bottom:1px solid #074BA0;
			}
			.submit_login{
				margin:52px  0 0 316px;
				width:184px;
				height:60px;
				font-size:24px;
				color:white;
				background-color:#074BA0;
			}
			
		</style>
		<%-- <script src="<%=basePath %>/js/login.js" type="text/javascript"></script> --%>
		<script type="text/javascript">
			$(document).keydown(function(event){
				if(event.keyCode==13){
					$(".submit_login").click();
				}
			});
		
			$(document).ready(function(){
				$(".submit_login").click(function(){
					debugger;
					$.ajax({
                 	   	type: "POST",
                  	  	url: "<%=path%>/login/getUserByUsername",
                  	  	data: {
                  	  		"username":$("#username").val(),
                  	  		"password":$("#password").val()
                  	  	},
                  	  	dataType: "json",
                    	success: function (result) {
                    		debugger;
                     		if(result.status == 200){
                     			window.location.href='<%=path%>/home/home';
                     		}else{
                     			alert("密码错误");
                     		}
                    	},
                    	error: function(data) {
                    		alert("账户不存在");
                     	}
                	});
				});
			});
		</script>
	</head>
	<body>
		<div id="main_login">
			<img src="<%=basePath %>/assets/imgs/logo_login.png" class="logo_login"/>
			<p style="color:red;font-weight:900">${msg }</p>
			<form action="" method="post">
					<p class="p_login">用户名：<input id="username" class="input_login" type="text" name="username" value="${pd.username }"/></p>
					<br/>
					<p class="p_login">密&nbsp;&nbsp;&nbsp;码：<input id="password" class="input_login" type="password" name="password" value="${pd.password }"/></p>
					<input class="submit_login" type="button" value="登录" style="cursor:pointer"/>
			</form>			
		</div>
	</body>
</html>