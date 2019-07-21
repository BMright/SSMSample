package com.ssm.sample.controller.sample;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.util.PageData;

@Controller
@RequestMapping({ "/brand", "/brandPopup", "/brandAjax" })
public class BrandController extends BaseController{

	@RequestMapping(value = "brandadd")
	@ResponseBody
	public PageData brandadd() {
		PageData pd = this.getPageData();
		
		System.out.println("执行");
		pd.put("status", "200");
		
		return pd;
	}
}
