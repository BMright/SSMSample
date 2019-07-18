var sample2 = sample2 || {};
sample2.alert = function() {
	commonutil.alert("hello");
}
sample2.load = function() {
	commonutil.load();
};
sample2.msg = function() {
	commonutil.msg("hello");
};
sample2.testCallback = function(param) {
	console.log(11111);
	console.log(param.a + "---" + param.b);
};
sample2.confirm = function() {
	var param = {
		a : '1',
		b : '2'
	};
	commonutil.confirmCommon("确认删除该条记录？", "警告", sample2.testCallback, param);
}
sample2.open = function() {
	window.parent.layer.open({
		type : 2,
		title : '项目信息添加',
		shadeClose : false,
		shade : 0.8,
		area : [ '80%', '90%' ],
		content : "http://www.baidu.com"
	});
}

$(function() {
	$("#btnAlert").click(function() {
		sample2.alert();
	});
	$("#btnLoad").click(function() {
		sample2.load();
	});
	$("#btnOpen").click(function() {
		sample2.open();
	});
	$("#btnConfirm").click(function() {
		sample2.confirm();
	});
	$("#btnMsg").click(function() {
		sample2.msg();
	});
});