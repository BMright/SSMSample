/*加载省下拉选
$(function () {
	$.ajax({
        type: "post",
        url: "<%=path%>/brand/getFirstClass",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                $('#firstClass').append("<option value='" + data[i].firstClass_id + "' >" + data[i].firstClass_name + "</option>");
            }
        },
        error: function () {
            alert("加载省失败");
        }
    });
});*/

/*function getCity() {
    var id = $("#province_code").val();
    $("#city_code").empty();
    $("#area_code").empty();
    $.ajax({
        type: "post",
        url: "${ctx}/shop/area/getCity",
        data: {"id": id},
        success: function (data) {
            $('#city_code').append("<option value='' selected='selected' >" + '请选择' + "</option>");
            $('#area_code').append("<option value='' selected='selected' >" + '请选择' + "</option>");
            for (var i = 0; i < data.length; i++) {
                $('#city_code').append("<option value='" + data[i].id + "' >" + data[i].aName + "</option>");
            }
        },
        error: function () {
            alert("加载市失败");
        }
    });
};*/

/*//按回车键提交
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
});*/