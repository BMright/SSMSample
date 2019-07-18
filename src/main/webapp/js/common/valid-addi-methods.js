/**
 * 是否为合适的日期的validation
 */
jQuery.validator.addMethod("isBusinessDate", function(value, element, param) {
	var rtn = false;
	if("2099.12.31"==value || "9999.12.31"==value || "1970.01.01"==value ){
		rtn = false;
	}else if((!jQuery.isEmptyObject(value))&& value.length !=10){
		rtn = false;
	}else{
		rtn = true;
	}
	return rtn;
}, $.validator.format("请输入有效的日期。"));
/**
 * 开始日期和结束日期的validation
 */
jQuery.validator.addMethod("isStartEndDateTrue", function(value, element, param) {
	//debugger;
	var rtn = false;
	if(jQuery.isEmptyObject(param) || jQuery.type(param)!="array" || param.length!=2){
		rtn = false;
	}else{
		var s_dateId=param[0];
		var e_dateId=param[1];
		
		var s_date=$("#" + s_dateId).val();
		var e_date=$("#" + e_dateId).val();
		
		if(s_date>=e_date){
			rtn = false;
		}else{
			rtn = true;
		}
	}
	return rtn;
}, $.validator.format("请确认日期先后。"));

/**
 * 日期是否在某个期间内的validation
 */
jQuery.validator.addMethod("isDateInRange", function(value, element, param) {
	//debugger;
	if(""==value)return true;
	var rtn = false;
	if(jQuery.isEmptyObject(param) || jQuery.type(param)!="array" || param.length!=2){
		rtn = false;
	}else{
		var s_date=param[0];
		var e_date=param[1];
		
		if(value>= s_date && value<=e_date){
			rtn = true;
		}else{
			rtn = false;
		}
	}
	return rtn;
}, $.validator.format("请确认日期是否在合同期内。"));


/**
 * 日期是否在某个期间内的validation
 */
jQuery.validator.addMethod("isStartDateOk", function(value, element, param) {
	debugger;
	var rtn = false;
	if(jQuery.isEmptyObject(param) || jQuery.type(param)!="array" || param.length!=1){
		rtn = false;
	}else{
		var s_date=param[0];
		var s_m= s_date.substring(0,7);
		var c_m= value.substring(0,7);
		var c_d= value.substring(8,10);
		
		if(s_m != c_m){
			if(c_d != "01"){
				rtn =false;
			}else{
				rtn =true;
			}
		}else{
			rtn =true;
		}
	}
	return rtn;
}, $.validator.format("在非合同开始月,开始日须为01日."));

/**
 * 开始日期和结束日期的validation
 */
jQuery.validator.addMethod("isStartEndDateTrueIncludeEQ", function(value, element, param) {
	//debugger;
	var rtn = false;
	if(jQuery.isEmptyObject(param) || jQuery.type(param)!="array" || param.length!=2){
		rtn = false;
	}else{
		var s_dateId=param[0];
		var e_dateId=param[1];
		
		var s_date=$("#" + s_dateId).val();
		var e_date=$("#" + e_dateId).val();
		
		if(s_date>e_date){
			rtn = false;
		}else{
			rtn = true;
		}
	}
	return rtn;
}, $.validator.format("请确认日期先后（可以相等）。"));
