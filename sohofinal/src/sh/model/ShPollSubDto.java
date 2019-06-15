package sh.model;

import java.io.Serializable;

/*
DROP TABLE SH_POLLSUB			      
CASCADE CONSTRAINTS;

DROP SEQUENCE SH_POLLSUB_SEQ;

CREATE TABLE SH_POLLSUB(			  --만족도투표(SH_POLLSUB)
	POLLSUBID NUMBER NOT NULL,
	POLLID NUMBER NOT NULL,
	ANSWER VARCHAR2(1000) NOT NULL,
	ACOUNT NUMBER NOT NULL,
	CONSTRAINT SH_POLLSUB_PK PRIMARY KEY(POLLSUBID)
);

CREATE SEQUENCE SH_POLLSUB_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE SH_POLLSUB ADD CONSTRAINT SH_POLLSUB_FK
FOREIGN KEY(POLLID)  
REFERENCES POLL(POLLID);
*/

//보기들
public class ShPollSubDto implements Serializable {

	private int pollsubid;	//보기등록  번호 1.사과 2.배 3.귤 4.설현 5.박보영
	private int pollid;		//질문번호         1     1    1    2     2
	private String answer;	//보기(사과 배 귤 설현 박보영)
	private int acount;		//이 보기에 선택한 사람수
	
	public ShPollSubDto() {}

	public int getPollsubid() {
		return pollsubid;
	}

	public void setPollsubid(int pollsubid) {
		this.pollsubid = pollsubid;
	}

	public int getPollid() {
		return pollid;
	}

	public void setPollid(int pollid) {
		this.pollid = pollid;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getAcount() {
		return acount;
	}

	public void setAcount(int acount) {
		this.acount = acount;
	}
	
}
