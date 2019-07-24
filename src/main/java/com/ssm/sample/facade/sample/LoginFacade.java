package com.ssm.sample.facade.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.service.sample.LoginService;
import com.ssm.sample.util.PageData;

@Service("loginFacade")
public class LoginFacade extends BaseController{
	@Autowired
	private LoginService loginService;
	
	public PageData getUserByUsername(PageData pd) {
		PageData list = loginService.getUserByUsername(pd.getString("username"));
		return list;
	}

}
