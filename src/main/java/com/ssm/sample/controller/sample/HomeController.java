package com.ssm.sample.controller.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.facade.sample.HomeFacade;
import com.ssm.sample.util.PageData;
@Controller
@RequestMapping({"/home","/homePopup","/homeAjax"})
public class HomeController extends BaseController{
	
	@Autowired 
	private HomeFacade homeFacade;
	
	@RequestMapping(value="/home")
	public ModelAndView home() {
		ModelAndView mv =this.getModelAndView();
		this.setReqAndRes(request, response);
		PageData pdData = (PageData) session.getAttribute("username");
		System.out.println(pdData);
		
		PageData pd = new PageData();	
		pd = homeFacade.getCheckCount(pd);
		
		PageData pd1 = new PageData();
		pd1 = homeFacade.getFirstCheckCount(pd1);
		
		PageData pd2 = new PageData();
		pd2 = homeFacade.getClassCheckCount(pd2);
		
		mv.addObject("pd",pd);
		mv.addObject("pd1",pd1);
		mv.addObject("pd2",pd2); 
		mv.addObject("pdData", pdData);
		
		mv.setViewName("sample/home");		
		return mv;
	}
	
	@RequestMapping(value = "exit")
	public ModelAndView exit() {
		
		this.setReqAndRes(request, response);
		session.removeAttribute("username");
		
		return new ModelAndView("redirect:/login/login");
	}
	
}
