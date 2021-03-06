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
	
	//跳转到登录页面
	@RequestMapping(value = "login")
	public ModelAndView login() {
		ModelAndView mv = this.getModelAndView();
		
		//获取session域
		this.setReqAndRes(request, response);
		//获取username值
		PageData username = (PageData) session.getAttribute("username");
		//判断是否已经登录
		if (username != null) {
			/*
			 * mv.addObject("pd",pageData); 
			 * mv.setViewName("sample/home");
			 */
			//重定向到主页面
			return new ModelAndView("redirect:/home/home");
		}
		mv.setViewName("sample/login");
		return mv;
	}
	
	//返回信息
	@RequestMapping(value = "getUserByUsername")
	@ResponseBody
	public PageData getUserByUsername() {
		PageData pd = this.getPageData();
		String password = pd.getString("password");
		
		pageData=loginFacade.getUserByUsername(pd);	
		
		if (pageData.getString("password").equals(password)) {
			pageData.put("status", "200");
			//设置session域信息
			session.setAttribute("username", pageData);
			//设置session有效时间为30分钟
			session.setMaxInactiveInterval(30*60);
		}else {
			pageData.put("status", "500");
		}
		return pageData;
	}
	
}
