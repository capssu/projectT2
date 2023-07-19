package com.korea.k2.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopDao dao;

	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		return dao.selectAll(vo);
	}

	@Override
	public MemberVO selectEdit(MemberVO vo) {
		return dao.selectEdit(vo);
	}

	@Override
	public void insert(MemberVO vo) {
		dao.insert(vo);
		
	}

	@Override
	public int custNo() {
		return dao.custNo();
	}

	@Override
	public void update(MemberVO vo) {
		dao.update(vo);
		
	}

	@Override
	public List<MoneyVO> money(MoneyVO vo) {
		return dao.money(vo);
	}

	@Override
	public String idCk(MemberVO vo) {
		return dao.idCk(vo);
	}

}
