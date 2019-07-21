package com.ssm.sample.controller.sample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.util.PageData;

@Controller
@RequestMapping({ "/brand", "/brandPopup", "/brandAjax" })
public class BrandController extends BaseController{

	@RequestMapping(value = "addBrand")
	@ResponseBody
	public PageData addBrand() {
		PageData pd = this.getPageData();
		
		System.out.println("执行");
		
		return pd;
	}
}
