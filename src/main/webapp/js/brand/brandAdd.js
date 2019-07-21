//按回车键提交
$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		$(".submit_login").click();
	}
});

//点击提交键提交
$(document).ready(function() {
	$(".submit_login").click(function() {
		alert("asfda");
		$.ajax({
     	   	type: "POST",
      	  	url: '<%=path%>/brand/brandadd',
      	  	data: $('#form1').serialize(),
      	  	dataType: "json",
        	success: function (result) {
        		debugger;
         		if(result.status == 200){
         			alert("提交成功");
         		}else{
         			alert("提交失败");
         		}
        	},
        	error: function(data) {
        		alert("提交异常");
         	}
    	});
	});
});