package com.ssm.sample.controller.base;

import java.io.IOException;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.sample.entity.Page;
import com.ssm.sample.util.Logger;
import com.ssm.sample.util.PageData;

public class BaseController {
	@Resource(name = "globalConf")
	protected Properties globalConf;

	protected Logger logger = Logger.getLogger(this.getClass());

	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected HttpSession session;

	@ModelAttribute
	protected void setReqAndRes(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
	}

	/**
	 * 得到PageData
	 */
	protected PageData getPageData() {
		return new PageData(this.getRequest());
	}

	/**
	 * 得到ModelAndView
	 */
	protected ModelAndView getModelAndView() {
		ModelAndView mv = new ModelAndView();
		return mv;
	}

	/**
	 * 得到request对象
	 */
	protected HttpServletRequest getRequest() {
		return request;
	}

	/**
	 * 得到response对象
	 */
	protected HttpServletResponse Response() {
		return response;
	}

	/**
	 * 得到分页列表的信息
	 */
	protected Page getPage() {
		return new Page();
	}

	protected static void logBefore(Logger logger, String interfaceName) {
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}

	protected static void logAfter(Logger logger) {
		logger.info("end");
		logger.info("");
	}

	protected void forward(String url) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getRequest().getRequestDispatcher(url);
		dispatcher.forward(this.request, this.response);
	}
}
