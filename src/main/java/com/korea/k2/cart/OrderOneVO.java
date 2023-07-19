package com.korea.k2.cart;

import java.util.Date;

import lombok.Data;

@Data
public class OrderOneVO {
	
	private int baesongbi; 
	private int totalmoney; 
	private Date getDate;
	private String custName;
	private String phone;
	private String address;
	private int orderG; 
	private int idx;
	private String productName; 
	private int productId;
	private int amount;
}
