package com.ssm.sample.service.sample;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssm.sample.entity.Page;
import com.ssm.sample.service.base.BaseService;
import com.ssm.sample.util.PageData;

/**
 * 雇员服务类
 * 
 * @author Administrator
 *
 */
@Service("empService")
public class EmpService extends BaseService {

	/**
	 * 根据条件查询符合条件的雇员
	 * 
	 * @param pd
	 * @return
	 */
	public List<PageData> selectEmpList(Page page) {
		List<PageData> list = this.sqlSessionTemplate.<PageData> selectList("sample.empMapper.selectlistPage", page);
		return list;
	}

	/**
	 * 获取单个雇员的信息
	 * 
	 * @param id
	 * @return
	 */
	public PageData getEmpInfoById(String id) {
		return this.sqlSessionTemplate.<PageData> selectOne("sample.empMapper.selectOneInfo", id);
	}

	/**
	 * 删除单个雇员
	 * 
	 * @param id
	 * @return
	 */
	public boolean deleteOneEmp(String id) {
		int count = this.sqlSessionTemplate.delete("sample.empMapper.deleteOneInfo", id);
		return count > 0;
	}

	/**
	 * 更新单个雇员的基本信息
	 * 
	 * @param pd
	 * @return
	 */
	public boolean editOneEmp(PageData pd) {
		int count = this.sqlSessionTemplate.update("sample.empMapper.updateOneInfo", pd);
		return count > 0;
	}

	/**
	 * 添加新的雇员信息
	 * 
	 * @param pd
	 * @return
	 */
	public boolean addOneEmp(PageData pd) {
		int count = this.sqlSessionTemplate.insert("sample.empMapper.insertOneInfo", pd);
		return count > 0;
	}

	/**
	 * 获取所有的部门列表
	 * 
	 * @return
	 */
	public List<PageData> getAllDeptList() {
		List<PageData> list = this.sqlSessionTemplate.<PageData> selectList("sample.empMapper.selectAllDept");
		return list;
	}
}
