package com.ssm.sample.controller.sample;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.sample.controller.base.BaseController;
import com.ssm.sample.facade.sample.BrandFacade;
import com.ssm.sample.util.Base64;
import com.ssm.sample.util.PageData;

@Controller
@RequestMapping({ "/brand", "/brandPopup", "/brandAjax" })
public class BrandController extends BaseController {

	@Autowired
	private BrandFacade brandFacade;

	// 添加品牌
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
