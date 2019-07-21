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
<base href="<%=basePath%>" />
<title>品牌添加</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/brandAdd.css" />
<script type="text/javascript" src="<%=basePath%>/js/brandadd.js"></script>
</head>
<body>
	<div id="top">
		<div id="toptop">
			<div id="top1">
				<img src="<%=basePath%>/assets/imgs/brandAdd/top1.png">
				<span>欢迎您！</span>
				<span>${pd.user_pickname} </span>
				<span>(${pd.user_department})</span>
			</div>
			<div id="top2">
				<span class="top2_span">| 用户中心</span>
			</div>
			<div id="top3">
				<img src="<%=basePath%>/assets/imgs/brandAdd/top2.png">
			</div>
			<div id="top4">
				<img src="<%=basePath%>/assets/imgs/brandAdd/top3.png">
			</div>
			<div id="top5">
				<img height="33px" width="250px"
					src="<%=basePath%>/assets/imgs/brandAdd/top4.png">
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
					<img src="<%=basePath%>/assets/imgs/brandAdd/text2.png" />
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
	<form id="form1" method="post" method="post">
		<div id="content">
			<div id="label">
				<label style="color: #9AB7C9;">商家品牌库</label>>品牌添加
			</div>
			<div id="mainbody">
				<div Class="div1">
					品牌中文名:<br>
					<br>
					<br> 品牌首字母:<br>
					<br>
					<br> 品牌运营方式:<br>
					<br>
					<br>
				</div>
				<div Class="div2">
					<input type="text" placeholder="品牌中文名" style="width: 175px;" name="ch_name"/><label
						style="color: red;">*</label><br>
					<br>
					<br> <select style="width: 175px;" name="first_letter">
						<option value="A">A</option><option>B</option><option>C</option><option>D</option><option>E</option>
						<option>F</option><option>G</option><option>H</option><option>I</option><option>J</option>
						<option>K</option><option>L</option><option>M</option><option>N</option><option>O</option>
						<option>P</option><option>Q</option><option>R</option><option>S</option><option>T</option>
						<option>U</option><option>V</option><option>W</option><option>X</option><option>Y</option>
						<option>Z</option>
					</select><br>
					<br>
					<br> <select style="width: 175px;" name="running_type">
						<option>请选择运营方式</option>
					</select><br>
					<br>
					<br>
				</div>
				<div Class="div1">
					品牌英文名:<br>
					<br>
					<br> 品牌等级:<br>
					<br>
					<br> 一级业态:<br>
					<br>
					<br>
				</div>
				<div Class="div2">
					<input type="text" placeholder="品牌英文名" style="width: 175px;" name="en_name"/><br>
					<br>
					<br> <select style="width: 175px;" name="brand_grade">
						<option>请选择品牌等级</option>
					</select><label style="color: red;">*</label><br>
					<br>
					<br> <select style="width: 175px;" name="firstClass_format">
						<option>请选择一级业态</option>
					</select><label style="color: red;">*</label><br>
					<br>
					<br>
				</div>
				<div Class="div1">
					品牌别名:<br>
					<br>
					<br> 品牌类型:<br>
					<br>
					<br> 二级业态:<br>
					<br>
					<br>
				</div>
				<div Class="div2">
					<input type="text" placeholder="品牌别名" style="width: 175px;" name="brand_alias"/><br>
					<br>
					<br> <select style="width: 175px;" name="brand_type">
						<option>请选择品牌类型</option>
					</select><br>
					<br>
					<br> <select style="width: 175px;" name="secondClass_format">
						<option>请选择二级业态</option>
					</select><br>
					<br>
					<br>
				</div>

				<div id="div1">
					<div id="div3">三级业态:</div>
					<div class="div3">品牌官网:</div>
					<div class="div3">总部公司电话:</div>
				</div>
				<div id="div2">
					<div id="div4">
						<div id="div5">
							<input type="checkbox" size="3" />美容、SPA<br>
							<input type="checkbox" size="3" />瘦身美体
						</div>
						<div class="div4">
							<input type="checkbox" size="3" />美发美甲<br>
							<input type="checkbox" size="3" />洗护汗蒸
						</div>
						<div class="div4">
							<input type="checkbox" size="3" />母婴护理<br>
							<input type="checkbox" size="3" />足疗按摩
						</div>
					</div>
					<div class="div5">
						<input type="text" placeholder="品牌官网" style="width: 460px;" name="official_website">
					</div>
					<div class="div5">
						<input type="text" placeholder="联系电话" style="width: 460px;" name="headquarters_telephone">
					</div>
					<div id="div6">
						+添加品牌LOGO<br>
						<br>支持.jpg/.png<br>
						<br>大小在4M以内
					</div>
				</div>
				<div id="div7">拓展联系人:</div>
				<div class="div6">
					<div class="div7">姓名:</div>
					<div class="div8">
						<input type="text" name="contact_name">&ensp;<label style="color: red;">*</label>
					</div>
					<div class="div7">英文名:</div>
					<div class="div8">
						<input type="text" name="contact_enName">
					</div>
					<div class="div7">性别:</div>
					<div class="div8">
						<input type="radio" value="0" name="contact_sex"/>不详<input type="radio" value="1" name="contact_sex"/>男
						<input type="radio" value="2" name="contact_sex"/>女
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
						<input type="text" maxlength="50" style="width: 375px;" name="contact_otherPhone">
					</div>
					<div class="div7">邮箱:</div>
					<div class="div9">
						<input type="text" style="width: 375px;" name="contact_email">
					</div>
				</div>
				<div align="center">
					<input class="submit_login" type="button" value="确认添加" style="cursor:pointer"/>
				</div>
			</div>
		</div>
	</form>
	
</body>
</html>
