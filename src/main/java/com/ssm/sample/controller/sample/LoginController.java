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
	
	@RequestMapping(value = "login")
	public ModelAndView login() {
		ModelAndView mv = this.getModelAndView();	
		mv.setViewName("sample/login");
		return mv;
	}
	
	@RequestMapping(value = "getUserByUsername")
	@ResponseBody
	public PageData getUserByUsername() {
		PageData pd = this.getPageData();
		String password = pd.getString("password");
		
		pd = loginFacade.getUserByUsername(pd);	
		if (pd.getString("password").equals(password)) {
			pd.put("status", "200");
		}else {
			pd.put("status", "500");
		}
		
		return pd;
	}
}
