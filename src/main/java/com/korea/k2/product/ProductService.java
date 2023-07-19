package com.korea.k2.product;

import java.util.List;

public interface ProductService {
	void insert(ProductVO vo);
	void delete(ProductVO vo);
	List<ProductVO> selectAll(ProductVO vo);
	ProductVO selectOne(ProductVO vo);
}
