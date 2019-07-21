<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/Add.css"/>
	</head>
	<body>
		<div id="top">
			<div id="toptop">
				<div id="top1"><img src="<%=basePath %>/assets/imgs/brandAdd/top1.png"></div>
				<div id="top2"></div>
				<div id="top3"><img src="<%=basePath %>/assets/imgs/brandAdd/top2.png"></div>
				<div id="top4"><img src="<%=basePath %>/assets/imgs/brandAdd/top3.png"></div>
				<div id="top5"><img src="<%=basePath %>/assets/imgs/brandAdd/top4.png"></div>
				<div class="top6">商家品牌库</div>
				<div class="top6">项目中心</div>
				<div class="top6">我的项目</div>
				<div class="top6">品牌审核</div>			
				<div class="top6">文档知识库</div>
			</div>			
		</div>
		<div id="text">
			<div id="texttext">
				<div id="text1"><img src="img/text1.png" /></div>
				<div id="text2">
					<div id="text3"><img src="img/text2.png" /></div>
					<div id="text4"><input type="text" style="height: 37px;width: 315px;" placeholder="请输入品牌，拓展联系人信息等">&emsp;&emsp;<label style="color: white;">搜索</label></div>
				</div>
				<div id="text5"><a style="font-size: 13px;">我的品牌</a></div>
				<div id="text6" style="color: #0B4CAD;font-size: 13px;text-align: center;">添加品牌</div>
			</div>
		</div>		
		<form method="post">
		
		<div id="content">
			<div id="label">
				<label style="color: #9AB7C9;">商家品牌库</label>>品牌添加
			</div>
			<div id="mainbody">
			<div Class="div1">
				品牌中文名:<br><br><br>
				品牌首字母:<br><br><br>
				品牌运营方式:<br><br><br>
			</div>
			
			<div Class="div2">
				<input type="text" placeholder="小明" style="width: 175px;"/><label style="color: red;">*</label><br><br><br>
				<select style="width: 175px;">
						<option>A</option><option>B</option><option>C</option><option>D</option><option>E</option><option>F</option><option>G</option>
				</select><br><br><br>
				<select style="width: 175px;">
					<option >请选择运营方式</option>
				</select><br><br><br>
			</div>
			<div Class="div1">
				品牌英文名:<br><br><br>
				品牌等级:<br><br><br>
				一级业态:<br><br><br>
			</div>
			<div Class="div2">
				<input type="text" placeholder="品牌英文名" style="width: 175px;"/><br><br><br>
				<select style="width: 175px;">
					<option >请选择品牌等级</option>
				</select><label style="color: red;">*</label><br><br><br>
				<select style="width: 175px;">
					<option >请选择一级业态</option>
				</select><label style="color: red;">*</label><br><br><br>
			</div>
			<div Class="div1">
				品牌别名:<br><br><br>
				品牌类型:<br><br><br>
				二级业态:<br><br><br>
			</div>
			<div Class="div2">
				<input type="text" placeholder="品牌别名" style="width: 175px;"/><br><br><br>
				<select style="width: 175px;">
					<option >请选择品牌别名</option>
				</select><br><br><br>
				<select style="width: 175px;">
					<option >请选择二级业态</option>					
				</select><br><br><br>
			</div>
			
			<div id="div1">
				<div id="div3">三级业态:</div>
				<div class="div3">品牌官网:</div>
				<div class="div3">总部公司电话:</div>
			</div>
			<div id="div2">
				<div id="div4">
					<div id="div5"><input type="checkbox" size="3" />美容、SPA<br><input type="checkbox" size="3"/>瘦身美体</div>
					<div class="div4"><input type="checkbox" size="3"/>美发美甲<br><input type="checkbox" size="3"/>洗护汗蒸</div>
					<div class="div4"><input type="checkbox" size="3"/>母婴护理<br><input type="checkbox" size="3"/>足疗按摩</div>
				</div>	
				<div class="div5"><input type="text" placeholder="品牌官网" style="width: 460px;"></div>
				<div class="div5"><input type="text" placeholder="联系电话" style="width: 460px;" ></div>
				<div id="div6">+添加品牌LOGO<br><br>支持.jpg/.png<br><br>大小在4M以内</div>
			</div>
			<div id="div7">拓展联系人:</div>
			<div class="div6">
				<div class="div7">姓名:</div>
				<div class="div8"><input type="text">&ensp;<label style="color: red;">*</label></div>
				<div class="div7">英文名:</div>
				<div class="div8"><input type="text"></div>
				<div class="div7">性别:</div>
				<div class="div8"><input type="radio">不详<input type="radio">男<input type="radio">女</div>
			</div>
			<div class="div6">
				<div class="div7">代理区域:</div>
				<div class="div8"><input type="text"></div>
				<div class="div7">职位:</div>
				<div class="div8"><input type="text"></div>
				<div class="div7">手机号:</div>
				<div class="div8"><input type="text"></div>
			</div>
			<div class="div6">
				<div class="div7">其他联系方式:</div>
				<div class="div9"><input type="text" maxlength="50" style="width: 375px;"></div>
				<div class="div7">邮箱:</div>
				<div class="div9"><input type="text" style="width: 375px;"></div>
			</div>
			</div>
		</div>
		</form>
	</body>
</html>
