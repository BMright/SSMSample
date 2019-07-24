package com.ssm.sample.facade.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.sample.facade.base.BaseFacade;
import com.ssm.sample.service.sample.CheckService;
import com.ssm.sample.util.PageData;

@Service("checkFacade")
public class CheckFacade extends BaseFacade{

	@Autowired
	private  CheckService checkService;

	//获取数据库内容
		public List <PageData> selectCheckByPage(){
			List<PageData> list = checkService.selectCheckByPage();
			return list;
		}
	//获取数据库内容总数
		public List <PageData> getCheckCount(){
			List<PageData> list =checkService.getCheckCount();
			return list;
		}
	//获取一级业态
	public List<PageData> getFirstClass(){
		List<PageData> list = checkService.getFirstClass();
		return list;
	}
	
	//获取二级业态
	public List<PageData> getSecondClass(Integer id){
		List<PageData> list = checkService.getSecondClass(id);
		return list;
	}
	
	//获取三级业态
	public List<PageData> getThirdClass(Integer id){
		List<PageData> list = checkService.getThirdClass(id);
		return list;
	}
	
}
