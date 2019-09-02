package com.ssm.sample.service.sample;

import java.util.List;
import com.ssm.sample.util.PageData;
import org.springframework.stereotype.Service;

import com.ssm.sample.entity.Page;
import com.ssm.sample.service.base.BaseService;

@Service("brandService")
public class BrandService extends BaseService{
	/* 获取表中字段名 */
	public List<String> getAllColumn() {
		List<String> list = this.sqlSessionTemplate.selectList("sample.brandMapper.getAllColumn");
		return list;
	} 
	
	/* 获取全部信息 */
	public List<PageData> getAllInfo(){
		List<PageData> list = this.sqlSessionTemplate.selectList("sample.brandMapper.getAllInfo");
		return list;
	}
	
	//添加拓展联系人，并获得联系人id
	public Integer getIdByContacter(PageData pd){
		pd.put("expandingContact_id", "");
		this.sqlSessionTemplate.insert("sample.brandMapper.insertOnePeople", pd);
		Integer id;	
		try {
			id = Integer.parseInt(pd.getString("expandingContact_id"));
		} catch (Exception e) {
			id = 0;
		}
		return id;
	}
	
	//添加品牌
	public void insertOneBrand(PageData pd) {
		this.sqlSessionTemplate.insert("sample.brandMapper.insertOneBrand", pd);
	}
	
	//获取一级业态
	public List<PageData> getFirstClass(){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.brandMapper.getFirstClass");
		return list;
	}
	
	//获取二级业态
	public List<PageData> getSecondClass(Integer id){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.brandMapper.getSecondClass",id);
		return list;
	}
	
	//获取三级业态
	public List<PageData> getThirdClass(Integer id){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.brandMapper.getThirdClass",id);
		return list;
	}
	

	//通过查询条件获取品牌总数量
	public Integer getCheckCountByQuery(PageData pd) {
		Integer total = this.sqlSessionTemplate.selectOne("sample.brandMapper.getCheckCount",pd);
		return total;
	}
	
	//通过查询条件获取全部品牌列表
	public List<PageData> selectBrandList(Page page){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.brandMapper.selectBrandList",page);
		return list;
	}
	
	//获取数据库内容
	public List <PageData> selectCheckByPage(){
		List<PageData> list = this.sqlSessionTemplate.<PageData>selectList("sample.brandMapper.selectCheckByPage");
		return list;
	}
}
