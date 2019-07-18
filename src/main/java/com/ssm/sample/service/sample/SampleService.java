package com.ssm.sample.service.sample;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssm.sample.service.base.BaseService;
import com.ssm.sample.util.PageData;

@Service("sampleService")
public class SampleService extends BaseService {

	public List<PageData> selectEmpList(PageData pd) {
		List<PageData> list = this.sqlSessionTemplate.<PageData> selectList("sample.sampleMapper.getList", pd);
		return list;
	}
}
