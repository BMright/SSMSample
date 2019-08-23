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
<title>首页</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/home/home.css" />
</head>
<body style="background:#F5F4F3">
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
	<div id="banner" style="background:url(<%=basePath%>assets/imgs/home/background.jpg)">
		<div id="bannerlogo" >
			<img src="<%=basePath%>/assets/imgs/home/banner_logo.png"/>
		</div>
		<div id="brandnum">${pd2.data0 }个品牌 |</div>
		<div id="detailbrand">
			
			<div id="yetaiInformation">一级业态${pd2.fcf }个，二级业态${pd2.scf }个，三级业态${pd2.tcf }个</div>
			<div id="brandInformation">一线品牌${pd2.data1 }个，二线品牌${pd2.data2 }个，三线品牌${pd2.data3 }个</div>  
		</div>
	</div>
	<div id="content">
		<div id="main">
			<div id="first_letter">按品牌首字母排序：A B C D E F G H I J K L M N O P Q R S T U V W X Y Z</div>
			<div id="brandcontent">
				<table id="maintable">
					<tr style="border-top:1px solid #E7E6E4;">
						
						<th ><table id="firsttable"  style="border-right:1px solid #E7E6E4;">
							<tr><th><img src="<%=basePath%>/assets/imgs/home/刀叉（线）.png" style="width:15px;height:15px"/>餐饮</th></tr>
							<tr><td>${pd1.data10}个品牌，${pd1.data11}个一线，${pd1.data12}个二线，${pd1.data13}个三线</td></tr>
						</table></th>
						<td>
						<table id="secodetable">
							<tr>
								<th>食品零售</th>
								<td>一线${pd.data11}</td>
								<td>二线${pd.data12}</td>
								<td>三线${pd.data13}</td>
							<tr>
							<tr>
								<th>西餐零售</th>
								<td>一线${pd.data21}</td>
								<td>二线${pd.data22}</td>
								<td>三线${pd.data23}</td>
							<tr>
							<tr>
								<th>特色餐饮</th>
								<td>一线${pd.data31}</td>
								<td>二线${pd.data32}</td>
								<td>三线${pd.data33}</td>
							<tr>
							<tr>
								<th>休闲餐饮</th>
								<td>一线${pd.data41}</td>
								<td>二线${pd.data42}</td>
								<td>三线${pd.data43}</td>
							<tr>
						</table>
						</td>
						<td>
						<table id="secodetable">
							<tr>
								<th>中餐</th>
								<td>一线${pd.data51}</td>
								<td>二线${pd.data52}</td>
								<td>三线${pd.data53}</td>
							<tr>
							<tr>
								<th>东南亚料理</th>
								<td>一线${pd.data61}</td>
								<td>二线${pd.data62}</td>
								<td>三线${pd.data63}</td>
							<tr>
							<tr>
								<th>快餐</th>
								<td>一线${pd.data71}</td>
								<td>二线${pd.data72}</td>
								<td>三线${pd.data73}</td>
							<tr>
							
						</table>
						</td>
					</tr>
					<tr style="border-top:1px solid #E7E6E4;">
						<th ><table id="firsttable">
							<tr><th><img src="<%=basePath%>/assets/imgs/home/购物车.png" style="width:15px;height:15px"/>服务</th></tr>
							<tr><td>${pd1.data20}个品牌，${pd1.data21}个一线，${pd1.data22}个二线，${pd1.data23}个三线</td></tr>
						</table></th>
						<td>
							<table id="secodetable">
								<tr>
									<th>护理</th>
									<td>一线${pd.data81}</td>
									<td>二线${pd.data82}</td>
									<td>三线${pd.data83}</td>
								</tr>
								<tr>
									<th>健身</th>
									<td>一线${pd.data91}</td>
									<td>二线${pd.data92}</td>
									<td>三线${pd.data93}</td>
								</tr>
							</table>
						</td>
						<td>
							<table id="secodetable">
								<tr>
									<th>生活</th>
									<td>一线${pd.data101}</td>
									<td>二线${pd.data102}</td>
									<td>三线${pd.data103}</td>
								</tr>
								<tr>
									<th>培训</th>
									<td>一线${pd.data111}</td>
									<td>二线${pd.data112}</td>
									<td>三线${pd.data113}</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr style="border-top:1px solid #E7E6E4;">
						<th ><table id="firsttable">
							<tr><th><img src="<%=basePath%>/assets/imgs/home/游戏机.png" style="width:15px;height:15px"/>娱乐</th></tr>
							<tr><td>${pd1.data30}个品牌${pd1.data31}个一线，${pd1.data32}个二线，${pd1.data33}个三线</td></tr>
						</table></th>
						<td>
							<table id="secodetable">
								
								<tr>
									<th>设施</th>
									<td>一线${pd.data121}</td>
									<td>二线${pd.data122}</td>
									<td>三线${pd.data123}</td>
								</tr>
							</table>
						</td>
						<td>
							<table id="secodetable">
								<tr>
									<th>体验</th>
									<td>一线${pd.data131}</td>
									<td>二线${pd.data132}</td>
									<td>三线${pd.data133}</td>
								</tr>
								
							</table>
						</td>
					</tr>
					<tr style="border-top:1px solid #E7E6E4;">
						<th ><table id="firsttable">
							<tr><th><img src="<%=basePath%>/assets/imgs/home/爱心.png" style="width:15px;height:15px"/>零售</th></tr>
							<tr><td>${pd1.data40}个品牌，${pd1.data41}个一线，${pd1.data42}个二线，${pd1.data43}个三线</td></tr>
						</table></th>
						<td>
							<table id="secodetable">
								<tr>
									<th>服装</th>
									<td>一线${pd.data141}</td>
									<td>二线${pd.data142}</td>
									<td>三线${pd.data143}</td>
								</tr>
								<tr>
									<th>珠宝钟表</th>
									<td>一线${pd.data151}</td>
									<td>二线${pd.data152}</td>
									<td>三线${pd.data153}</td>
								</tr>
								<tr>
									<th>数码电器</th>
									<td>一线${pd.data161}</td>
									<td>二线${pd.data162}</td>
									<td>三线${pd.data163}</td>
								</tr>
								<tr>
									<th>杂货</th>
									<td>一线${pd.data171}</td>
									<td>二线${pd.data172}</td>
									<td>三线${pd.data173}</td>
								</tr>
							</table>
						</td>
						<td>
							<table id="secodetable">
								<tr>
									<th>箱包、鞋、配饰</th>
									<td>一线${pd.data181}</td>
									<td>二线${pd.data182}</td>
									<td>三线${pd.data183}</td>
								</tr>
								<tr>
									<th>超市</th>
									<td>一线${pd.data191}</td>
									<td>二线${pd.data192}</td>
									<td>三线${pd.data193}</td>
								</tr>
								
								<tr>
									<th>化妆护肤</th>
									<td>一线${pd.data201}</td>
									<td>二线${pd.data202}</td>
									<td>三线${pd.data203}</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr style="border-top:1px solid #E7E6E4;">
						<th ><table id="firsttable">
							<tr><th><img src="<%=basePath%>/assets/imgs/home/儿童.png" style="width:15px;height:15px"/>儿童</th></tr>
							<tr><td>${pd1.data50}个品牌，${pd1.data51}个一线，${pd1.data52}个二线，${pd1.data53}个三线</td></tr>
						</table></th>
						<td>
							<table id="secodetable">
								<tr>
									<th>儿童零售</th>
									<td>一线${pd.data211}</td>
									<td>二线${pd.data212}</td>
									<td>三线${pd.data213}</td>
								</tr>
								<tr>
									<th>儿童培训</th>
									<td>一线${pd.data221}</td>
									<td>二线${pd.data222}</td>
									<td>三线${pd.data223}</td>
								</tr>
							</table>
						</td>
						<td>
						<table id="secodetable">
								<tr>
									<th>儿童娱乐</th>
									<td>一线${pd.data231}</td>
									<td>二线${pd.data232}</td>
									<td>三线${pd.data233}</td>
								</tr>
								<tr>
									<th>配套</th>
									<td>一线${pd.data241}</td>
									<td>二线${pd.data242}</td>
									<td>三线${pd.data243}</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr style="border-top:1px solid #E7E6E4;">
						<th><table id="firsttable">
							<tr><th><img src="<%=basePath%>/assets/imgs/home/店铺，门店.png" style="width:15px;height:15px"/>主力店</th></tr>
							<tr><td>913个品牌，805个一线，104个二线，22个三线</td></tr>
						</table></th>
						<td>
						<table id="secodetable">
								<tr>
									<th>一级主力店</th>
									<td>一线43</td>
									<td>二线30</td>
									<td>三线3</td>
								</tr>
								<tr>
									<th>二级主力店</th>
									<td>一线43</td>
									<td>二线30</td>
									<td>三线3</td>
								</tr>													
							</table>
							</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="end"><hr style="background-color: #034D98; height: 3px;" />利林置业商业地产综合业务管理平台·商家品牌库 COPYRIGHT @ 2016 ALLRIGHT RESSRVED</div>
	</div>
	
</body>
</html>