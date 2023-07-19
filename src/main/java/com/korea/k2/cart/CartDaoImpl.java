package com.korea.k2.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao{
	
	@Autowired
	private SqlSessionTemplate mybatis; 
	
	@Override
	public void insert(CartVO vo) {
		mybatis.insert("CART.INSERT", vo);
	}

	@Override
	public List<CartVO> cartList(CartVO vo) {
		return mybatis.selectList("CART.SELECTALL", vo);
	}

	@Override
	public void deleteOne(CartVO vo) {
		mybatis.delete("CART.DELETEONE", vo);
	}

	@Override
	public void deleteAll(CartVO vo) {
		mybatis.delete("CART.DELETEALL", vo);
	}

	@Override
	public void update(CartVO vo) {
		mybatis.update("CART.UPDATE", vo);
	}

	@Override
	public void insertOrderJumunseo(OrderJumunseoVO vo) {
		mybatis.insert("CART.ORDERJUMUNSEO", vo);
		
	}

	@Override
	public void insertOrderMoney(OrderMoneyVO vo) {
		mybatis.insert("CART.ORDERMONEY", vo);
	}

	@Override
	public int orderG(OrderMoneyVO vo) {
		return mybatis.selectOne("CART.ORDERG", vo);
	}

	@Override
	public List<OrderMoneyVO> orderList() {
		return mybatis.selectList("CART.ORDERLIST");
	}

	@Override
	public List<OrderOneVO> orderOne(OrderOneVO vo) {

		return mybatis.selectList("CART.ORDERONE", vo);
	}

}
