package sh.model;

import java.io.Serializable;

/*
DROP TABLE SH_EBBS			//이벤트 게시판(SH_EBBS)
CASCADE CONSTRAINTS;

DROP SEQUENCE SH_EBBS_SEQ;

CREATE TABLE SH_EBBS(			
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(10) NOT NULL,
	
    	TITLE VARCHAR2(100) NOT NULL,
	CONTENT VARCHAR2(400) NOT NULL,
	FILENAME VARCHAR2(50) NOT NULL,
    	READCOUNT NUMBER(8) NOT NULL,
	DOWNCOUNT NUMBER(8) NOT NULL,
    	WDATE DATE NOT NULL,
    
	PARENT NUMBER(8) NOT NULL,
    	REF NUMBER(8) NOT NULL,
	STEP NUMBER(8) NOT NULL,
	DEPTH NUMBER(8) NOT NULL,
	REGDATE DATE NOT NULL,
	
	DEL NUMBER(1) NOT NULL
);

CREATE SEQUENCE SH_EBBS_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE SH_EBBS
ADD CONSTRAINT SH_EBBS_FK FOREIGN KEY(ID)
REFERENCES SH_MEMBER(ID);	 
*/
public class ShEbbsDto implements Serializable {
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String filename;
	private int readcount;
	private int downcount;
	private String Wdate;
	
	
	public ShEbbsDto() {
	}

	public ShEbbsDto(int seq, String id, String title, String content, String filename, int readcount, int downcount,
			String wdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.readcount = readcount;
		this.downcount = downcount;
		Wdate = wdate;
		
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getDowncount() {
		return downcount;
	}

	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}

	public String getWdate() {
		return Wdate;
	}

	public void setWdate(String wdate) {
		Wdate = wdate;
	}

	@Override
	public String toString() {
		return "ShEbbsDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", filename="
				+ filename + ", readcount=" + readcount + ", downcount=" + downcount + ", Wdate=" + Wdate + 
				  "]";
	}
	
}
