var commonutil = commonutil || {};
/**
 * 设置ajax请求默认值
 */
/*
 * $.ajaxSetup({ beforeSend : function() { commonutil.load(); }, complete :
 * function() { commonutil.closeAllLoad(); }, cache : false });
 */
/**
 * 消息框
 */
commonutil.msg = function(msg) {
	top.layer.msg(msg);
}
/**
 * 加载框
 */
commonutil.load = function() {
	top.layer.load(0, {
		shade : [ 0.5, '#000' ]
	});
}
/**
 * 关闭所有加载框
 */
commonutil.closeAllLoad = function() {
	top.layer.closeAll('loading'); // 关闭加载层
}
/**
 * 提示框
 */
commonutil.alert = function(msg) {
	top.layer.alert(msg, {
		fix : true,
		title : '信息'
	});
}
/**
 * 通用ajax方法
 */
commonutil.ajaxCommon = function(url, param, callback) {
	debugger;
	$.ajax({
		type : "POST",
		url : url,
		data : param,
		dataType : 'json',
		success : function(result) {
			debugger;
			if (typeof callback === "function") {
				callback(result, param);
			}
		},
		error : function(result) {
			debugger;
			top.layer.closeAll();
			top.layer.msg('系统错误！');
		}
	});
};
/**
 * 通问询对话框
 */
commonutil.confirmCommon = function(htmlText, title, callback, param) {
	top.layer.confirm(htmlText, {
		btn : [ '确认', '取消' ], // 按钮
		shade : 0.6, // 显示遮罩
		title : title
	}, function() {
		if (typeof callback === "function") {
			callback(param);
		}
		top.layer.closeAll();
	}, function() {

	});
};
/**
 * 显示提示信息
 * 
 * @param tips
 * @param obj
 */
commonutil.showTips = function(tips, obj, direction) {
	if (!direction) {
		direction = 3; // 默认朝下
	}
	layer.tips(tips, obj, {
		time : 2000,
		tips : [ direction, '#ee7474' ]
	});
};