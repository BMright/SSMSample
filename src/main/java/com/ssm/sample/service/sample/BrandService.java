package com.ssm.sample.service.sample;

import java.util.List;
import com.ssm.sample.util.PageData;
import org.springframework.stereotype.Service;

import com.ssm.sample.service.base.BaseService;

@Service("brandService")
public class BrandService extends BaseService{
	
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
}
