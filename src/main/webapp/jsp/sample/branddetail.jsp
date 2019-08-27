<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="<%=basePath%>css/brand/branddetail.css" type="text/css" />
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
	
		<div id="div2">
			<p id="p1">
				<a id="a1" href="">商家品牌库</a>
				>
				<a id="a1" href="">餐饮</a>
				>
				<a id="a1" href="">食品零售</a>
				>
				<a id="a1" href="">百味草</a>
			</p>
		</div>
		<div id="content"><!-- 整体部分和定位 -->
		<div id="div3">
			<div id="div301">
				<ul id = "ul1">
					<li id="li1">
					<img src="<%=basePath%>/assets/imgs/brand/品牌详情图1.png">
						
					</li>
					<li id="li2">
						<div id ="div3011">
							<div>
							</div>	
						</div>
					</li>
					<li id="li3">
						<div id ="div3012">
							<center>
								<p>品牌完成率</p>
								<button id="btn1">
									<ul id="ul2">
										<li style="width: 27px;height: 27px;">
											<img src="<%=basePath%>/assets/imgs/brand/删除.png" /> 
										</li>
										<li style="height: 35px;">
											<p style="color: white;margin-top: 7px;">删除品牌</p>
										</li>
									</ul>
								</button>
								
							</center>
						</div>
					</li>
				</ul>					
			</div>
			<div id="div302">
				<ul id="ul302">
					<li style="width: 330px;">
						<div style="padding-top: 20px;">
							<p style="font-size: 15px; font-weight: 1000;margin:auto;">品牌基本信息</p>
						</div>
						<div id="div3021">
							<p>品牌中文名:</p>
						</div>
						<div id="div3022">
							<p>百味草</p>
						</div>
						<div id="div3021">
							<p>品牌等级:</p>
						</div>
						<div id="div3022">
							<p>二线</p>
						</div>
						<div id="div3021">
							<p>一级业态:</p>
						</div>
						<div id="div3022">
							<p>餐饮</p>
						</div>
					</li>
					<li style="width: 260px;">
					<div style="padding-top: 20px;">
							<p style="font-size: 15px; font-weight: 1000;margin:auto;">&nbsp</p>
						</div>
						<div id="div3021" >
							<p>品牌英文名:</p>
						</div>
						<div id="div3023" >
							<p>baicaowwei</p>
						</div>
						<div id="div3021" >
							<p>品牌官网:</p>
						</div>
						<div id="div3023" >
							<p>http://www.baidu.com</p>
						</div>
						<div id="div3021" >
							<p>二级业态:</p>
						</div>
						<div id="div3023" >
							<p>食品零售</p>
						</div>
					</li>
					<li style="width: 250px;" >
					<div style="padding-top: 20px;">
							<p style="font-size: 15px; font-weight: 1000;margin:auto;">&nbsp</p>
						</div>
						<div id="div3021" >
							<p>品牌别名:</p>
						</div>
						<div id="div3024" >
							<p>百草味</p>
						</div>
						<div id="div3021">
							<p>联系方式:</p>
						</div>
						<div id="div3024">
							<p>880820820</p>
						</div>
						<div id="div3021">
							<p>三级业态:</p>
						</div>
						<div id="div3024">
							<p></p>
						</div>
					</li>
					<li style="width: 120px;" id="li3023">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/编辑.png" style="float: left;padding-left: 2px;">
							<p>编辑</p>
						</button>	
					</li>
				</ul>
			</div>
			<div id="div303">
				<ul>
					<li style="width: 80px;height: 90px;">
						<p style="font-size: 15px; font-weight: 1000;margin:auto;">图片展示</p>
					</li>
					<li style="width:130px;height: 90px;">
						<div id="div3031">
							
						</div>
					</li>
					<li style="width: 100px;height: 90px;">
						<p style="color: #D9B355;" id="p303">&nbsp;占总进度5.0%，</p>
					</li>
					<li style="width:530px;height: 90px;">
						<p style="color: red;" id="p303">完成0%</p>
					</li>
					<li style="width: 120px;" id="li3023">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/编辑.png" style="float: left;padding-left: 2px;">
							<p>编辑</p>
						</button>	
					</li>
				</ul>
			</div>
			<div id="div304">
				<ul>
					<li style="width: 80px;height: 90px;">
						<p style="font-size: 15px; font-weight: 1000;margin:auto;">品牌介绍</p>
					</li>
					<li style="width:130px;height: 90px;">
						<div id="div3041">
							
						</div>
					</li>
					<li style="width: 100px;height: 90px;">
						<p style="color: #D9B355;" id="p304">&nbsp;占总进度5.0%，</p>
					</li>
					<li style="width:530px;height: 90px;">
						<p style="color: red;" id="p304">完成0%</p>
					</li>
					<li style="width: 120px;" id="li3023">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/编辑.png" style="float: left;padding-left: 2px;">
							<p>编辑</p>
						</button>	
					</li>
				</ul>
			</div>
			<div id="div305">
				<ul id="ul305">
					<li style="width: 330px;">
						<div style="padding-top: 20px;">
							<p style="font-size: 15px; font-weight: 1000;margin:auto;">品牌档案</p>
						</div>
						<div id="div3051">
							<p>产品类别:</p>
						</div>
						<div id="div3052">
							<p></p>
						</div>
						<div id="div3051">
							<p>消费者分类:</p>
						</div>
						<div id="div3052">
							<p></p>
						</div>
						<div id="div3051">
							<p>品牌创立时间:</p>
						</div>
						<div id="div3052">
							<p></p>
						</div>
					</li>
					<li style="width: 260px;">
					<div style="padding-top: 20px;">
							<p style="font-size: 15px; font-weight: 1000;margin:auto;">&nbsp</p>
						</div>
						<div id="div3051" >
							<p>品牌发源地:</p>
						</div>
						<div id="div3053" >
							<p></p>
						</div>
						<div id="div3051">
							<p>消费者年龄构成:</p>
						</div>
						<div id="div3053">
							<p></p>
						</div>
						<div id="div3051">
							<p>进入国内时间:</p>
						</div>
						<div id="div3053">
							<p></p>
						</div>
					</li>
					<li style="width: 250px;">
					<div style="padding-top: 20px;">
							<p style="font-size: 15px; font-weight: 1000;margin:auto;">&nbsp</p>
						</div>
						<div id="div3051" >
							<p>市场周期:</p>
						</div>
						<div id="div3054" >
							<p></p>
						</div>
						<div id="div3051">
							<p>主价格带（元）:</p>
						</div>
						<div id="div3054">
							<p></p>
						</div>
						
					</li>
					<li style="width: 120px;" id="li3053">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/编辑.png" style="float: left;padding-left: 2px;">
							<p>编辑</p>
						</button>	
					</li>
				</ul>
			</div>
			<div id="div306">
				<ul id="ul3061">
					<li style="width: 80px;">
						<p style="font-size: 15px; font-weight: 1000;margin:auto;">竞争对手</p>
					</li>
					<li style="width:130px;">
						<div id="div3031">
							
						</div>
					</li>
					<li style="width: 100px;">
						<p style="color: #D9B355;" id="p303">&nbsp;占总进度5.0%，</p>
					</li>
					<li style="width:400px;">
						<p style="color: red;" id="p303">完成0%</p>
					</li>
					<li style="width: 130px;">
						<button style="width: 125px;">
							<p style="margin: auto;">标记为无竞争对手</p>
						</button>
					</li>
					<li style="width: 120px;" id="li3023">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/编辑.png" style="float: left;padding-left: 2px;">
							<p>编辑</p>
						</button>
					</li>
				</ul>
				<ul id="ul3062">
					<li><p>品牌Logo</p></li>
					<li><p>品牌中文名</p></li>
					<li><p>品牌英文名</p></li>
					<li><p>品牌别名</p></li>
					<li><p>品牌等级</p></li>
					<li style="width: 157px;"><p>操作</p></li>
				</ul>
			</div>
			<div id="div307">
				<ul>
					<li style="width: 170px;height: 90px;">
						<p style="font-size: 15px; font-weight: 1000;margin:auto;">开店已知条件及参考标准</p>
					</li>
					<li style="width:130px;height: 90px;">
						<div id="div3071">
							
						</div>
					</li>
					<li style="width: 100px;height: 90px;">
						<p style="color: #D9B355;" id="p307">&nbsp;占总进度5.0%，</p>
					</li>
					<li style="width:440px;height: 90px;">
						<p style="color: red;" id="p307">完成0%</p>
					</li>
					<li style="width: 120px;" id="li3023">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/编辑.png" style="float: left;padding-left: 2px;">
							<p>编辑</p>
						</button>	
					</li>
				</ul>
			</div>
			<div id="div308">
				<ul>
					<li style="width: 170px;height: 90px;">
						<p style="font-size: 15px; font-weight: 1000;margin:auto;">品牌公司或代理公司信息</p>
					</li>
					<li style="width:130px;height: 90px;">
						<div id="div3081">
							
						</div>
					</li>
					<li style="width: 100px;height: 90px;">
						<p style="color: #D9B355;" id="p308">&nbsp;占总进度5.0%，</p>
					</li>
					<li style="width:400px;height: 90px;">
						<p style="color: red;" id="p308">完成0%</p>
					</li>
					<li style="width: 160px;" id="li3083">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/添加.png" style="float: left;padding-left: 2px;">
							<p>添加代理公司</p>
						</button>	
					</li>
				</ul>
			</div>
			<div id="div309">
				<div id="div3091">
					<ul>
					<li style="width: 170px;height: 40px;">
						<p style="font-size: 15px; font-weight: 1000;margin:auto;">已知合作条件(单店)</p>
					</li>
					<li style="width:130px;height: 40px;">
						<div id="div30910">
							
						</div>
					</li>
					<li style="width: 100px;height: 40px;">
						<p style="color: #D9B355;" id="p309">&nbsp;占总进度5.0%，</p>
					</li>
					<li style="width:400px;height: 40px;">
						<p style="color: red;" id="p309">完成0%</p>
					</li>
					<li style="width: 160px;" id="li3093">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/添加.png" style="float: left;padding-left: 2px;">
							<p>添加已知单店</p>
						</button>	
					</li>
				</ul>
				</div>
				<div id="div3092">
					<ul id="ul3092">
						<li id="li3091" style="width: 80px;"><p>地区</p></li>
						<li id="li3091" style="width: 80px;"><p>单店名</p></li>
						<li id="li3091"><p>开店方式</p></li>
						<li id="li3091" style="width: 80px;"><p>楼层</p></li>
						<li id="li3091"><p>店铺面积</p></li>
						<li id="li3091"><p>合作方式</p></li>
						<li id="li3091" style="width: 80px;"><p>管理费</p></li>
						<li id="li3091"><p>年营业额</p></li>
						<li id="li3091" style="width: 80px;"><p>年平效</p></li>
						<li id="li3091" style="width: 80px;"><p>备注</p></li>
						<li id="li3091" style="width: 75px;"><p>操作</p></li>
						
					</ul>
				</div>
			</div>
			<div id="div310">
				<ul id="ul3101">
					<li style="width: 170px;">
						<p style="font-size: 15px; font-weight: 1000;margin:auto;">该公司旗下的其他品牌</p>
					</li>
					<li style="width:130px;">
						<div id="div3031">
							
						</div>
					</li>
					<li style="width: 100px;">
						<p style="color: #D9B355;" id="p303">&nbsp;占总进度5.0%，</p>
					</li>
					<li style="width:310px;">
						<p style="color: red;" id="p303">完成0%</p>
					</li>
					<li style="width: 130px;">
						<button style="width: 125px;">
							<p style="margin: auto;">标记为无竞争对手</p>
						</button>
					</li>
					<li style="width: 120px;" id="li3023">
						<button>
							<img src="<%=basePath%>/assets/imgs/brand/编辑.png" style="float: left;padding-left: 2px;">
							<p>编辑</p>
						</button>
					</li>
				</ul>
				<ul id="ul3102">
					<li><p>品牌Logo</p></li>
					<li><p>品牌中文名</p></li>
					<li><p>品牌英文名</p></li>
					<li><p>品牌别名</p></li>
					<li><p>品牌等级</p></li>
					<li style="width: 157px;"><p>操作</p></li>
				</ul>
			</div>
		</div>
		<div id="div4"></div>
		</div>
	</body>
</html>
