package com.ssm.sample.facade.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.sample.facade.base.BaseFacade;
import com.ssm.sample.service.sample.HomeService;
import com.ssm.sample.util.PageData;

@Service("homeFacade")
public class HomeFacade extends BaseFacade {

	@Autowired
	private HomeService homeService;

	// 获取每种二级业态的个数
	public PageData getCheckCount(PageData pd) {

		for (int j = 1; j <= 24; j++) {
			for (int j2 = 1; j2 <= 3; j2++) {
				pd.put("secondClass_format", j);
				pd.put("brand_grade", j2);
				Integer one = this.homeService.getCheckCount(pd);
				pd.put("data" + j + j2, one);
				System.out.println(pd);
			}
		}
		return pd;
	}

	// 获取每种一级业态的个数
	public PageData getFirstCheckCount(PageData pd1) {
		for (int i = 1; i <= 5; i++) {
			for (int j = 0; j <= 3; j++) {
				pd1.put("firstClass_format", i);
				if (j == 0) {
					pd1.put("brand_grade", "");
				} else {
					pd1.put("brand_grade", j);
				}
				Integer one = this.homeService.getCheckCount(pd1);
				pd1.put("data" + i + j, one);
				System.out.println(pd1);
			}
		}
		return pd1;
	}

	// 获取每种业态的个数
	public PageData getClassCheckCount(PageData pd) {
		Integer fInteger = homeService.getFirstInteger();
		pd.put("fcf", fInteger);
		
		Integer sInteger = homeService.getSecondInteger();
		pd.put("scf", sInteger);
		
		Integer tInteger = homeService.getThirdInteger();
		pd.put("tcf", tInteger);
		
		for (int i = 0; i < 4; i++) {
			if (i == 0) {
				pd.put("brand_grade", "");
			}else {
				pd.put("brand_grade", i);
			}
			Integer integer = homeService.getClassCheckCount(pd);
			pd.put("data" + i, integer);
		}
		
		return pd;
	}

}
