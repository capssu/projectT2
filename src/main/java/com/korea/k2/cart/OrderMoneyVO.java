package com.korea.k2.cart;

import java.util.Date;

import lombok.Data;

@Data
public class OrderMoneyVO {
    private int idx;
    private int OcustNo;
    private int baesongbi;
    private int totalmoney;
    private Date getDate;
}
