


//回车触发提交按钮点击事件
$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		$(".submit_login").click();
	}
});

//提交按钮点击事件
$(document).ready(function() {
	$(".submit_login").click(function() {
		alert("asdfadf");
		debugger;
		$.ajax({
			type : "POST",
			url : "<%=path%>/brandAjax/addBrand",
			data : $('#form1').serialize(),
			dataType : "json",
			success : function(result) {
				/* debugger; */
				if (result.status == 200) {
					window.location.href = '<%=path%>/login/login';
				} else {
					alert("密码错误");
				}
			},
			error : function(data) {
				alert("账户不存在");
			}
		});
	});
});