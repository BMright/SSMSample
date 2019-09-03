package com.ssm.sample.facade.sample;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.sample.facade.base.BaseFacade;
import com.ssm.sample.service.sample.BrandService;
import com.ssm.sample.util.PageData;

@Service("NumToStrFacade")
public class NumToStrFacade extends BaseFacade{
	@Autowired
	private BrandService brandService;
	
	/**
	 * 扩展联系人转换
	 * @param num
	 * @return
	 */
	public String contactsToStr(Integer num) {
		List<PageData> list = brandService.getContactAllInfo();
		for (int i = 0; i < list.size(); i++) {
			if (Integer.parseInt(list.get(i).getString("expandingContact_id")) == num) {
				return list.get(i).getString("contact_name");
			}
		}
		return "-1";
	}
	
	/**
	 * 审核状态转换
	 * @param num
	 * @return
	 */
	public String checkStatusToStr(Integer num) {
		if (num == 1) {
			return "审核通过";
		}else if (num == 0) {
			return "审核未通过";
		}else if (num == -1) {
			return "未审核";
		}
		return "-1";
	}
	
	/**
	 * 市场周期转换
	 * @param num
	 * @return
	 */
	public String marketLifeToStr(Integer num) {
		if (num == 1) {
			return "开发期";
		}else if (num == 2) {
			return "发展期";
		}else if (num == 3) {
			return "成熟期";
		}else if (num == 4) {
			return "衰退期";
		}
		return "-1";
	}
	
	/**
	 * 消费者类型转换
	 * @param num
	 * @return
	 */
	public String consumeTypeToStr(Integer num) {
		if (num == 1) {
			return "儿童";
		}else if (num == 2) {
			return "男";
		}else if (num == 3) {
			return "女";
		}
		return "-1";
	}
	
	/**
	 * 审核内容类型转换
	 * @param num
	 * @return
	 */
	public String checkContentTypeToStr(Integer num) {
		if (num == 1) {
			return "基本信息编辑";
		}else if (num == 2) {
			return "添加品牌代理公司";
		}else if (num == 3) {
			return "品牌添加";
		}
		return "-1";
	}
	
	/**
	 * 运营类型转换
	 * @param num
	 * @return
	 */
	public String runningTypeToStr(Integer num) {
		if (num == 1) {
			return "直营";
		}else if (num == 2) {
			return "代理";
		}else if (num == 3) {
			return "加盟";
		}
		return "-1";
	}
	
	/**
	 * 性别转换
	 * @param num
	 * @return
	 */
	public String sexToStr(Integer num) {
		if (num == 0) {
			return "男";
		}else if (num == 1) {
			return "女";
		}
		return "-1";
	}
	
	/**
	 * 品牌类型转换
	 * @param num
	 * @return
	 */
	public String brandTypeToStr(Integer num) {
		if (num == 1) {
			return "连锁";
		}else if (num == 2) {
			return "本地";
		}
		return "-1";
	}
	
	/**
	 * 品牌等级转换
	 * @param num
	 * @return
	 */
	public String brandGradeToStr(Integer num) {
		if (num == 1) {
			return "一线";
		}else if (num == 2) {
			return "二线";
		}
		else if (num == 3) {
			return "三线";
		}
		return "-1";
	}
	
	/**
	 * 转换一级业态
	 * @param id
	 * @return
	 */
	public String firstClassToStr(Integer id) {
		List<PageData> firstClass = brandService.getFirstClass();	
		for (int i = 0; i < firstClass.size(); i++) {
			if (Integer.parseInt(firstClass.get(i).getString("firstClass_id")) == id) {
				return firstClass.get(i).getString("firstClass_name");
			}
		}
		return "-1";
	}
	
	/**
	 * 转换二级业态
	 * @param id
	 * @return
	 */
	public String secondClassToStr(Integer id,Integer fid) {
		List<PageData> secondClass = brandService.getSecondClass(fid);	
		for (int i = 0; i < secondClass.size(); i++) {
			if (Integer.parseInt(secondClass.get(i).getString("secondClass_id")) == id) {
				return secondClass.get(i).getString("secondClass_name");
			}
		}
		return "-1";
	}
	
	/**
	 * 转换三级业态
	 * @param id
	 * @return
	 */
	public String thirdClassToStr(Integer id,Integer sid) {
		List<PageData> thirdClass = brandService.getThirdClass(sid);	
		for (int i = 0; i < thirdClass.size(); i++) {
			if (Integer.parseInt(thirdClass.get(i).getString("thirdClass_id")) == id) {
				return thirdClass.get(i).getString("thirdClass_name");
			}
		}
		return "-1";
	}
}
