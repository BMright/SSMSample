package com.ssm.sample.service.sample;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssm.sample.entity.Page;
import com.ssm.sample.service.base.BaseService;
import com.ssm.sample.util.PageData;

@Service("checkService")
public class CheckService extends BaseService{
	
	//通过查询条件获取品牌总数量
	public Integer getCheckCountByQuery(PageData pd) {
		Integer total = this.sqlSessionTemplate.selectOne("sample.checkMapper.getCheckCount",pd);
		return total;
	}
	
	//通过查询条件获取全部品牌列表
	public List<PageData> selectBrandList(Page page){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.checkMapper.selectBrandList",page);
		return list;
	}
	
	//获取数据库内容
	public List <PageData> selectCheckByPage(){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.checkMapper.selectCheckByPage");
		return list;
	}

	/*
	 * //获取数据库内容总数 public List <PageData> getCheckCount(){ List<PageData> list =
	 * this.sqlSessionTemplate.<PageData>selectList(
	 * "sample.checkMapper.getCheckCount"); return list; }
	 */
	
	//获取一级业态
	public List<PageData> getFirstClass(){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.checkMapper.getFirstClass");
		return list;
	}
		
	//获取二级业态
	public List<PageData> getSecondClass(Integer id){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.checkMapper.getSecondClass",id);
		return list;
	}
		
	//获取三级业态
	public List<PageData> getThirdClass(Integer id){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.checkMapper.getThirdClass",id);
		return list;
	}

}
