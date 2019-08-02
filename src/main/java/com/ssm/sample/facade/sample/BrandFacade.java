package com.ssm.sample.facade.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.sample.facade.base.BaseFacade;
import com.ssm.sample.service.sample.BrandService;
import com.ssm.sample.util.PageData;

@Service("brandFacade")
public class BrandFacade extends BaseFacade{

	@Autowired
	private BrandService brandService;
	
	//添加品牌
	public void insertOneBrand(PageData pd) {
		Integer id = brandService.getIdByContacter(pd);
		/* System.out.println("id"); */
		pd.put("contact_name", id);
		brandService.insertOneBrand(pd);
	}
	
	//获取一级业态
	public List<PageData> getFirstClass(){
		List<PageData> list = brandService.getFirstClass();
		return list;
	}
	
	//获取二级业态
	public List<PageData> getSecondClass(Integer id){
		List<PageData> list = brandService.getSecondClass(id);
		return list;
	}
	
	//获取三级业态
	public List<PageData> getThirdClass(Integer id){
		List<PageData> list = brandService.getThirdClass(id);
		return list;
	}
	
}
