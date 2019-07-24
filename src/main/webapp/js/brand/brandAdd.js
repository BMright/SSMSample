/*$(document).ready(function(){
  $("#div6img").click(function(){
    $("#upFile").click();
  });
});*/

/*//加载一级业态下拉选
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
});

加载二级业态下拉选
function getSecondClass() {
	$('#div3').hide();
	$('#div4').hide();
	
    var id = $("#firstClass").val();
    $("#secondClass").empty();
     $("#thirdClass").empty(); 
    $.ajax({
        type: "post",
        url: "<%=path%>/brand/getSecondClass",
        data: {"id": id},
        success: function (data) {
            $('#secondClass').append("<option value='' selected='selected' >" + '请选择' + "</option>");
            for (var i = 0; i < data.length; i++) {
                $('#secondClass').append("<option value='" + data[i].secondClass_id + "' >" + data[i].secondClass_name + "</option>");
            }
        },
        error: function () {
            alert("加载市失败");
        }
    });
};

加载三级业态下拉选
function getThirdClass() {
	$('#div3').show();
	$('#div4').show();
	
    var id = $("#secondClass").val();
     $("#thirdClass").empty(); 
    $.ajax({
        type: "post",
        url: "<%=path%>/brand/getThirdClass",
        data: {"id": id},
        success: function (data) {
             $('#secondClass').append("<option value='' selected='selected' >" + '请选择' + "</option>"); 
            for (var i = 0; i < data.length; i++) {
                if(i % 3 == 0){
                	$('#div5').append("<input type='checkbox' name='thirdClass_name' size='3'value='" + data[i].thirdClass_id + "'/>" + data[i].thirdClass_name + "<br>");
                }
                else if(i % 3 == 1){
                	$('#div51').append("<input type='checkbox' name='thirdClass_name' size='3'value='" + data[i].thirdClass_id + "'/>" + data[i].thirdClass_name + "<br>");
                }
                else if(i % 3 == 2){
                	$('#div52').append("<input type='checkbox' name='thirdClass_name' size='3'value='" + data[i].thirdClass_id + "'/>" + data[i].thirdClass_name + "<br>");
                }
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