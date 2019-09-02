<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!Doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>品牌审核</title>
<link rel="stylesheet" href="<%=basePath%>css/brand/check.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%= basePath %>/css/pop_all.css">
<script type="text/javascript" src="<%= basePath %>/js/pop_all.js"></script>
<script>
	//当全选按钮，选中时，所有复选框被选中，当全选按钮不被选中时，所有的也不被选中
	function funSelAll() {
		var selects = document.getElementsByName("One");
		if (document.getElementsByName("All")[0].checked == true) {
			for (var i = 0; i < selects.length; i++) {
				selects[i].checked = true;
			}
		} else {
			for (var i = 0; i < selects.length; i++) {
				selects[i].checked = false;
			}
		}
	}
	//当所有的复选框被选中时，全选按钮被选中，当其中任意一个或者多个没被选中时，全选按钮不被选中
	function funSelOne() {
		var one = document.getElementsByName("One");
		var all = document.getElementsByName("All")[0]
		var selCount = 0;
		var unSelCount = 0;
		for (var i = 0; i < one.length; i++) {
			if (one[i].checked == true) {
				selCount++;
			}
			if (one[i].checked == false) {
				unSelCount++;
			}
			if (selCount == one.length) {
				all.checked = true;
			}
			if (unSelCount > 0) {
				all.checked = false;
			}
		}
	}

	/*加载一级业态下拉选*/
	$(function () {
		$.ajax({
	        type: "post",
	        url: "<%=path%>/check/getFirstClass",
	        success: function (data) {
	            for (var i = 0; i < data.length; i++) {
	            	/* if(pd.firstClass == data[i].firstClass_id){
	            		$('#first-trade').append("<option value='" + data[i].firstClass_id + "' selected='secected'>" + data[i].firstClass_name + "</option>");
	            	}else{ */
	            		$('#first-trade').append("<option value='" + data[i].firstClass_id + "'  <c:if test='${pd.firstClass==" + data[i].firstClass_id + " }'> selected='selected'</c:if>>" + data[i].firstClass_name + "</option>");
	            	/* } */
	            }
	        },
	        error: function () {
	            alert("加载一级业态失败");
	        }
	    });
	});

	/*加载二级业态下拉选*/
	function getSecondClass() {
		
	    var id = $("#first-trade").val();
	    $("#second-trade").empty();
	   	$("#third-trade").empty();
	   	
	    $.ajax({
	        type: "post",
	        url: "<%=path%>/check/getSecondClass",
	        data: {"id": id},
	        success: function (data) {
	            $('#second-trade').append("<option value='' selected='selected' >" + '请选择' + "</option>");
	            $('#third-trade').append("<option value='' selected='selected' >" + '请选择' + "</option>");
	            for (var i = 0; i < data.length; i++) {
	            	/* if(pd.secondClass == data[i].secondClass_id){
	            		$('#second-trade').append("<option value='" + data[i].secondClass_id + "' selected='secected'>" + data[i].secondClass_name + "</option>");
	            	}else{ */
	            		$('#second-trade').append("<option value='" + data[i].secondClass_id + "' <c:if test='${pd.secondClass==" + data[i].secondClass_id + " }'> selected='selected'</c:if>>" + data[i].secondClass_name + "</option>");
	            	/* } */
	                
	            }
	        },
	        error: function () {
	            alert("加载二级业态失败");
	        }
	    });
	};

	/*加载三级业态下拉选*/
	function getThirdClass() {	
	    var id = $("#second-trade").val();
	     $("#third-trade").empty(); 
	    $.ajax({
	        type: "post",
	        url: "<%=path%>/check/getThirdClass",
	        data: {"id": id},
	        success: function (data) {
	            $('#third-trade').append("<option value='' selected='selected' >" + '请选择' + "</option>");
	            for (var i = 0; i < data.length; i++) {
	            	/* if(pd.thirdClass == data[i].thirdClass_id){
	            		$('#third-trade').append("<option value='" + data[i].thirdClass_id + "' selected='selected'>" + data[i].thirdClass_name + "</option>");
	            	}else{ */
	            		$('#third-trade').append("<option value='" + data[i].thirdClass_id + "'  <c:if test='${pd.thirdClass==" + data[i].thirdClass_id + " }'> selected='selected'</c:if>>" + data[i].thirdClass_name + "</option>");
	            	/* } */
	                
	            }
	        },
	        error: function () {
	            alert("加载三级业态失败");
	        }
	    });
	};

	$(document).ready(function(){
		/* 提交按钮 */
		$('#sub').click(function(){
			$("#testForm").submit();
			alert("提交");
		});
		/* 重置按钮 */
		$('#res').click(function(){
			alert("重置");
			$(':input','#testForm')
		       .not(':button,:submit,:reset,:hidden')   //将myform表单中input元素type为button、submit、reset、hidden排除
		       .val('')  //将input元素的value设为空值
		       .removeAttr('checked')
		       .removeAttr('selected') // 如果任何radio/checkbox/select inputs有checked or selected 属性，将其移除
		});
		
	});
	
	//查看按钮触发事件
	function look(brand_id){
		alert("brand_id:" + brand_id);
		document.getElementById('light').style.display='block';
		document.getElementById('fade').style.display='block';
		$.ajax({
	        type: "post",
	        url: "<%=path%>/check/lookBrand",
	        data: {"id": brand_id},
	        success: function (data) {
	            document.getElementById("ch_name").innerHTML = data.ch_name;
	            document.getElementById("en_name").innerHTML = data.en_name;
	            document.getElementById("brand_alias").innerHTML = data.brand_alias;
	            document.getElementById("brand_grade").innerHTML = data.brand_grade;
	            document.getElementById("running_type").innerHTML = data.running_type;
	            document.getElementById("brand_type").innerHTML = data.brand_type;
	            document.getElementById("firstClass_format").innerHTML = data.firstClass_format;
	            document.getElementById("secondClass_format").innerHTML = data.secondClass_format;
	            document.getElementById("thirdClass_format").innerHTML = data.thirdClass_format;
	            document.getElementById("official_website").innerHTML = data.official_website;
	            document.getElementById("headquarters_telephone").innerHTML = data.headquarters_telephone;
	            $("#pop_image").attr('src',data.brand_logo); 
	            /* document.getElementById("pop_image").src = data.brand_logo; */
	        },
	        error: function () {
	            alert("error");
	        }
	    });
	};
	//通过和拒绝按钮触发事件
	function check(brand_id,status){
		alert("brand_id:" + brand_id + "\nstatus:" + status);
		$.ajax({
	        type: "post",
	        url: "<%=path%>/check/passOrFail",
	        data: {
	        	"id": brand_id,
	        	"status":status},
	        success: function (data) {
	            if(status == 1){
	            	alert("审核通过！");
	            }else if(status == 0){
	            	alert("审核未通过！");
	            }
	        },
	        error: function () {
	            alert("error");
	        }
	    });
	};
</script>
</head>
<body style="background: #F5F4F3">
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


	<div class="main">
		<div class="font">品牌信息审核</div>
		<form action="<%=path%>/check/getBrandListByQuery" method="post"
			id="testForm">
			<div class="content">

				<div class="div1">按品牌首字母:</div>
				<div class="word">
					<label class="l1"><input
						<c:if test="${pd.first_letter==null }">checked="checked"</c:if>
						type="radio" name="first_letter" value="" checked="checked" />不限</label>
					<label class="l1"><input
						<c:if test="${pd.first_letter=='A' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="A" />A</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='B' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="B" />B</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='C' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="C" />C</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='D' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="D" />D</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='E' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="E" />E</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='F' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="F" />F</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='G' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="G" />G</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='H' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="H" />H</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='I' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="I" />I</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='J' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="J" />J</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='K' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="K" />K</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='L' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="L" />L</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='M' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="M" />M</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='N' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="N" />N</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='O' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="O" />O</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='P' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="P" />P</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='Q' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="Q" />Q</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='R' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="R" />R</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='S' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="S" />S</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='T' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="T" />T</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='U' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="U" />U</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='V' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="V" />V</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='W' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="W" />W</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='X' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="X" />X</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='Y' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="Y" />Y</label> <label class="l1"><input
						<c:if test="${pd.first_letter=='Z' }">checked="checked"</c:if>
						type="radio" name="first_letter" value="Z" />Z</label>
				</div>

				<div class="div2">一级业态:</div>
				<select name="firstClass" class="first" id="first-trade"
					onchange="getSecondClass()">
					<option value="">全部</option>
				</select>
				<div class="div3">二级业态:</div>
				<select name="secondClass" class="second" id="second-trade"
					onchange="getThirdClass()">
					<option value="">全部</option>
				</select>
				<div class="div4">三级业态:</div>
				<select name="thirdClass" class="third" id="third-trade">
					<option value="" selected="selected">全部</option>
				</select>

				<div class="div5">品牌等级:</div>
				<select name="brand_grade" class="forth" id="grade">
					<option
						<c:if test="${pd.brand_grade=='' }"> selected="selected"</c:if>
						value="">全部</option>
					<option
						<c:if test="${pd.brand_grade==1 }"> selected="selected"</c:if>
						value="1">一线</option>
					<option
						<c:if test="${pd.brand_grade==2}"> selected="selected"</c:if>
						value="2">二线</option>
					<option
						<c:if test="${pd.brand_grade==3 }"> selected="selected"</c:if>
						value="3">三线</option>
				</select>
				<div class="div6">提交审核时间:</div>
				<div class="time">
					<label class="l2"><input type="radio" name="submit_time"
						value="" checked="checked" />不限</label> <label class="l2"><input
						type="radio" name="submit_time" value="7" />7天</label> <label class="l2"><input
						type="radio" name="submit_time" value="30" />一个月</label> <label
						class="l2"><input type="radio" name="submit_time"
						value="365" />1年</label>
				</div>

				<div class="div7">品牌信息类型:</div>
				<select name="brand_type" class="message">
					<option
						<c:if test="${pd.brand_type=='' }"> selected="selected"</c:if>
						value="">全部</option>
					<option
						<c:if test="${pd.brand_type==1 }"> selected="selected"</c:if>
						value="1">基本信息编辑</option>
					<option
						<c:if test="${pd.brand_type==2 }"> selected="selected"</c:if>
						value="2">品牌添加</option>
					<option
						<c:if test="${pd.brand_type==3 }"> selected="selected"</c:if>
						value="3">添加品牌代理公司</option>
					<option
						<c:if test="${pd.brand_type==4 }"> selected="selected"</c:if>
						value="4">添加品牌公司</option>
					<option
						<c:if test="${pd.brand_type==5 }"> selected="selected"</c:if>
						value="5">添加品牌直营公司</option>
				</select>
				<div class="div8">品牌维护类型:</div>
				<select name="running_type" class="wh">
					<option
						<c:if test="${pd.running_type=='' }"> selected="selected"</c:if>
						value="">全部</option>
					<option
						<c:if test="${pd.running_type==1 }"> selected="selected"</c:if>
						value="1">品牌公司</option>
					<option
						<c:if test="${pd.running_type==2 }"> selected="selected"</c:if>
						value="2">代理公司</option>
					<option
						<c:if test="${pd.running_type==3 }"> selected="selected"</c:if>
						value="3">直营公司</option>
				</select>
				<div class="div9">审核状态:</div>
				<select name="check_status" class="state">
					<option
						<c:if test="${pd.check_status=='' }"> selected="selected"</c:if>
						value="">全部</option>
					<option
						<c:if test="${pd.check_status==1 }"> selected="selected"</c:if>
						value="0">未审核</option>
					<option
						<c:if test="${pd.check_status==2 }"> selected="selected"</c:if>
						value="1">审核中</option>
					<option
						<c:if test="${pd.check_status==3 }"> selected="selected"</c:if>
						value="2">审核通过</option>
					<option
						<c:if test="${pd.check_status==4 }"> selected="selected"</c:if>
						value="3">审核未通过</option>
				</select>

				<div class="div10">品牌名:</div>
				<input name="brand_name" value="${pd.brand_name }" type="text"
					class="name" placeholder="品牌名" />
				<div class="div11">维护人员:</div>
				<input name="maintainer" value="${pd.maintainer }" type="text"
					class="people" placeholder="姓名/工号" /> <input type="button"
					id="sub" value="查询" class="require"></input> <input type="button"
					id="res" value="重置" class="reset" />

				<div
					style="position: absolute; height: 2px; background-color: #034D98; width: 1340px; margin-top: 436px;"></div>
				<div class="on">审核通过</div>
				<div class="off">审核拒绝</div>
				<div class="page">每页显示：</div>
				<select name="showCount" class="pages" id="pageSize"
					onChange="nextPage(1)">
					<option
						<c:if test="${page.showCount==3 }"> selected="selected"</c:if>
						value="3">3</option>
					<option
						<c:if test="${page.showCount==5 }"> selected="selected"</c:if>
						value="5">5</option>
					<option
						<c:if test="${page.showCount==10 }"> selected="selected"</c:if>
						value="10">10</option>
				</select> <input name="currentPage" id="currentPage" value="1"
					style="display: none" />
				<!--  -->

				<table class="table" border="1" cellspacing="0" cellpadding="5"
					frame="hsides">
					<tr align="center" bgcolor="#034D98">
						<!-- <th style="width: 80px;" class="sp"><input type="checkbox" name="All"
							id="All" value="全选" onClick="funSelAll(this)" />全选</th> -->
						<th class="sp">一级业态</th>
						<th class="sp">二级业态</th>
						<th class="sp">品牌等级</th>
						<th class="sp">品牌</th>
						<th class="sp">维护人员</th>
						<th class="sp">审核内容类型</th>
						<th class="sp">提交时间</th>
						<th class="sp">审核状态</th>
						<th class="sp">操作</th>
					</tr>
					<tbody id="tbShow">
						<c:forEach items="${brandList}" var="row" varStatus="vs">
							<!--  varStatus="vs" -->
							<tr>
								<td>${row.firstClass_format }</td>
								<td>${row.secondClass_format }</td>
								<td>${row.brand_grade }</td>
								<td>${row.ch_name }</td>
								<td>${row.maintainer }</td>
								<td>${row.checkcontent_type }</td>
								<td>${row.submit_time }</td>
								<td>${row.check_status }</td>
								<td>
								<!-- onclick="check(${row.ch_name})" -->
									<a href="javascript:look(${row.brand_id })" style="color: #034D98;" >查看</a> 
									<a href="javascript:check(${row.brand_id },1)" style="color: #034D98;" >通过</a> 
									<a href="javascript:check(${row.brand_id },0)" style="color: #034D98;" >拒绝</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="buttom" style="text-align: center">
					<div>${page.pageStr}</div>
				</div>
				<a href="#">
					<div class="up">^</div>
				</a>
				<hr style="background-color: blue; height: 3px;" />
				<div class="end">利林置业商业地产综合业务管理平台·商家品牌库 COPYRIGHT @ 2016 ALL
					RIGHT RESSRVED</div>
			</div>
		</form>
	</div>
	
	<div id="light" class="white_content">
		<div class="pop_top">
			<span style="color:white;margin-left:20px;">品牌审核</span>
			<a class="pop_close" onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">×</a>
		</div>
		<div class="pop_addMain">
			<form class="form_addMain">
				<span>姓名：<label id="ch_name"></label></span> 
				<span style="float:right">英文名：<label id="en_name"></label></span><br/>
				<span>别名：<label id="brand_alias"></label></span>
				<span style="float:right">品牌等级：<label id="brand_grade"></label></span><br/>
				<span style="margin:0 0 0 -40px">
					一级业态：<label id="firstClass_format"></label>&emsp;
					二级业态：<label id="secondClass_format"></label>&emsp;
					三级业态：<label id="thirdClass_format"></label>&emsp;
				</span><br/>
				<span style="margin:0 0 0 -40px">运营方式：<label id="running_type"></label></span> 
				<span style="float:right">品牌类型：<label id="brand_type"></label></span><br/>
				<span style="margin:0 0 0 -40px">品牌官网：<label id="official_website"></label></span><br/>
				<span style="line-height:120px;margin:0 0 0 -40px">
					品牌logo：<img id="pop_image" src="<%=basePath %>imgs/brandAdd/add.jpg" style="cursor:pointer;vertical-align:top;" width="150" height="100" /><!-- onclick="F_Open_dialog()" -->
					<input id="btn_file" type="file" style="display:none" onchange="selectImage(this);" /></span><br/>
				<span style="line-height:40px;margin:0 0 0 -90px">总部电话：<label id="headquarters_telephone"></label></span><br/>
			</form>
		</div>
		
	</div>
	<div id="fade" class="black_overlay"></div>
	
</body>
</html>
