package sh.model;

import java.io.Serializable;

/*
DROP TABLE SH_BOOKING			// 펜션예약 (SH_BOOKING)
CASCADE CONSTRAINTS;

DROP SEQUENCE SH_BOOKING_SEQ;

CREATE TABLE SH_BOOKING(
    SEQ NUMBER(8) PRIMARY KEY,
    ID VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,		// 예약자 이름
    ROOMNAME VARCHAR2(10) NOT NULL,	// 방이름
    CONTENT VARCHAR2(300),			// 요구사항
    COUNTNUM NUMBER(8) NOT NULL,	// 인원수
    SDATE DATE NOT NULL,			// 시작일
    EDATE DATE NOT NULL,			// 종료일
    PNUM VARCHAR2(15) NOT NULL,		// 예약자 폰번호
    PRICE NUMBER(8) NOT NULL,
    CHECKNUM NUMBER(1) NOT NULL		// 예약확인여부
);

CREATE SEQUENCE SH_BOOKING_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE SH_BOOKING
ADD CONSTRAINT SH_BOOKING_FK FOREIGN KEY(ID)
REFERENCES SH_MEMBER(ID);
*/

public class ShBookingDto implements Serializable {

	private int seq;
	private String id;
	private String name;		// 예약자 이름
	private String roomname;	// 방 이름
	private String content;		// 요구사항
	private int countnum;		// 인원수
	private String sdate;		// 시작일
	private String edate;		// 종료일
	private String pnum;		// 예약자 폰번호
	private int price;
	private int checknum;		// 예약확인 여부
	
	public ShBookingDto() {
	}

	public ShBookingDto(int seq, String id, String name, String roomname, String content, int countnum, String sdate,
			String edate, String pnum, int price, int checknum) {
		super();
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.roomname = roomname;
		this.content = content;
		this.countnum = countnum;
		this.sdate = sdate;
		this.edate = edate;
		this.pnum = pnum;
		this.price = price;
		this.checknum = checknum;
	}

	public ShBookingDto(String id, String name, String roomname, String content, String sdate,
			String edate, String pnum, int price) {
		super();
		this.id = id;
		this.name = name;
		this.roomname = roomname;
		this.content = content;
		this.sdate = sdate;
		this.edate = edate;
		this.pnum = pnum;
		this.price = price;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCountnum() {
		return countnum;
	}

	public void setCountnum(int countnum) {
		this.countnum = countnum;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getChecknum() {
		return checknum;
	}

	public void setChecknum(int checknum) {
		this.checknum = checknum;
	}

	@Override
	public String toString() {
		return "ShBookingDto [seq=" + seq + ", id=" + id + ", name=" + name + ", roomname=" + roomname + ", content="
				+ content + ", countnum=" + countnum + ", sdate=" + sdate + ", edate=" + edate + ", pnum=" + pnum
				+ ", price=" + price + ", checknum=" + checknum + "]";
	}
	
}
