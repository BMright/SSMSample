package com.ssm.sample.facade.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.sample.facade.base.BaseFacade;
import com.ssm.sample.service.sample.SampleService;
import com.ssm.sample.util.PageData;

@Service("sampleFacade")
public class SampleFacade extends BaseFacade {

	@Autowired
	private SampleService sampleService;

	/**
	 * 加法计算
	 * 
	 * @param a
	 * @param b
	 * @return
	 */
	public int add(String a, String b) throws Exception {
		int iA = Integer.parseInt(a);
		int iB = Integer.parseInt(b);
		int sum = iA + iB;
		return sum;
	}

	/**
	 * 访问数据库
	 * 
	 * @param pd
	 * @return
	 */
	public List<PageData> testListPage(PageData pd) {
		List<PageData> list = sampleService.selectEmpList(pd);
		return list;
	}
}
