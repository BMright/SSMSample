package com.ssm.sample.controller.sample;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.entity.Page;
import com.ssm.sample.facade.sample.EmpFacade;
import com.ssm.sample.util.PageData;

@Controller
@RequestMapping({ "/emp", "/empPopup", "/empAjax" })
public class EmpController extends BaseController {
	@Autowired
	private EmpFacade empFacade;

	/**
	 * 首页查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(Page page) {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			page.setPd(pd);
			List<PageData> empList = empFacade.selectEmpList(page);
			
			List<PageData> deptList = empFacade.getAllDeptList();
			mv.addObject("empList", empList);
			mv.addObject("deptList", deptList);
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		mv.addObject("pd", pd);
		mv.addObject("page", page);
		mv.setViewName("emp/index");
		return mv;
	}

	/**
	 * 添加一个雇员页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addEmp")
	public ModelAndView addEmp() {
		ModelAndView mv = this.getModelAndView();
		List<PageData> deptList = empFacade.getAllDeptList();
		mv.addObject("deptList", deptList);
		mv.setViewName("emp/addEmp");
		return mv;
	}

	/**
	 * 添加一个雇员
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/addEmpSubmit")
	public Object addEmpSubmit() {
		Map<String, Object> result = new HashMap<String, Object>();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			boolean b = this.empFacade.addOneEmp(pd);
			if (b) {
				result.put("status", "OK");
			} else {
				result.put("status", "ERROR");
			}
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			result.put("status", "ERROR");
		}
		return result;
	}

	/**
	 * 编辑雇员
	 * 
	 * @return
	 */
	@RequestMapping(value = "/editEmp")
	public ModelAndView editEmp() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			String empid = pd.getString("empid");
			PageData empPD = this.empFacade.getEmpInfoById(empid);
			mv.addObject("empPD", empPD);
			List<PageData> deptList = empFacade.getAllDeptList();
			mv.addObject("deptList", deptList);
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		mv.addObject("pd", pd);
		mv.setViewName("emp/editEmp");
		return mv;
	}

	/**
	 * 编辑雇员提交
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editEmpSubmit")
	public Object editEmpSubmit() {
		Map<String, Object> result = new HashMap<String, Object>();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			boolean b = this.empFacade.editOneEmp(pd);
			if (b) {
				result.put("status", "OK");
			} else {
				result.put("status", "ERROR");
			}
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			result.put("status", "ERROR");
		}
		return result;
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deleteEmp")
	public Object deleteEmp() {
		Map<String, Object> result = new HashMap<String, Object>();
		PageData pd = new PageData();
		try {
			pd = this.getPageData();
			pd = this.getPageData();
			String empid = pd.getString("empid");
			if (StringUtils.isBlank(empid)) {
				result.put("status", "ERROR");
				result.put("msg", "获取雇员ID失败");
			} else {
				boolean b = this.empFacade.deleteOneEmp(empid);
				if (b) {
					result.put("status", "OK");
				} else {
					result.put("status", "ERROR");
					result.put("msg", "删除失败");
				}
			}
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			result.put("status", "ERROR");
			result.put("msg", e.getMessage());
		}
		return result;
	}
}
