package com.ssm.sample.service.sample;

import org.springframework.stereotype.Service;
import com.ssm.sample.service.base.BaseService;
import com.ssm.sample.util.PageData;

@Service("homeService")
public class HomeService extends BaseService{
	//获取每种的个数
	public Integer getCheckCount(PageData pd){
		Integer one = this.sqlSessionTemplate.selectOne("sample.homeMapper.getCheckCount",pd);
		return one;
	}
	
	//获取总品牌数
	public Integer getSumBrand(PageData pd) {
		return this.sqlSessionTemplate.selectOne("sample.homeMapper.getClassCheckCount", pd);
	}
	
	/* 获取一级业态总数 */
	public Integer getFirstInteger() {
		return this.sqlSessionTemplate.selectOne("sample.homeMapper.getFirstCheckCount");
	}
	
	/* 获取二级业态总数 */
	public Integer getSecondInteger() {
		return this.sqlSessionTemplate.selectOne("sample.homeMapper.getSecondCheckCount");
	}
	
	/* 获取三级业态总数 */
	public Integer getThirdInteger() {
		return this.sqlSessionTemplate.selectOne("sample.homeMapper.getThirdCheckCount");
	}
	
	/* 取得首页大标题的总数 */
	public Integer getClassCheckCount(PageData pd){
		Integer one = this.sqlSessionTemplate.selectOne("sample.homeMapper.getClassCheckCount",pd);
		return one;
	}
}
