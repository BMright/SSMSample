package com.ssm.sample.facade.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.sample.entity.Page;
import com.ssm.sample.facade.base.BaseFacade;
import com.ssm.sample.service.sample.EmpService;
import com.ssm.sample.util.PageData;

@Service("empFacade")
public class EmpFacade extends BaseFacade {
	@Autowired
	private EmpService empService;

	/**
	 * 根据条件查询符合条件的雇员
	 * 
	 * @param pd
	 * @return
	 */
	public List<PageData> selectEmpList(Page page) {
		List<PageData> list = this.empService.selectEmpList(page);
		return list;
	}

	/**
	 * 获取单个雇员的信息
	 * 
	 * @param id
	 * @return
	 */
	public PageData getEmpInfoById(String id) {
		return this.empService.getEmpInfoById(id);
	}

	/**
	 * 删除单个雇员
	 * 
	 * @param id
	 * @return
	 */
	public boolean deleteOneEmp(String id) {
		return this.empService.deleteOneEmp(id);
	}

	/**
	 * 更新单个雇员的基本信息
	 * 
	 * @param pd
	 * @return
	 */
	public boolean editOneEmp(PageData pd) {
		return this.empService.editOneEmp(pd);
	}

	/**
	 * 添加新的雇员信息
	 * 
	 * @param pd
	 * @return
	 */
	public boolean addOneEmp(PageData pd) {
		return empService.addOneEmp(pd);
	}

	/**
	 * 获取所有的部门列表
	 * 
	 * @return
	 */
	public List<PageData> getAllDeptList() {
		return empService.getAllDeptList();
	}
}
