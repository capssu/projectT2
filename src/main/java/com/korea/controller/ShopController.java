package com.korea.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.korea.k2.shop.MemberVO;
import com.korea.k2.shop.MoneyVO;
import com.korea.k2.shop.ShopService;

@Controller
public class ShopController {
	
	ShopController(){
		System.out.println("==> ShopController 생성자 생성");
	}
	
	@Autowired
	private ShopService service;

	
	@RequestMapping("/Shop_Form.do")
	String shopForm(Model model) throws Exception{
		model.addAttribute("custNo", service.custNo());
		return "/shop/shop_form.jsp";
	}
	
	@RequestMapping("/Shop_FormOK.do")
	String shopFormOK(MemberVO vo) throws Exception{
		
		String password=BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
		vo.setPassword(password);
		
		service.insert(vo);
		return "/Shop_selectAll.do";
	}
	
	@RequestMapping("/Shop_UpdateOK.do")
	String update(MemberVO vo) throws Exception{
		service.update(vo);
		return "/Shop_selectAll.do";
	}
	
	@RequestMapping("/Shop_selectAll.do")
	String selectAll(MemberVO vo, Model model) throws Exception{
		 model.addAttribute("li", service.selectAll(vo));
		return "/shop/shop_selectAll.jsp";
	}
	@RequestMapping("/Shop_edit.do")
	String selectOne(MemberVO vo, HttpSession session) throws Exception{
		session.setAttribute("m", service.selectEdit(vo));
		return "/shop/shop_edit.jsp";
	}
	
	@RequestMapping("/Shop_money.do")
	String sales(MoneyVO vo, Model model) throws Exception{
		 model.addAttribute("li", service.money(vo));
		return "/shop/shop_money.jsp";
	}
	
	@RequestMapping("/IdCk.do")
	void IdCk(MemberVO vo, HttpServletResponse response) throws Exception{
		PrintWriter out=response.getWriter();
		String str=service.idCk(vo);
		System.out.println("===>str:"+str);
		if(str==null) {
			if(vo.getId()!="") {
				out.print("T");	
			}
		}else {
			out.print("F");
		}
	}
	
}

