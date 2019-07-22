package com.ssm.sample.controller.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.facade.sample.BrandFacade;
import com.ssm.sample.util.PageData;

@Controller
@RequestMapping({ "/brand", "/brandPopup", "/brandAjax" })
public class BrandController extends BaseController{

	@Autowired
	private BrandFacade brandFacade;
	
	//获取一级业态
	@RequestMapping(value = "getFirstClass")
	@ResponseBody
	public List<PageData> getFirstClass() {
		List<PageData> list = brandFacade.getFirstClass();	
		return list;
	}
	
	//获取二级业态
	@RequestMapping(value = "getSecondClass")
	@ResponseBody
	public List<PageData> getSecondClass() {
		PageData pd = this.getPageData();
		Integer id = Integer.parseInt(pd.getString("id"));		
		List<PageData> list = brandFacade.getSecondClass(id);	
		return list;
	}
	
	//获取三级业态
	@RequestMapping(value = "getThirdClass")
	@ResponseBody
	public List<PageData> getThirdClass() {
		PageData pd = this.getPageData();
		Integer id = Integer.parseInt(pd.getString("id"));		
		List<PageData> list = brandFacade.getThirdClass(id);	
		return list;
	}
	
	@RequestMapping(value = "brandadd")
	@ResponseBody
	public PageData brandadd() {
		PageData pd = this.getPageData();
		
		System.out.println("执行");
		pd.put("status", "200");
		return pd;
	}
}
