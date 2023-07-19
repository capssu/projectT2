package com.korea.k2.shop;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	 private int custNo;
	 private String custName;
	 private String phone;
	 
	 private String address;
	 private String zipcode;
	 private String address2;
	 
	 private Date joindate;
	 private String joindateStr;
	 
	 private String grade;
	 private String city;
	 
	 private String ch1;
	 private String ch2;
	 
	 private String id;
	 private String password;
}
