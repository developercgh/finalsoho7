package sh.model;

import java.io.Serializable;

import java.sql.Date;		//DB에 있는 sql.date형을 여기서 변수로 받는다.

/*
DROP TABLE SH_POLL			      --��ǥ�����, ��ǥ ��(SH_POLL)
CASCADE CONSTRAINTS;

DROP SEQUENCE SH_POLL_SEQ;

CREATE TABLE SH_POLL(
    POLLID NUMBER NOT NULL,
    ID VARCHAR2(50) NOT NULL,
    QUESTION VARCHAR2(1000) NOT NULL,
    SDATE DATE NOT NULL,
    EDATE DATE NOT NULL,
    ITEMCOUNT NUMBER NOT NULL,
    POLLTOTAL NUMBER NOT NULL,
    WDATE DATE NOT NULL,			-- ��ǥ �ۼ���
    CONSTRAINT SH_POLL_PK PRIMARY KEY(POLLID)
);

CREATE SEQUENCE SH_POLL_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE SH_POLL 
ADD CONSTRAINT SH_POLL_FK FOREIGN KEY(ID)
REFERENCES SH_MEMBER(ID);
*/



public class ShPollDto implements Serializable {

	private int pollid;		//��ǥ��ȣ 1 2 3 4
	private String id;		//��ǥ ���� ����� ID
	private String question;	//����
	private Date sdate;			//������
	private Date edate;			//������
	private int itemcount;		//������ ���� �ּ� 2�� �̻�
	private int polltotal;		//������ ��ǥ�� �����
	private Date wdate;			//��ǥ �����
		
	private boolean vote;		//��ǥ�� �ߴ��� ���ߴ���?
	public ShPollDto() {}

	public ShPollDto(int pollid, String id, String question, Date sdate, Date edate, int itemcount, int polltotal,
			Date wdate, boolean vote) {
		super();
		this.pollid = pollid;
		this.id = id;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.itemcount = itemcount;
		this.polltotal = polltotal;
		this.wdate = wdate;
		this.vote = vote;
	}

	public ShPollDto(String id, String question, Date sdate, Date edate, int itemcount, int polltotal) {
		super();
		this.id = id;
		this.question = question;
		this.sdate = sdate;
		this.edate = edate;
		this.itemcount = itemcount;
		this.polltotal = polltotal;
	}

	public ShPollDto(String id, String question, int itemcount) {
		super();
		this.id = id;
		this.question = question;
		this.itemcount = itemcount;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}

	public int getPolltotal() {
		return polltotal;
	}

	public void setPolltotal(int polltotal) {
		this.polltotal = polltotal;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	
	
	
	

	public boolean isVote() {
		return vote;
	}

	public void setVote(boolean vote) {
		this.vote = vote;
	}

	@Override
	public String toString() {
		return "ShPollDto [pollid=" + pollid + ", id=" + id + ", question=" + question + ", sdate=" + sdate + ", edate="
				+ edate + ", itemcount=" + itemcount + ", polltotal=" + polltotal + ", wdate=" + wdate + ", vote="
				+ vote + "]";
	}

	
}
