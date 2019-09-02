package com.ssm.sample.controller.sample;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.net.ftp.parser.MVSFTPEntryParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.entity.Page;
import com.ssm.sample.facade.sample.BrandFacade;
import com.ssm.sample.util.Base64;
import com.ssm.sample.util.ExportExcel;
import com.ssm.sample.util.PageData;

@Controller
@RequestMapping({ "/brand", "/brandPopup", "/brandAjax" })
public class BrandController extends BaseController {

	@Autowired
	private BrandFacade brandFacade;
	
	//导出excel
	@RequestMapping(value = "exportExcel")
	@ResponseBody
	public PageData exportExcel() {
		/*
		List<String> list = brandFacade.getAllColumn();
		System.out.println("list.size()=" + list.size());
		String rows = "序号,";
		for (int i = 0; i < list.size(); i++) {
			rows += list.get(i) + ",";
			System.out.println(list.get(i));
		}
		System.out.println(rows);
		String[] rowsName = rows.split(",");
		System.out.println("rows.length=" + rowsName.length);
		*/
		PageData pd = this.getPageData();
		String fileName = pd.getString("fileName");
		String filePath = pd.getString("filePath");
		
		String[] rowsName = new String[]{"序号","品牌中文名","品牌英文名","品牌等级","品牌类型","运营类型","一级业态","二级业态","三级业态","品牌官网","总部电话"};
		
		List<PageData> brandList = brandFacade.getAllInfo();

		List<Object[]> dataList= new ArrayList<Object[]>();
		for(int i=0;i<brandList.size();i++) {
			Object[] obj = new Object[11];
			
			/*
			System.out.println(brandList.get(i).getString("headquarters_telephone"));
			System.out.println(brandList.get(i).getString("official_website"));
			System.out.println(brandList.get(i).getString("thirdClass_format"));
			System.out.println(brandList.get(i).getString("secondClass_format"));
			System.out.println(brandList.get(i).getString("firstClass_format"));
			System.out.println(brandList.get(i).getString("running_type"));
			System.out.println(brandList.get(i).getString("brand_type"));
			System.out.println(brandList.get(i).getString("brand_grade"));
			System.out.println(brandList.get(i).getString("en_name"));
			System.out.println(brandList.get(i).getString("ch_name"));
			System.out.println(i+1);
			*/
			
			obj[10] = brandList.get(i).getString("headquarters_telephone");
			obj[9] = brandList.get(i).getString("official_website");
			obj[8] = brandList.get(i).getString("thirdClass_format");
			obj[7] = brandList.get(i).getString("secondClass_format");
			obj[6] = brandList.get(i).getString("firstClass_format");
			obj[5] = brandList.get(i).getString("running_type");
			obj[4] = brandList.get(i).getString("brand_type");
			obj[3] = brandList.get(i).getString("brand_grade");
			obj[2] = brandList.get(i).getString("en_name");
			obj[1] = brandList.get(i).getString("ch_name");
			obj[0] = i+1;
			
			dataList.add(obj);
		}
		
		// 定义Excel文件名 
		//String fileName="文档"; 
		// 定义存放路 径 
		//String filePath = "G:/";
		
		HttpServletResponse response = null; //创建CommonExcel对象，调用downloadExcel()对象导出Excel 
		ExportExcel ex = new
		ExportExcel(rowsName, dataList,response,fileName,filePath); 
		try {
			ex.downloadExcel(); 
			pd.put("status", 200);
		} catch (Exception e) 
		{ 
			pd.put("status", 500);
			e.printStackTrace(); 
		}
		
		return pd;
	}
	
	// 跳转到品牌添加页面
	@RequestMapping(value = "brandAdd")
	public ModelAndView brandAdd() {
		ModelAndView mv = new ModelAndView();
		this.setReqAndRes(request, response);
		PageData pdData = (PageData) session.getAttribute("username");
		mv.addObject("pdData", pdData);
		mv.setViewName("sample/brandAdd");
		return mv;
	}
	
	// 跳转到我的品牌初始页面
	@RequestMapping(value = "myBrand")
	public ModelAndView myBrand() {
		ModelAndView mv = new ModelAndView();
		this.setReqAndRes(request, response);
		PageData pdData = (PageData) session.getAttribute("username");
		mv.addObject("pdData", pdData);
		mv.setViewName("sample/mybrand");
		return mv;
	}
	
	//通过条件获取到全部的品牌列表
	@RequestMapping(value = "getBrandListByQuery")
	public ModelAndView getBrandListByQuery(Page page) {
		ModelAndView mv = new ModelAndView();
		PageData pd = this.getPageData();
		System.out.println(page);
		System.out.println(pd);
		try {
			page = brandFacade.setParameterOfPage(page, pd);	
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
		}
		List<PageData> brandList = brandFacade.selectBrandList(page);
		System.out.println(brandList);
			
		mv.addObject("brandList", brandList);
		mv.addObject("pd", pd);
		mv.addObject("page", page);
		mv.setViewName("sample/mybrand");
		return mv;
	}
	
	// 向数据库中添加品牌
	@RequestMapping(value = "brandadd")
	@ResponseBody
	public PageData brandadd() {
		PageData pd = this.getPageData();
		System.out.println(pd);
		
		brandFacade.insertOneBrand(pd);
		/* System.out.println("添加品牌"); */
			
		pd.put("status", "200");
		return pd;
	}
	
	// 获取一级业态
	@RequestMapping(value = "getFirstClass")
	@ResponseBody
	public List<PageData> getFirstClass() {
		List<PageData> list = brandFacade.getFirstClass();
		return list;
	}

	// 获取二级业态
	@RequestMapping(value = "getSecondClass")
	@ResponseBody
	public List<PageData> getSecondClass() {
		PageData pd = this.getPageData();
		Integer id = Integer.parseInt(pd.getString("id"));
		List<PageData> list = brandFacade.getSecondClass(id);
		return list;
	}

	// 获取三级业态
	@RequestMapping(value = "getThirdClass")
	@ResponseBody
	public List<PageData> getThirdClass() {
		PageData pd = this.getPageData();
		Integer id = Integer.parseInt(pd.getString("id"));
		List<PageData> list = brandFacade.getThirdClass(id);
		return list;
	}

	// 上传图片
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	@ResponseBody
	public PageData upload(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, ModelMap model) {
		PageData pd = this.getPageData();

		if (!file.isEmpty()) {
			// 上传文件存放真实路径
			String path = request.getServletContext().getRealPath("/images/"); 
			System.out.println(path);

			// 上传文件的名字
			String originalFilename = file.getOriginalFilename();
			String[] array = originalFilename.split(",");
			String last = array[array.length-1];
			System.out.println(originalFilename);

			//得到文件的内容
			 try {
				InputStream in = file.getInputStream();
				byte[] bytes = file.getBytes();
				String base64 = Base64.encode(bytes);
				/* System.out.println("base64:"+base64); */
				pd.put("base64", "data:image/" + last + ";base64,"+base64);
				
				/*
				 * System.out.println(in); System.out.println(bytes);
				 */
			} catch (IOException e1) {
				/* e1.printStackTrace(); */
			}   
			
			// 在真实路径创建文件
			File filepath = new File(path, originalFilename);

			// 判断文件路径是否存在，如果不存在就创建一个
			if (!filepath.getParentFile().exists()) {
				filepath.getParentFile().mkdirs();
			}

			// 将上传文件保存到一个目标文件当中
			try {
				file.transferTo(new File(path + File.separator + originalFilename)); 
				// 获取文件上传最终的访问路径
				String lastPath = "http://localhost:8080/SSMSample/images/" + originalFilename;
				pd.put("path", lastPath);
				pd.put("status", "200");
			} catch (IllegalStateException e) {
				pd.put("status", "500");
				e.printStackTrace();
			} catch (IOException e) {
				pd.put("status", "500");
				e.printStackTrace();
			}
			// 输出文件上传最终的路径 测试查看
			System.out.println(path + File.separator + originalFilename);

		}else {
			pd.put("status", "404");
		}
		
		return pd;
	}

}
