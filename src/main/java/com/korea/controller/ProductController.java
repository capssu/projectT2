package com.korea.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.korea.k2.product.ProductService;
import com.korea.k2.product.ProductVO;

@Controller
public class ProductController {
	String path = "";
	@Autowired
	private ProductService service;
	
	@Autowired // 서블릿 주입하기
	private ServletContext servletContext;
	
	@PostConstruct 
	public void init() {
		path= servletContext.getRealPath("/product/files/");
		System.out.println("path:" + path);
	}
	
	@RequestMapping("/Product_INSERT.do")
	String ProductInsert(ProductVO vo, Model model) throws Exception{
		MultipartFile uploadFile = vo.getProductImg();
		long time = System.currentTimeMillis();
		SimpleDateFormat daytime =new SimpleDateFormat("HHmmss");
		String timeStr=daytime.format(time);
		System.out.println("시간확인:" +timeStr);
		
		String fileName= uploadFile.getOriginalFilename();
	 	File f = new  File(path+fileName);
		
		if(! uploadFile.isEmpty()) {
			if (f.exists()) {
			  String onlyFileName =fileName.substring(0,fileName.lastIndexOf(".")); // good.fi 
			  String extension =fileName.substring(fileName.lastIndexOf(".")); // .gif
			  fileName=onlyFileName+"_"+timeStr+extension;	
			 }
			 uploadFile.transferTo(new  File(path+fileName));
		}else {
			// System.out.println("파일이 첨부되지 않았습니다.!! ");
			fileName="space.png";
		}	
		
		vo.setProductImgStr(fileName);
		service.insert(vo);
		return "/Product_SelectAll.do";
	}
	
	@RequestMapping("/Product_SelectAll.do")
	String ProductSelectAll(ProductVO vo, Model model) throws Exception{
		model.addAttribute("li", service.selectAll(vo));
		return "/product/product_SelectAll.jsp";
	}
	
	@RequestMapping("/Product_SelectOne.do")
	String ProductSelectOne(ProductVO vo, Model model) throws Exception{
		model.addAttribute("p", service.selectOne(vo));
		return "/product/product_SelectOne.jsp";
	}
	
	@RequestMapping("/Product_Delete.do")
	String ProductDelete(ProductVO vo, Model model) throws Exception{
		service.delete(vo);
		return "/Product_SelectAll.do";
	}

}
