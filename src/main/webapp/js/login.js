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