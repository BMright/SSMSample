package com.ssm.sample.controller.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.facade.sample.LoginFacade;
import com.ssm.sample.util.PageData;

@Controller
@RequestMapping({ "/login", "/loginPopup", "/loginAjax" })
public class LoginController extends BaseController{

	@Autowired
	private LoginFacade loginFacade;
	
	private PageData pageData;
	
	@RequestMapping(value = "index")
	public ModelAndView index() {
		ModelAndView mv = this.getModelAndView();	
		mv.setViewName("sample/login");
		return mv;
	}
	
	@RequestMapping(value = "getUserByUsername")
	@ResponseBody
	public PageData getUserByUsername() {
		PageData pd = this.getPageData();
		String password = pd.getString("password");
		
		pageData = loginFacade.getUserByUsername(pd);	
		if (pageData.getString("password").equals(password)) {
			pageData.put("status", "200");
		}else {
			pageData.put("status", "500");
		}
		
		//pageData = pd;
		
		return pageData;
	}
	
	@RequestMapping(value = "login")
	public ModelAndView login(Object object) {
		ModelAndView mv = new ModelAndView();
		
		PageData pd = pageData;
		mv.addObject("pd", pd);
		mv.setViewName("brandAdd/brandAdd");
		
		return mv;
	}
}
