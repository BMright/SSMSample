<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<title>计算器</title>
<script type="text/javascript">
	$(function() {
		$("#calc").click(function() {
			var param = {
				"a" : $("#a1").val(),
				"b" : $("#b1").val()
			}
			var url = root + "/sample/testAjax"
			$.ajax({
				type : "POST",
				url : url,
				data : param,
				dataType : 'json',
				success : function(result) {
					$("#sum1").val(result.sum);
					//document.getElementById("#sum1").value = result.sum;
				},
				error : function(result) {
					alert("系统错误！")
				}
			});
		})
	})
</script>
</head>
<body>
	<h3>form提交</h3>
	<form method="post" action="<%=path%>/sample/calcResult">
		<input id="a" name="a" /> + <input id="b" name="b" />
		<button type="submit">计算</button>
	</form>
	<h3>Ajax方式</h3>
	<input id="a1" name="a1" /> +
	<input id="b1" name="b1" /> =
	<input id="sum1" name="sum1" />
	<input type="button" id="calc" name="calc" value="动态计算" />
	<br>
	<h3>页面跳转</h3>
	<a href="<%=path%>/sample/helloWorld?username=战三&pwd=123">跳转</a>
</body>