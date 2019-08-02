<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<title>雇员管理</title>
<style type="text/css">
tr td a {
	color: #095eaf;
	cursor: pointer;
	margin: 0px 5px;
}
</style>
<script type="text/javascript">
function editEmp(empid){
	layer.open({
		type : 2,
		title : "编辑雇员",
		shadeClose : false,
		shade : 0.8,
		area : [ '800px', '50%' ],
		content : root + "/empPopup/editEmp?empid=" + empid
	});
}

function addEmp(empid){
	layer.open({
		type : 2,
		title : "添加雇员",
		shadeClose : false,
		shade : 0.8,
		area : [ '800px', '50%' ],
		content : root + "/empPopup/addEmp"
	});
}

function deleteEmp(empid){
	commonutil.confirmCommon("确认删除该雇员？", "信息", function() {
		var param = {
			"empid" : empid
		}
		// 删除数据并加载
		$.ajax({
			beforeSend : function() {
				commonutil.load();
			},
			complete : function() {
				commonutil.closeAllLoad();
			},
			type : 'POST',
			url : root+ '/empAjax/deleteEmp',
			data : param,
			dataType : "json",
			success : function(data) {
				layer.alert('删除成功！');
				$("#testForm").submit();
			},
			error : function(data) {
				layer.alert('操作失败：系统错误！' + data.data);
			}
		})
	});
}

function exeQuery(){
	debugger;
	$("#testForm").submit();
}
</script>
</head>
<body>
	<div class="row form-horizontal" style="margin: 30px 100px;">
		<div class="block-level-2">
			<form action="<%=path%>/emp/index" method="post" name="testForm" id="testForm" dt="pageform">
				<div class="row" style="text-align: center;">
					<div class="col-md-4">
						<label class="col-md-3 control-label">部门</label>
						<div class="col-md-7 ui-input-text">                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
				                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              			<select id="deptno" name="deptno" class="form-control">
								<option value="">请选择部门</option>
								<c:if test="${not empty deptList}">
									<c:forEach items="${deptList}" var="var" varStatus="vs">
										<option value="${var.deptno}" <c:if test="${var.deptno eq pd.deptno}">selected</c:if>>${var.deptName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<label class="col-md-3 control-label">薪水区间</label>
						<div class="col-md-7 ui-input-text">
							<input id="minsal" name="minsal" class="form-control" style="width: 100px; display: inline-block;" value='${pd.minsal}' />-<input id="maxsal" name="maxsal" class="form-control"
								style="width: 100px; display: inline-block;" value='${pd.maxsal}' />
						</div>
					</div>
					<div class="col-md-4">
						<label class="col-md-3 control-label">关键字</label>
						<div class="col-md-7 ui-input-text">
							<input id="keyword" name="keyword" value="${pd.keyword}" placeholder="名称/住址" type="text" class="ui-from-imput form-control"></input> <i class="hbvat-icon hbvat-icon-sousuo"></i>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="btn-md-group">
						<button type="reset" class="btn btn-df btn-default">重置</button>
						<button type="submit" class="btn btn-df btn-success">查询</button>
					</div>
				</div>
			</form>
		</div>
		<div class="row" style="padding: 15px;">
			<div class="row">
				<button type="button" class="btn btn-df btn-success" style="float: right;" onclick="addEmp()">添加</button>
			</div>
			<div style="text-align: right">
				<div>${page.pageStrPart2}</div>
			</div>

			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th width="10%" style="text-align: center;">序号</th>
						<th>姓名</th>
						<th>电话</th>
						<th>邮箱</th>
						<th>地址</th>
						<th>工作</th>
						<th>薪水</th>
						<th>部门</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty empList}">
							<c:forEach items="${empList }" var="var" varStatus="vs">
								<tr>
									<td align="center">${vs.index+1 }</td>
									<td>${var.empName }</td>
									<td>${var.phone }</td>
									<td>${var.email }</td>
									<td>${var.address }</td>
									<td>${var.job }</td>
									<td>${var.sal }</td>
									<td>${var.deptName }</td>
									<td><a onclick="deleteEmp(${var.empId})">删除</a><a onclick="editEmp(${var.empId})">编辑</a></td>
								</tr>
							</c:forEach>
						</c:when>
					</c:choose>
				</tbody>
			</table>
			<div style="text-align: center">
				<div>${page.pageStr}</div>
			</div>
		</div>
	</div>
</body>