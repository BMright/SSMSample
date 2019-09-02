package com.ssm.sample.controller.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.entity.Page;
import com.ssm.sample.facade.sample.CheckFacade;
import com.ssm.sample.util.PageData;
@Controller
@RequestMapping({ "/check", "/checkPopup", "/checkAjax" })
public class CheckController extends BaseController{

	@Autowired
	private CheckFacade checkFacade;
	
	/**
	 *  改变审核状态
	 * @return
	 */
	@RequestMapping(value = "passOrFail")
	@ResponseBody
	public PageData passOrFail() {
		PageData pd = this.getPageData();
		Integer id = Integer.parseInt(pd.getString("id"));
		Integer status = Integer.parseInt(pd.getString("status"));
		checkFacade.changeStatus(pd);
		// pd = checkFacade.changeStatus(id);
		System.out.println("id+" + id);
		System.out.println("status+" + status);
		return pd;
	}
	
	/**
	 *  查看品牌信息返回数据
	 * @return
	 */
	@RequestMapping(value = "lookBrand")
	@ResponseBody
	public PageData lookBrand() {
		PageData pd = this.getPageData();
		Integer id = Integer.parseInt(pd.getString("id"));
		pd = checkFacade.getBrandById(id);
		System.out.println("id+" + id);
		return pd;
	}
	
	/**
	 * 跳转到审核页面
	 */
	 @RequestMapping(value = "check") 
	 public ModelAndView check() {
		 ModelAndView mv = this.getModelAndView(); 
		 this.setReqAndRes(request, response);
		 PageData pdData = (PageData) session.getAttribute("username");
		 mv.addObject("pdData", pdData);
		 mv.setViewName("sample/check"); 
		 return mv; 
	}
	
	//通过条件获取到全部的品牌列表
	@RequestMapping(value = "getBrandListByQuery")
	public ModelAndView getBrandListByQuery(Page page) {
		ModelAndView mv = new ModelAndView();
		PageData pd = this.getPageData();
		System.out.println(page);
		System.out.println(pd);
		try {
			page = checkFacade.setParameterOfPage(page, pd);	
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		List<PageData> brandList = checkFacade.selectBrandList(page);
		System.out.println(brandList);
		
		mv.addObject("brandList", brandList);
		mv.addObject("pd", pd);
		mv.addObject("page", page);
		mv.setViewName("sample/check");
		return mv;
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
