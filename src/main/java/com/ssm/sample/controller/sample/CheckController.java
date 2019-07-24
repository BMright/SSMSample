package com.ssm.sample.controller.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.facade.sample.CheckFacade;
import com.ssm.sample.util.PageData;
@Controller
@RequestMapping({ "/check", "/checkPopup", "/checkAjax" })
public class CheckController extends BaseController{

	 @RequestMapping(value = "check") 
	 public ModelAndView check() {
		 ModelAndView mv = this.getModelAndView(); 
		 mv.setViewName("sample/check"); return mv; 
		 }
	

	@Autowired
	private CheckFacade checkFacade;
	
	//获取数据库内容
	@RequestMapping(value = "selectCheckByPage")
	@ResponseBody
	public List <PageData> selectCheckByPage(){
		List<PageData> list = checkFacade.selectCheckByPage();
		return list;
	}
	
	//获取数据库内容总数
	@RequestMapping(value = "getCheckCount")
	@ResponseBody
	public List <PageData> getCheckCount(){
		List<PageData> list =checkFacade.getCheckCount();
		return list;
	}
	
	//获取一级业态
	@RequestMapping(value = "getFirstClass")
	@ResponseBody
	public List<PageData> getFirstClass() {
		List<PageData> list = checkFacade.getFirstClass();	
		return list;
	}
	
	//获取二级业态
	@RequestMapping(value = "getSecondClass")
	@ResponseBody
	public List<PageData> getSecondClass() {
		PageData pd = this.getPageData();
		Integer id = Integer.parseInt(pd.getString("id"));		
		List<PageData> list = checkFacade.getSecondClass(id);	
		return list;
	}
	
	//获取三级业态
	@RequestMapping(value = "getThirdClass")
	@ResponseBody
	public List<PageData> getThirdClass() {
		PageData pd = this.getPageData();
		Integer id = Integer.parseInt(pd.getString("id"));		
		List<PageData> list = checkFacade.getThirdClass(id);	
		return list;
	}
}
