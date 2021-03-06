<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
<title>添加品牌</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/brand/Add.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets/icon/table_icon.css" />
<%-- <script src="<%=basePath%>js/brand/brandAdd.js"></script> --%>
<script type="text/javascript">
//按回车键提交
$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		$(".submit_login").click();
	}
});

$(document).ready(function() {
	//点击+上传文件事件
	$("#div6img").click(function(){
	    $("#upFile").click();
	  });
	
	//文件内容改变事件
	$("#upFile").change(function(){
		/* var formdata=new FormData($("#form2")); */
		 var s = $('#upFile')[0].files[0];
        var formData = new FormData();
        formData.append("file", s);

        var val= $("#upFile").val();
        var k = val.substr(val.indexOf("."));
        alert(k);
        /* alert(k != ".jpg" && k != ".png"); */
        if(k != ".jpg" && k != ".png"){
        	alert("图片格式错误");
        	$('#upFile').value="";
        	return false;
        }
        var fileSize = 0;
        fileSize = s.size;
        var size = fileSize / 1024;
        if(size>4000){
        	alert("大小不能大于4M");
        	$('#upFile').value="";
        	return false;   //阻止submit提交
        }
        alert("格式正确");
        
		debugger;
		$.ajax({
            url: "<%=path%>/brand/upload",
            type: "post",
            dataType: "json",
            cache: false,
            data: formData,
            processData: false,// 不处理数据
            contentType: false, // 不设置内容类型
            success: function(data){
               if(data.status == 200){
            	   $("#div6img").attr('src',data.base64); 
            	   $("#brand_logo").val(data.base64);
            	   alert($("#brand_logo").val());
            	   $('#upFile').val("");
            	   alert("成功");
               }else if (data.status == 500){
            	   alert("重复上传")
               }else if(data.status == 404){
            	   alert("没有选择文件");
               }
            },
            error:function(data){
            	alert("文件上传异常");
            }
        })
	});
	
	//点击提交键提交
	$(".submit_login").click(function() {
	    if($('#ch_name').val() == "" || $('#ch_name').val() == null){
	    	alert("请输入品牌中文名");
	    	return false;
	    }
	    else if($('#brand_grade').val() == "" || $('#brand_grade').val() == null){
	    	alert("请选择品牌等级");
	    	return false;
	    }
	    else if($('#firstClass').val() == "" || $('#firstClass').val() == null){
	    	alert("请选择一级业态");
	    	return false;
	    }
	    else if($('#contact_name').val() == "" || $('#contact_name').val() == null){
	    	alert("请输入拓展联系人姓名");
	    	return false;
	    }
	    else{
	    	$.ajax({
	     	   	type: "POST",
	      	  	url: '<%=path%>/brand/brandadd',
	      	  	data: $('#form1').serialize(),  /* data */
	      	  	dataType: "json",
	      	  	success: function (result) {
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
	    }
	});
});

/*加载一级业态下拉选*/
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
            alert("加载一级业态失败");
        }
    });
});

/*加载二级业态下拉选*/
function getSecondClass() {
	$("#div5").empty();
	$("#div51").empty();
	$("#div52").empty();
	$('#div3').hide();
	$('#div4').hide();
	
    var id = $("#firstClass").val();
    $("#secondClass").empty();
    /* $("#thirdClass").empty(); */
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
            alert("加载二级业态失败");
        }
    });
};

/*加载三级业态下拉选*/
function getThirdClass() {
	$("#div3").empty();
	$("#div5").empty();
	$("#div51").empty();
	$("#div52").empty();
	$('#div3').show();
	$('#div4').show();
	
    var id = $("#secondClass").val();
    $.ajax({
        type: "post",
        url: "<%=path%>/brand/getThirdClass",
        data: {"id": id},
        success: function (data) {
            /* $('#secondClass').append("<option value='' selected='selected' >" + '请选择' + "</option>"); */
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
            alert("加载三级业态失败");
        }
    });
};
</script>
</head>
<body>
<div id="top">
		<div id="toptop">
			<div id="top1">
				<img width="30px" src="<%=basePath%>/assets/imgs/brandAdd/top1.png">
				<span>欢迎您，</span><span>${pdData.user_pickname } </span><span>
					(${pdData.user_department }) | </span>
			</div>
			<div id="top2">
				<span> 用户中心  | </span>
			</div>
			<div id="top4">
				<a href="<%=basePath %>/home/exit"><img src="<%=basePath%>/assets/imgs/brandAdd/top3.png"></a><!-- 退出图片 -->
			</div>
			<div id="top5">
				<img src="<%=basePath%>/assets/imgs/brandAdd/top4.png">
			</div>
			<a href="<%=path%>/home/home"><div style="cursor:pointer" class="top6">商家品牌库</div></a>
			<div style="cursor:pointer" class="top6">项目中心</div>
			<div style="cursor:pointer" class="top6">我的项目</div>
			<a href="<%=path%>/check/check"><div style="cursor:pointer" class="top6">品牌审核</div></a>
			<div style="cursor:pointer" class="top6">文档知识库</div>
		</div>
	</div>
	<div id="text">
		<div id="texttext">
			<div id="text1">
				<img src="<%=basePath%>/assets/imgs/brandAdd/text1.png" />
			</div>
			<div id="text2">
				<div id="text3">
					<img class="txt3"
						src="<%=basePath%>/assets/imgs/brandAdd/text2.png" />
				</div>
				<div id="text4">
					<input type="text" style="height: 37px; width: 315px;"
						placeholder="请输入品牌，拓展联系人信息等">&emsp;&emsp;<label
						style="color: white;">搜索</label>
				</div>
			</div>
			<div id="text5">
				<a href="<%=path%>/brand/myBrand" style="font-size: 13px;">我的品牌</a>
			</div>
			<a href="<%=path%>/brand/brandAdd">
				<div id="text6" style="color: #0B4CAD; font-size: 13px; text-align: center;">添加品牌</div>
			</a>
		</div>
	</div>
	<form id="form1" method="post">
		<div id="content">
			<div id="label">
				<label style="color: #9AB7C9;">商家品牌库</label>>品牌添加
			</div>
			<div id="mainbody">
				<div Class="div1">
					品牌中文名:<br> <br> <br> 品牌首字母:<br> <br> <br>
					品牌运营方式:<br> <br> <br>
				</div>

				<div Class="div2">
					<input id="ch_name" type="text" name="ch_name" placeholder="品牌中文名" style="width: 175px;" /><label
						style="color: red;">*</label><br> <br> <br> 
					<select style="width: 175px;"  name="first_letter">
						<option value="A">A</option>
						<option value="B">B</option>
						<option value="C">C</option>
						<option value="D">D</option>
						<option value="E">E</option>
						<option value="F">F</option>
						<option value="G">G</option>
						<option value="H">H</option>
						<option value="I">I</option>
						<option value="J">J</option>
						<option value="K">K</option>
						<option value="L">L</option>
						<option value="M">M</option>
						<option value="N">N</option>
						<option value="O">O</option>
						<option value="P">P</option>
						<option value="Q">Q</option>
						<option value="R">R</option>
						<option value="S">S</option>
						<option value="T">T</option>
						<option value="U">U</option>
						<option value="V">V</option>
						<option value="W">W</option>
						<option value="X">X</option>
						<option value="Y">Y</option>
						<option value="Z">Z</option>
					</select>
					<br> <br> <br> 
					<select style="width: 175px;" name="running_type">
						<option value="0">请选择运营方式</option>
						<option value="1">直营</option>
						<option value="2">代理</option>
						<option value="3">加盟</option>
					</select><br> <br> <br>
				</div>
				<div Class="div1">
					品牌英文名:<br> <br> <br> 
					品牌等级:<br> <br> <br>
					一级业态:<br> <br> <br>
				</div>
				<div Class="div2">
					<input type="text" name="en_name" placeholder="品牌英文名" style="width: 175px;" /><br>
					<br> <br> 
					<select id="brand_grade" style="width: 175px;" name="brand_grade">
						<option value="0">请选择品牌等级</option>
						<option value="1">一线</option>
						<option value="2">二线</option>
						<option value="3">三线</option>
					</select><label style="color: red;">*</label><br> <br> <br> 
					<select id="firstClass" onchange="getSecondClass()" style="width: 175px;" name="firstClass_format">
						<option value="null">请选择一级业态</option>
					</select><label style="color: red;">*</label><br> <br> <br>
				</div>
				<div Class="div1">
					品牌别名:<br> <br> <br> 
					品牌类型:<br> <br> <br>
					二级业态:<br> <br> <br>
				</div>
				<div Class="div2">
					<input type="text" name="brand_alias" placeholder="品牌别名" style="width: 175px;" /><br>
					<br> <br> <select style="width: 175px;" name="brand_type">
						<option value="0">请选择品牌类型</option>
						<option value="1">本地</option>
						<option value="2">连锁</option>
					</select><br> <br> <br> 
					<select id="secondClass" onchange="getThirdClass()" style="width: 175px;" name="secondClass_format">
						<option>请选择二级业态</option>
					</select><br> <br> <br>
				</div>

				<div id="div1">
					<div id="div3" style="display:none">三级业态:</div>
					<div class="div3">品牌官网:</div>
					<div class="div3">总部公司电话:</div>
				</div>
				<div id="div2">
					<div id="div4" style="display:none"><!-- 三级业态 -->
						<div id="div5"></div>
						<div class="div4" id="div51"></div>
						<div class="div4" id="div52"></div>
					</div>
					<div class="div5">
						<input type="text" name="official_website" placeholder="品牌官网" style="width: 460px;">
					</div>
					<div class="div5">
						<input type="text" name="headquarters_telephone" placeholder="联系电话" style="width: 460px;">
					</div>
					<div>
						<img id="div6img" style="margin-left:120px;" width="160" height="110px" 
						src="<%=basePath %>/assets/imgs/brandAdd/add.jpg"/>
						<input id="brand_logo" type="text" name="brand_logo" value="" style="display:none"/>
						<div id="div6" style="margin-top:-110px;">
							+添加品牌LOGO<br> <br>支持.jpg/.png<br> <br>大小在4M以内
						</div>
					</div>
					
				</div>
				<div id="div7">拓展联系人:</div>
				<div class="div6">
					<div class="div7">姓名:</div>
					<div class="div8">
						<input type="text" id="contact_name"  name="contact_name">&ensp;<label style="color: red;">*</label>
					</div>
					<div class="div7">英文名:</div>
					<div class="div8">
						<input type="text" name="contact_enName">
					</div>
					<div class="div7">性别:</div>
					<div class="div8">
						<input type="radio" value="0" checked="checked" name="contact_sex">不详
						<input type="radio" value="1" name="contact_sex">男
						<input type="radio" value="2" name="contact_sex">女
					</div>
				</div>
				<div class="div6">
					<div class="div7">代理区域:</div>
					<div class="div8">
						<input type="text" name="contact_agencyArea">
					</div>
					<div class="div7">职位:</div>
					<div class="div8">
						<input type="text" name="contact_position">
					</div>
					<div class="div7">手机号:</div>
					<div class="div8">
						<input type="text" name="contact_telephone">
					</div>
				</div>
				<div class="div6">
					<div class="div7">其他联系方式:</div>
					<div class="div9">
						<input type="text" name="contact_otherPhone" maxlength="50" style="width: 375px;">
					</div>
					<div class="div7">邮箱:</div>
					<div class="div9">
						<input type="text" name="contact_email" style="width: 375px;">
					</div>
				</div>
				<div align="center">
					<input class="submit_login" type="button" value="确认提交" style="cursor: pointer" />
				</div>
			</div>
		</div>
	</form>
	<form id="form2" method="post" enctype="multipart/form-data">
		<input id="upFile" name="brand_logo" accept=".jpg,.png" type="file"/> <!-- style="display:none" -->
	</form>
</body>
</html>
