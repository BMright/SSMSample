package com.ssm.sample.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	/**
	 *  在拦截点执行前拦截，如果返回true则不执行拦截点后的操作（拦截成功）
	 *  返回false则不执行拦截
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		request.setCharacterEncoding("utf-8"); 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		
		String uri = request.getRequestURI(); // 获取登录的uri，这个是不进行拦截的
		if(session.getAttribute("username")!=null || uri.indexOf("login/login")>=0) {
			// 说明登录成功 或者 执行登录功能
			return true;
		}
		else {
			response.sendRedirect(request.getContextPath()+"/login/login");
			return false;
		}
		/*if(session.getAttribute("username")!=null) {
			// 登录成功不拦截
			return true;
		}else {
			// 拦截后进入登录页面
			response.sendRedirect(request.getContextPath()+"/login/login");
			return false;
		}*/
		
	}
}
