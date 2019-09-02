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
<meta http-equiv="Content-Type"
	content="multipart/form-data;charset=utf-8" />
<title>我的品牌</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/brand/mybrand.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/pop_all.css">
<script type="text/javascript" src="<%=basePath%>/js/pop_all.js"></script>

<script type="text/javascript">
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
    var id = $("#secondClass").val();
    $("#thirdClass").empty();
    /* $("#thirdClass").empty(); */
    $.ajax({
        type: "post",
        url: "<%=path%>/brand/getThirdClass",
			data : {
				"id" : id
			},
			success : function(data) {
				$('#thirdClass').append(
						"<option value='' selected='selected' >" + '请选择'
								+ "</option>");
				for (var i = 0; i < data.length; i++) {
					$('#thirdClass').append(
							"<option value='" + data[i].thirdClass_id + "' >"
									+ data[i].thirdClass_name + "</option>");
				}
			},
			error : function() {
				alert("加载三级业态失败");
			}
		});
	};

	$(document).ready(function() {
		/* 提交按钮 */
		$('#inquire').click(function() {
			$("#testForm").submit();
			alert("查询");
		});
		/* 重置按钮 */
		$('#clear').click(function() {
			alert("重置");
			$(':input', '#testForm').not(':button,:submit,:reset,:hidden') //将myform表单中input元素type为button、submit、reset、hidden排除
			.val('') //将input元素的value设为空值
			.removeAttr('checked').removeAttr('selected') // 如果任何radio/checkbox/select inputs有checked or selected 属性，将其移除
		});
		/* 导出excel弹出框 */
		$('#exportExcel').click(function() {
			$.ajax({
		        type: "post",
		        url: "<%=path%>/brand/exportExcel",
				data : {
					"fileName":$("#fileName").val(),
					"filePath":$("#filePath").val()
				},
				success : function(data) {
					if(data.status == 200){
						alert("导出成功！");
						document.getElementById('light').style.display='none';
						document.getElementById('fade').style.display='none';
					}else{
						alert("导出失败！");
						document.getElementById('light').style.display='none';
						document.getElementById('fade').style.display='none';
					}
				},
				error : function() {
					alert("导出错误！");
					document.getElementById('light').style.display='none';
					document.getElementById('fade').style.display='none';
				}
			});

		});
		
	});

	/* function base64(content) {
		return window.btoa(unescape(encodeURIComponent(content)));
	}
	//@tableId: table的Id
	//@fileName: 要生成excel文件的名字（不包括后缀，可随意填写）
	function tableToExcel(tableID, fileName) {
		var table = document.getElementById(tableID);
		var excelContent = table.innerHTML;
		var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
		excelFile += "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>";
		excelFile += "<body><table>";
		excelFile += excelContent;
		excelFile += "</table></body>";
		excelFile += "</html>";
		var link = "data:application/vnd.ms-excel;base64," + base64(excelFile);
		var a = document.createElement("a");
		a.download = fileName + ".xls";
		a.href = link;
		a.click();
	} */
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
				<span> 用户中心 | </span>
			</div>
			<div id="top4">
				<a href="<%=basePath%>/home/exit"><img
					src="<%=basePath%>/assets/imgs/brandAdd/top3.png"></a>
				<!-- 退出图片 -->
			</div>
			<div id="top5">
				<img src="<%=basePath%>/assets/imgs/brandAdd/top4.png">
			</div>
			<a href="<%=path%>/home/home"><div style="cursor: pointer"
					class="top6">商家品牌库</div></a>
			<div style="cursor: pointer" class="top6">项目中心</div>
			<div style="cursor: pointer" class="top6">我的项目</div>
			<a href="<%=path%>/check/check"><div style="cursor: pointer"
					class="top6">品牌审核</div></a>
			<div style="cursor: pointer" class="top6">文档知识库</div>
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
				<div id="text6"
					style="color: #0B4CAD; font-size: 13px; text-align: center;">添加品牌</div>
			</a>
		</div>
	</div>

	<div id="main">
		<div id="key">
			<span style="color: #2779B0">商品品牌库</span><span>>我的品牌</span>
		</div>
		<div id="content">
			<form action="<%=path%>/brand/getBrandListByQuery" method="post"
				id="testForm">
				<!-- 第一行 -->
				<div style="width: 100%; height: 80px;">
					<div class="div1">一级业态:</div>
					<select class="first" id="firstClass" onchange="getSecondClass()"
						style="width: 175px;" name="firstClass_format">
						<option value="">全部</option>
					</select>
					<div class="div2">二级业态:</div>
					<select class="second" id="secondClass" onchange="getThirdClass()"
						style="width: 175px;" name="secondClass_format">
						<option value="">全部</option>
					</select>
					<div class="div3">三级业态:</div>
					<select id="thirdClass" class="third" name="thirdClass_format">
						<option value="" selected="selected">全部</option>
					</select>
				</div>
				<!-- 第2行 -->
				<div style="width: 100%; height: 50px;">
					<div class="marktime">市场周期:</div>
					<select name="time" class="time" id="time">
						<option value="">全部</option>
						<option value="">开发期</option>
						<option value="">发展期</option>
						<option value="">成熟期</option>
						<option value="">衰退期</option>
					</select>
					<div class="brandclass">品牌等级:</div>
					<select name="brandclass" class="brand_class" id="brandclass">
						<option value="">全部</option>
						<option value="">一线</option>
						<option value="">二线</option>
						<option value="">三线</option>
					</select>
				</div>
				<!-- 第3行 -->
				<div style="width: 100%; height: 50px;">
					<div class="consumerclass">消费者分类:</div>
					<select name="consumer_class" class="consumer_class"
						id="consumer_class">
						<option value="">全部</option>
						<option value="">儿童</option>
						<option value="">男</option>
						<option value="">女</option>
					</select>
					<div class="consumerage">品牌等级:</div>
					<select name="consumer_age" class="consumer_age" id="consumer_age">
						<option value="">全部</option>
					</select>
				</div>
				<!-- 第4行 -->
				<div style="width: 100%; height: 50px;">
					<div class="brandtype">品牌类型:</div>
					<select name="brand_type" class="brand_type" id="brand_type">
						<option value="">全部</option>
						<option value="">儿童</option>
						<option value="">男</option>
						<option value="">女</option>
					</select>
					<div class="brandruntype">品牌运营方式:</div>
					<select name="brand_runtype" class="brand_runtype"
						id="brand_runtype">
						<option value="">全部</option>
					</select>
				</div>
				<!-- 第5行 -->
				<div style="width: 100%; height: 50px;">
					<div class="div4">按品牌首字母:</div>
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
				</div>
				<!-- 第6行 -->
				<div style="width: 100%; height: 50px;">
					<div class="keyword">关键字:</div>
					<input name="key_word" class="key_word" type="text"
						placeholder="请输入搜索关键字" />
				</div>

				<input name="currentPage" id="currentPage" value="1"
					style="display: none" />

				<!-- 第8行 -->
				<div
					style="width: 100%; height: 70px; position: relative; top: 80px; left: 80px">
					<div class="page">每页显示：</div>
					<select name="showCount" class="pages" id="pageSize"
						onChange="nextPage(1)">
						<!-- onChange="changeCount(1) -->
						<option
							<c:if test="${page.showCount==3 }"> selected="selected"</c:if>
							value="3">3</option>
						<option
							<c:if test="${page.showCount==5 }"> selected="selected"</c:if>
							value="5">5</option>
						<option
							<c:if test="${page.showCount==10 }"> selected="selected"</c:if>
							value="10">10</option>
					</select>
				</div>

			</form>
			<!-- 第7行 -->
			<div style="width: 100%; height: 70px; margin-top: -40px">
				<button id="inquire">查询</button>
				<button id="output" type="button"
					onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">导出Excel</button>
				<!-- onclick="tableToExcel('item','data')" -->
				<button id="clear">重置</button>
			</div>

			<!-- 表格 -->
			<table class="table" border="1" cellspacing="0" cellpadding="5"
				frame="hsides" id="item">
				<tr align="center" bgcolor="#034D98">
					<!-- <th style="width: 80px;" class="sp"><input type="checkbox" name="All"
							id="All" value="全选" onClick="funSelAll(this)" />全选</th> -->
					<th class="sp">序号</th>
					<th class="sp">名称</th>
					<th class="sp">英文名</th>
					<th class="sp">一级业态</th>
					<th class="sp">二级业态</th>
					<th class="sp">市场周期</th>
					<th class="sp">品牌等级</th>
					<th class="sp">品牌知名度</th>
					<th class="sp">消费者分类</th>
					<th class="sp">品牌类型</th>
					<th class="sp">运营方式</th>
				</tr>
				<tbody id="tbShow">
					<c:forEach items="${brandList}" var="row" varStatus="vs">
						<!--  varStatus="vs" -->
						<tr>
							<td></td>
							<td>${row.ch_name }</td>
							<td>${row.en_name }</td>
							<td>${row.firstClass_name }</td>
							<td>${row.secondClass_name }</td>
							<td>${row.market_life }</td>
							<td>${row.brand_grade }</td>
							<td>${row.brand_type }</td>
							<td>${row.consume_type }</td>
							<td>${row.brand_type }</td>
							<td>${row.running_type }</td>
							<%-- <td><a style="color: #034D98;" onclick="check(${var.empId})">查看</a>
										<a style="color: #034D98;" onclick="pass(${var.empId})">通过</a>
										<a style="color: #034D98;" onclick="refuse(${var.empId})">拒绝</a>
									</td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 分页 -->
			<div class="buttom" style="text-align: center">
				<div>${page.pageStr}</div>
			</div>

			<a href="#">
				<div class="up">^</div>
			</a>

		</div>
		<div style="width: 100%; height: 3px;">
			<hr style="background-color: blue; height: 3px;" />
		</div>
		<div class="end">利林置业商业地产综合业务管理平台·商家品牌库 COPYRIGHT @ 2016 ALL
			RIGHT RESSRVED</div>
	</div>

	<div id="light" class="white_content">
		<div class="pop_top">
			<span style="color: white; margin-left: 20px;">导出excel信息</span> <a
				class="pop_close"
				onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">×</a>
		</div>
		<div class="pop_addMain" style="padding: 20px">
			<form class="form_addMain" style="width: 400px"
				action="<%=path%>/brand/exportExcel" method="post">
				<div>
					下载文件名：<input id="fileName" type="text" name="fileName" value="文档"
						placeholder="下载文件名" />
				</div>
				<br />
				<div style="margin: 0 0 40px -20px">
					文件存储位置：<input id="filePath" type="text" value="G:/" name="filePath" />
				</div>
				<input id="exportExcel"
					style="width: 60px; display: block; margin: 0 auto; cursor: pointer"
					type="button" value="确定" style="cursor:pointer;" /><br />
			</form>
		</div>

	</div>
	<div id="fade" class="black_overlay"></div>

</body>
</html>