package sh.model;

import java.io.Serializable;
import java.util.Date;
/*
DROP TABLE SH_VOTER			  --만족도투표(SH_VOTER)
CASCADE CONSTRAINTS;

DROP SEQUENCE SH_VOTER_SEQ;

CREATE TABLE SH_VOTER(
    VOTERID NUMBER NOT NULL,
    POLLID NUMBER NOT NULL,
    POLLSUBID NUMBER NOT NULL,
    ID VARCHAR2(50) NOT NULL,
    WDATE DATE NOT NULL,
    CONSTRAINT SH_VOTER_PK PRIMARY KEY(VOTERID)
);

CREATE SEQUENCE SH_VOTER_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE SH_VOTER ADD CONSTRAINT VOTER_FK
FOREIGN KEY(POLLID)
REFERENCES SH_POLL(POLLID);

ALTER TABLE SH_VOTER 
ADD CONSTRAINT SH_VOTER_FK2 FOREIGN KEY(POLLSUBID)
REFERENCES SH_POLLSUB(POLLSUBID);

ALTER TABLE SH_VOTER 
ADD CONSTRAINT SH_VOTER_FK3 FOREIGN KEY(ID)
REFERENCES SH_MEMBER(ID);
*/



public class ShVoter implements Serializable {

	private int voterid;	//투표자 카운터
	private int pollid;		//질문
	private int pollsubid;	//선택한 보기
	private String id;		//누구?
	private Date wdate;		//언제
	
	public ShVoter() {}

	public ShVoter(int voterid, int pollid, int pollsubid, String id, Date wdate) {
		super();
		this.voterid = voterid;
		this.pollid = pollid;
		this.pollsubid = pollsubid;
		this.id = id;
		this.wdate = wdate;
	}

	//
	public ShVoter(int pollid, int pollsubid, String id) {
		super();
		this.pollid = pollid;
		this.pollsubid = pollsubid;
		this.id = id;
	}

	public int getVoterid() {
		return voterid;
	}

	public void setVoterid(int voterid) {
		this.voterid = voterid;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public int getPollsubid() {
		return pollsubid;
	}

	public void setPollsubid(int pollsubid) {
		this.pollsubid = pollsubid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	
	
	
	
}
