package com.ssm.sample.service.sample;

import java.util.List;
import com.ssm.sample.util.PageData;
import org.springframework.stereotype.Service;

import com.ssm.sample.service.base.BaseService;

@Service("brandService")
public class BrandService extends BaseService{
	
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
