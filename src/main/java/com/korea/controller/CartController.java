package com.korea.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.korea.k2.cart.CartService;
import com.korea.k2.cart.CartVO;
import com.korea.k2.cart.OrderJumunseoVO;
import com.korea.k2.cart.OrderMoneyVO;
import com.korea.k2.cart.OrderOneVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	@RequestMapping("/CartUpdate.do")
	String CartUpdate(@RequestParam String[] cartId,
			@RequestParam String[] custNo,
			@RequestParam String[] productId,
			@RequestParam String[] amount) throws Exception{
		String custNoStr="";
		
		for(int i=0; i<cartId.length; i++) {
			CartVO vo =new CartVO();
			custNoStr = custNo[i];
			vo.setCartId(Integer.parseInt(cartId[i]));
			vo.setAmount(Integer.parseInt(amount[i]));
			service.update(vo);
		}
		return "redirect:/CartList.do?custNo="+custNoStr;
	}
	
	@RequestMapping("/CartOrder.do")

	String  CartOrder(@RequestParam String[] cartId,
					@RequestParam String[] custNo,
					@RequestParam String[] productId,
					@RequestParam String[] productName,
					@RequestParam String[] amount,
					OrderMoneyVO mvo) throws Exception { 
		
				mvo.setOcustNo(Integer.parseInt(custNo[0]));
				service.insertOrderMoney(mvo);
				int orderG=service.orderG(mvo);
				
		    	int custNoStr = 0;
		    	OrderJumunseoVO Ovo = null;
		    	for (int i=0 ; i < cartId.length ; i++) {    		
		    	   Ovo = new OrderJumunseoVO();
		    	   custNoStr  = Integer.parseInt(custNo[i]);
		    	   Ovo.setCustNo(Integer.parseInt(custNo[i]));
		    	   Ovo.setCartId(Integer.parseInt(cartId[i]));
		    	   Ovo.setProductId(Integer.parseInt(productId[i]));
		    	   Ovo.setProductName(productName[i]);
		    	   Ovo.setAmount(Integer.parseInt(amount[i]));
		    	   Ovo.setOrderG(orderG);
		    	   service.insertOrderJumunseo(Ovo);
		    	}
		    	//장바구니 삭제하기
		    	CartVO cartVO=new CartVO();
		    	cartVO.setCustNo(custNoStr);
		    	service.deleteAll(cartVO);
		    	
		    	String custNoK = String.valueOf(custNoStr);
				return "redirect:/CartList.do?custNo="+custNoK;	
	}
	
	@RequestMapping("/OrderList.do")
	String OrderList(Model model) throws Exception{
		model.addAttribute("li", service.orderList());
		return "/cart/OrderList.jsp";
	}
	@RequestMapping("/OrderOne.do")
	String OrderOne(OrderOneVO vo, Model model) throws Exception{
		model.addAttribute("li", service.orderOne(vo));
		return "/cart/OrderOne.jsp";
	}
	
	
	@RequestMapping("/CartInsert.do")
	String CartInsert(CartVO vo) throws Exception{
		service.insert(vo);
		return "/CartList.do";
	}
	@RequestMapping("/CartList.do")
	String CartList(CartVO vo, Model model) throws Exception{
		model.addAttribute("li", service.cartList(vo));
		return "/cart/CartList.jsp";
	}
	@RequestMapping("/CartDeleteOne.do")
	String CartDeleteOne(CartVO vo, Model model) throws Exception{
		service.deleteOne(vo);
		return "/CartList.do";
	}
	
	@RequestMapping("/CartDeleteAll.do")
	String CartDeleteAll(CartVO vo, Model model) throws Exception{
		service.deleteAll(vo);
		return "/CartList.do";
	}
}
