package com.ssm.sample.controller.sample;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.facade.sample.SampleFacade;
import com.ssm.sample.util.PageData;

/**
 * 框架使用示例
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping({ "/sample", "/samplePopup", "/sampleAjax" })
public class SampleController extends BaseController {

	@Autowired
	private SampleFacade sampleFacade;

	// 和上面的初始化方式是相同的
	// @Resource("sampleFacade")
	// private SampleFacade sampleFacade;

	/**
	 * 请求网址，展示数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "helloWorld")
	public ModelAndView helloWorld() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			pd.put("NAME", "Hello World");
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		mv.addObject("pd", pd);
		mv.setViewName("sample/helloWorld");
		return mv;
	}

	/**
	 * 请求网址，展示数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "calc")
	public ModelAndView calc() {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("sample/calc");
		return mv;
	}

	/**
	 * 请求网址，展示数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "calcResult")
	public ModelAndView calcResult() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			String aString = pd.getString("a");
			String bString = pd.getString("b");
			int sum = sampleFacade.add(aString, bString);
			pd.put("sum", sum);
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		mv.addObject("pd", pd);
		mv.setViewName("sample/calcResult");
		return mv;
	}

	/**
	 * Ajax 请求
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/testAjax")
	public Object testAjax() {
		Map<String, Object> result = new HashMap<String, Object>();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			String aString = pd.getString("a");
			String bString = pd.getString("b");
			int sum = sampleFacade.add(aString, bString);
			result.put("sum", sum);// 字符串
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 访问数据库
	 * 
	 * @return
	 */
	@RequestMapping(value = "testDataBase")
	public ModelAndView testDataBase() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			List<PageData> list = sampleFacade.testListPage(pd);
			mv.addObject("testList", list);
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		mv.setViewName("sample/testDataBase");
		return mv;
	}

	@RequestMapping(value = "cssdemo")
	public ModelAndView cssdemo() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
		} catch (Exception e) {
			logger.error(e);
		}
		mv.addObject("pd", pd);
		mv.setViewName("sample/cssdemo");
		return mv;
	}

}
