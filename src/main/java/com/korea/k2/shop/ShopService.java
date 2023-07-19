package com.korea.k2.shop;

import java.util.List;

public interface ShopService {
	List<MemberVO> selectAll(MemberVO vo);
	MemberVO selectEdit(MemberVO vo);
	void insert(MemberVO vo);
	int custNo();
	void update(MemberVO vo);
	List<MoneyVO> money(MoneyVO vo);
	String idCk(MemberVO vo);
}
