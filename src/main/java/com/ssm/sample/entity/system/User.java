package com.ssm.sample.entity.system;

/**
 * 系统使用的用户信息
 * 
 * @author Administrator
 *
 */
public class User {
	private long userid;
	private String username;
	private String realname;
	private String userphoto;

	public static User getDefaultUser() {
		User user = new User();
		user.setUserid(1);
		user.setUsername("测试用户");
		user.setRealname("模拟用户");
		user.setUserphoto("/uploadfiles/user/default.jpg");
		return user;
	}

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getUserphoto() {
		return userphoto;
	}

	public void setUserphoto(String userphoto) {
		this.userphoto = userphoto;
	}

}
