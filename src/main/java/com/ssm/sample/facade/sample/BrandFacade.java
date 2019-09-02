package com.ssm.sample.facade.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.sample.entity.Page;
import com.ssm.sample.facade.base.BaseFacade;
import com.ssm.sample.service.sample.BrandService;
import com.ssm.sample.util.PageData;

@Service("brandFacade")
public class BrandFacade extends BaseFacade{

	@Autowired
	private BrandService brandService;
	
	/* 获取表中字段名 */
	public List<String> getAllColumn() {
		List<String> pd = brandService.getAllColumn();
		return pd;
	} 
	
	/* 获取全部信息 */
	public List<PageData> getAllInfo(){
		List<PageData> list = brandService.getAllInfo();
		return list;
	}

	//设置分页Page参数
	public Page setParameterOfPage(Page page,PageData pd) {
		//设置总条数
		page.setTotalResult(getCheckCountByQuery(pd));
		//设置pd查询条件
		page.setPd(pd);
		//设置每页显示记录数
		page.setShowCount(Integer.parseInt(pd.getString("showCount")));//Integer.parseInt(pd.getString("showCount"))
		//设置当前页
		page.setCurrentPage(page.getCurrentPage());
		//设置总页数
		page.setTotalPage(page.getTotalPage());
		//当前记录起始索引
		page.setCurrentResult(page.getCurrentResult());
		//设置分页标签
		page.setPageStr(page.getPageStr());
		
		return page;
	}
	
	//通过查询条件获取数据库内容总数 
	public Integer getCheckCountByQuery(PageData pd){ 
		Integer checkCount = brandService.getCheckCountByQuery(pd); 
		return checkCount; 
	}
	
	//获取全部品牌列表
	public List<PageData> selectBrandList(Page page){
		List<PageData> list = brandService.selectBrandList(page);
		return list;
	} 
	
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
