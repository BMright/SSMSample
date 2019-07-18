package com.ssm.sample.service.sample;

import org.springframework.stereotype.Service;
import com.ssm.sample.service.base.BaseService;
import com.ssm.sample.util.PageData;

@Service("loginService")
public class LoginService extends BaseService{


	public PageData getUserByUsername(String username) {
		PageData list = this.sqlSessionTemplate.<PageData> selectOne("sample.loginMapper.getUserByUsername", username);
		return list;
	}

}
