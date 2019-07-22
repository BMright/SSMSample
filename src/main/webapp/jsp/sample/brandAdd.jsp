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
<title>添加品牌</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/brand/Add.css" />
<script src="<%=basePath%>js/brand/brandAdd.js"></script>
<script type="text/javascript">
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
            alert("加载省失败");
        }
    });
});

/*加载二级业态下拉选*/
function getSecondClass() {
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
            alert("加载市失败");
        }
    });
};

/*加载三级业态下拉选*/
function getThirdClass() {
	$('#div3').show();
	$('#div4').show();
	
    var id = $("#secondClass").val();
    /* $("#thirdClass").empty(); */
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
            alert("加载市失败");
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
				<span>欢迎您，</span><span>${pd.user_pickname } </span><span>
					(${pd.user_department }) |</span>
			</div>
			<div id="top2">
				<span> 用户中心</span>
			</div>
			<div id="top3">
				<img src="<%=basePath%>/assets/imgs/brandAdd/top2.png">
			</div>
			<div id="top4">
				<img src="<%=basePath%>/assets/imgs/brandAdd/top3.png">
			</div>
			<div id="top5">
				<img src="<%=basePath%>/assets/imgs/brandAdd/top4.png">
			</div>
			<div class="top6">商家品牌库</div>
			<div class="top6">项目中心</div>
			<div class="top6">我的项目</div>
			<div class="top6">品牌审核</div>
			<div class="top6">文档知识库</div>
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
				<a style="font-size: 13px;">我的品牌</a>
			</div>
			<div id="text6"
				style="color: #0B4CAD; font-size: 13px; text-align: center;">添加品牌</div>
		</div>
	</div>
	<form id="form1">
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
					<input type="text" name="ch_name" placeholder="品牌中文名" style="width: 175px;" /><label
						style="color: red;">*</label><br> <br> <br> 
					<select style="width: 175px;"  name="first_letter">
						<option>A</option>
						<option>B</option>
						<option>C</option>
						<option>D</option>
						<option>E</option>
						<option>F</option>
						<option>G</option>
					</select>
					<br> <br> <br> 
					<select style="width: 175px;" name="running_type">
						<option>请选择运营方式</option>
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
					<select style="width: 175px;" name="brand_grade">
						<option>请选择品牌等级</option>
					</select><label style="color: red;">*</label><br> <br> <br> 
					<select id="firstClass" onchange="getSecondClass()" style="width: 175px;" name="firstClass_format">
						<option>请选择一级业态</option>
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
						<option>请选择品牌类型</option>
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
					<div id="div4" style="display:none">
						<div id="div5">
							<!-- <input type="checkbox" size="3" />美容、SPA<br> <input
								type="checkbox" size="3" />瘦身美体 -->
						</div>
						<div class="div4" id="div51">
							<!-- <input type="checkbox" size="3" />美发美甲<br> <input
								type="checkbox" size="3" />洗护汗蒸 -->
						</div>
						<div class="div4" id="div52">
							<!-- <input type="checkbox" size="3" />母婴护理<br> <input
								type="checkbox" size="3" />足疗按摩 -->
						</div>
					</div>
					<div class="div5">
						<input type="text" name="official_website" placeholder="品牌官网" style="width: 460px;">
					</div>
					<div class="div5">
						<input type="text" name="headquarters_telephone" placeholder="联系电话" style="width: 460px;">
					</div>
					<div>
						<img id="div6img" style="margin-left:120px;" width="160" height="110px" src="<%=basePath %>/assets/imgs/brandAdd/add.jpg"/>
						<input type="file" />
						<div id="div6" style="margin-top:-110px;">
							+添加品牌LOGO<br> <br>支持.jpg/.png<br> <br>大小在4M以内
						</div>
					</div>
					
				</div>
				<div id="div7">拓展联系人:</div>
				<div class="div6">
					<div class="div7">姓名:</div>
					<div class="div8">
						<input type="text"  name="contact_name">&ensp;<label style="color: red;">*</label>
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
</body>
</html>
