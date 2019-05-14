package kh.com.a.model;

import java.io.Serializable;
/*
DROP TABLE POLLSUB
CASCADE CONSTRAINTS;

DROP SEQUENCE POLLSUB_SEQ;

CREATE TABLE POLLSUB(
    POLLSUBID NUMBER NOT NULL,
    POLLID NUMBER NOT NULL,
    ANSWER VARCHAR2(1000) NOT NULL,
    ACOUNT NUMBER NOT NULL,
    CONSTRAINT POLLSUB_PK PRIMARY KEY(POLLSUBID)
);

CREATE SEQUENCE POLLSUB_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE POLLSUB
ADD CONSTRAINT POLLSUB_FK FOREIGN KEY(POLLID)
REFERENCES POLL(POLLID);
 
 */
// 보기들 
public class PollSubDto implements Serializable {
	
	private int pollsubid;	// 보기 등록번호 1사과 2배 3귤 4셜현 5박보영 	seq
	private int pollid;		// 질문번호	 1	  1	 1	2	2
	private String answer;	// 보기(사과 배 귤 설현 박보영)
	private int acount;		// 이 보기엔 선택한 사람수
	
	public PollSubDto() {
	}

	public PollSubDto(int pollsubid, int pollid, String answer, int acount) {
		super();
		this.pollsubid = pollsubid;
		this.pollid = pollid;
		this.answer = answer;
		this.acount = acount;
	}

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
