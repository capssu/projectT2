package com.korea.k2.openApi;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyDaoImpl implements CompanyDao{
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insert(CompanyVO vo) {
		mybatis.update("OPENAPI.INSERT", vo);
		
	}

	@Override
	public void insertEv(EvSearchVO vo) {
		mybatis.update("OPENAPI.EvINSERT", vo);
		
	}

	@Override
	public List<CompanyVO> list(CompanyVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("OPENAPI.SELECT", vo);
	}

	@Override
	public List<EvSearchVO> listEv(EvSearchVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("OPENAPI.EvSELECT", vo);
	}

	@Override
	public CompanyVO edit(CompanyVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OPENAPI.EDIT", vo);
	}

	@Override
	public EvSearchVO listEvOne(EvSearchVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("OPENAPI.EvSELECTONE", vo);
	}
}
