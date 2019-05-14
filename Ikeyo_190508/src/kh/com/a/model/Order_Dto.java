package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
 -----------------------------------------
-- 주문관리 테이블
DROP TABLE ORDER_
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ORDER;

CREATE TABLE ORDER_(
ORD_SEQ NUMBER(8) PRIMARY KEY,
MODEL_ID VARCHAR2(50) NOT NULL,
ID VARCHAR2(50) NOT NULL,
TOTAL_PRICE NUMBER(20) NOT NULL,
ORDER_NUM NUMBER(20) NOT NULL,
DELI_INFO NUMBER(1) NOT NULL,
REGDATE DATE NOT NULL,
RNAME VARCHAR2(50) NOT NULL,
ADDRESS1 VARCHAR2(50) NOT NULL,
ADDRESS2 VARCHAR2(50),
PHONE VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(2000)
);

CREATE SEQUENCE SEQ_ORDER
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE ORDER_NUM_SEQ
START WITH 1000
INCREMENT BY 1;

ALTER TABLE ORDER_
ADD CONSTRAINT FK_ORD_MD FOREIGN KEY(MODEL_ID)
REFERENCES INVENTORY(MODEL_ID);

ALTER TABLE ORDER_
ADD CONSTRAINT FK_ORD_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
 */
public class Order_Dto implements Serializable {

	private int ord_seq;		// 주문관리 시퀀스
	private String model_id;	// 상품 id
	private String id;			// 멤버 id
	private int total_price;	// 총 가격
	private int order_num;		// 주문번호
	private int dell_info;		// 배송상태
	private Date regdate;		// 주문완료날짜
	private String rname;		// 배송자이름
	private String address1;	// 배송지 주소1
	private String address2;	// 배송지 주소2
	private String phone;		// 배송자 폰번호
	private String content;		// 주문요청사항
	
	public Order_Dto() {
		// TODO Auto-generated constructor stub
	}

	public Order_Dto(int ord_seq, String model_id, String id, int total_price, int order_num, int dell_info,
			Date regdate, String rname, String address1, String address2, String phone, String content) {
		super();
		this.ord_seq = ord_seq;
		this.model_id = model_id;
		this.id = id;
		this.total_price = total_price;
		this.order_num = order_num;
		this.dell_info = dell_info;
		this.regdate = regdate;
		this.rname = rname;
		this.address1 = address1;
		this.address2 = address2;
		this.phone = phone;
		this.content = content;
	}

	public int getOrd_seq() {
		return ord_seq;
	}

	public void setOrd_seq(int ord_seq) {
		this.ord_seq = ord_seq;
	}

	public String getModel_id() {
		return model_id;
	}

	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getDell_info() {
		return dell_info;
	}

	public void setDell_info(int dell_info) {
		this.dell_info = dell_info;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Order_Dto [ord_seq=" + ord_seq + ", model_id=" + model_id + ", id=" + id + ", total_price="
				+ total_price + ", order_num=" + order_num + ", dell_info=" + dell_info + ", regdate=" + regdate
				+ ", rname=" + rname + ", address1=" + address1 + ", address2=" + address2 + ", phone=" + phone
				+ ", content=" + content + "]";
	}
	
	
	
}
