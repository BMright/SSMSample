<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
<title>Hello World</title>
</head>
<body>
<a href="<%=path%>/sample/calc">跳转</a>
	<h1>${pd.NAME}</h1>
	<h2>${pd.username}</h2>
	<h3>${pd.pwd}</h3>
	<h1>${uuid}</h1>
	<form method="post" action="<%=path%>/sample/helloWorld">
		<label>用户名</label> <input id="username" name="username" /> <label>密码</label> <input type="password" id="password" name="password" />
		<button type="submit">提交</button>
		<label><%=basePath %></label>
	</form>
	<label>你刚刚输入的用户名和密码是：${pd.username} ${pd.password}</label>
</body>