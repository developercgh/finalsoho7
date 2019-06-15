package sh.model;

import java.io.Serializable;

/*
//질의응답 게시판(SH_QBBS) 환철

DROP TABLE SH_QBBS			
CASCADE CONSTRAINTS;

DROP SEQUENCE SH_QBBS_SEQ;


CREATE TABLE SH_QBBS(			
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(10) NOT NULL,
	
	TITLE VARCHAR2(100) NOT NULL,
	CONTENT VARCHAR2(400) NOT NULL,
	READCOUNT NUMBER(8) NOT NULL,
	WDATE DATE NOT NULL,
    
	PARENT NUMBER(8) NOT NULL,
	REF NUMBER(8) NOT NULL,
	STEP NUMBER(8) NOT NULL,
	DEPTH NUMBER(8) NOT NULL,
	REGDATE DATE NOT NULL,
	
	DEL NUMBER(1) NOT NULL
);

CREATE SEQUENCE SH_QBBS_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE SH_QBBS
ADD CONSTRAINT SH_QBBS_FK FOREIGN KEY(ID)
REFERENCES SH_MEMBER(ID);	

*/

public class ShQbbsDto implements Serializable {

	private int seq;	//시퀸스번호
	private String id;	//아이디
	
	private int ref;	// 그룹번호
	private int step;	// 행번호
	private int depth;	// 깊이
	
	private String title;	// 제목
	private String content;	// 내용
	private String wdate;	// 게시글 작성일
	private int readcount;	// 조회수
	
	private int parent;		// 부모글
	private String regdate;	// 댓글 작성일
	private int del;		// 삭제
	
	
	public ShQbbsDto() {
	}


	public ShQbbsDto(int seq, String id, int ref, int step, int depth, String title, String content, String wdate,
			int readcount, int parent, String regdate, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.readcount = readcount;
		this.parent = parent;
		this.regdate = regdate;
		this.del = del;
	}


	public ShQbbsDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
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


	public int getRef() {
		return ref;
	}


	public void setRef(int ref) {
		this.ref = ref;
	}


	public int getStep() {
		return step;
	}


	public void setStep(int step) {
		this.step = step;
	}


	public int getDepth() {
		return depth;
	}


	public void setDepth(int depth) {
		this.depth = depth;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getWdate() {
		return wdate;
	}


	public void setWdate(String wdate) {
		this.wdate = wdate;
	}


	public int getReadcount() {
		return readcount;
	}


	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}


	public int getParent() {
		return parent;
	}


	public void setParent(int parent) {
		this.parent = parent;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getDel() {
		return del;
	}


	public void setDel(int del) {
		this.del = del;
	}


	@Override
	public String toString() {
		return "ShQbbsDto [seq=" + seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth
				+ ", title=" + title + ", content=" + content + ", wdate=" + wdate + ", readcount=" + readcount
				+ ", parent=" + parent + ", regdate=" + regdate + ", del=" + del + "]";
	}
	
	
	
	
	
}
