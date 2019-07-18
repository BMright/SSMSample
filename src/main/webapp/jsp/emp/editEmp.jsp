<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<title>编辑雇员</title>
<script type="text/javascript">
	$(function() {
		//确认添加
		$(".btn-success").click(
				function() {
					var _rules = {};
					$("#form").validate({
						debug : true,
						onsubmit : false,
						rules : _rules,
						errorPlacement : function(error, element) {
							error.insertAfter(element);
						}
					});
					if ($("#form").valid()) {
						var fields = $("#form").serializeArray();
						var url = root + "/empAjax/editEmpSubmit";
						var param = $.each(fields, function(i, field) {
							field.name + ":" + field.value;
						});
						$.ajax({
							type : "POST",
							url : url,
							data : param,
							dataType : 'json',
							success : function(result) {
								parent.layer.alert('编辑成功', function(index) {
									parent.exeQuery();
									parent.layer.closeAll();
								});
							},
							error : function(result) {
								parent.layer.alert("编辑失败：" + data.data,
										function(index) {
											parent.layer.closeAll();
										});
							}
						});
					}
				});
		//取消添加
		$(".btn-default").click(function() {
			parent.layer.closeAll();
		});
	})
</script>
</head>
<body>
	<div class="form-horizontal">
		<div style="padding: 20px;">
			<form id="form" name="form" method="post">
				<input type="hidden" name="empid" id="empid" value="${pd.empid}" />
				<div class="row">
					<div class="col-sm-6">
						<label class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-7 ui-input-text">
							<input id="empname" name="empname" type="text" class="form-control required" placeholder="姓名" value="${empPD.empName }">
						</div>
					</div>
					<div class="col-sm-6">
						<label class="col-sm-4 control-label">电话</label>
						<div class="col-sm-7 ui-input-text">
							<input id="phone" name="phone" type="text" class="form-control required" placeholder="电话" value="${empPD.phone }">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<label class="col-sm-4 control-label">邮箱</label>
						<div class="col-sm-7 ui-input-text">
							<input id="email" name="email" type="text" class="form-control required" placeholder="邮箱" value="${empPD.email }">
						</div>
					</div>
					<div class="col-sm-6">
						<label class="col-sm-4 control-label">地址</label>
						<div class="col-sm-7 ui-input-text">
							<input id="address" name="address" type="text" class="form-control required" placeholder="地址" value="${empPD.address }">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<label class="col-sm-4 control-label">工作</label>
						<div class="col-sm-7 ui-input-text">
							<input id="job" name="job" type="text" class="form-control required" placeholder="工作" value="${empPD.job }">
						</div>
					</div>
					<div class="col-sm-6">
						<label class="col-sm-4 control-label">薪水</label>
						<div class="col-sm-7 ui-input-text">
							<input id="sal" name="sal" type="text" class="form-control required" placeholder="薪水" value="${empPD.sal }">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<label class="col-sm-4 control-label">部门</label>
						<div class="col-sm-7 ui-input-text">
							<select id="deptno" name="deptno" class="form-control">
								<option value="">请选择部门</option>
								<c:if test="${not empty deptList}">
									<c:forEach items="${deptList}" var="var" varStatus="vs">
										<option value="${var.deptno}" <c:if test="${var.deptno eq empPD.deptno}">selected</c:if>>${var.deptName}</option>
									</c:forEach>
								</c:if>
							</select>
						</div>
					</div>
				</div>
				<div class="row" style="height: 30px;">
					<div class="ui-hr-solid"></div>
				</div>
				<div class="row">
					<div class="btn-md-group">
						<button type="button" class="btn btn-df btn-default">取消</button>
						<button type="button" class="btn btn-df btn-success">确定</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>