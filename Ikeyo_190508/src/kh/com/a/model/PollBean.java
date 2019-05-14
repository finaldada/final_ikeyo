package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

import kh.com.a.util.DateUtil;

// 투표 작성자가 만든 항목
public class PollBean implements Serializable{
	private String id;			// 아이디
	
	private int syear;			// 시작년
	private int smonth;			// 시작월
	private int sday;			// 시작일
	
	private int eyear;			// 종료년
	private int emonth;			// 종료월
	private int eday;			// 종료일
	
	private String question;	// 투표질문
	private int itemcount;		// 투표문항수
	
	private String poll1;		// 투표문항1
	private String poll2;		// 투표문항2
	private String poll3;		// 투표문항3
	private String poll4;		// 투표문항4
	private String poll5;		// 투표문항5
	private String poll6;		// 투표문항6
	private String poll7;		// 투표문항7
	private String poll8;		// 투표문항8
	private String poll9;		// 투표문항9
	private String poll10;		// 투표문항10
	
	/*=====================================================*/
	
	private String pollnum[] = new String[10];	// 투표문항을 넣을 배열	
	
	private Date sdate;
	private Date edate;
	
	public String[] getPollnum() {	// 투표문항 보기들을 한묶음으로 전송하기 위한 메소드
		pollnum[0] = DateUtil.str(poll1);
		pollnum[1] = DateUtil.str(poll2);
		pollnum[2] = DateUtil.str(poll3);
		pollnum[3] = DateUtil.str(poll4);
		pollnum[4] = DateUtil.str(poll5);
		pollnum[5] = DateUtil.str(poll6);
		pollnum[6] = DateUtil.str(poll7);
		pollnum[7] = DateUtil.str(poll8);
		pollnum[8] = DateUtil.str(poll9);
		pollnum[9] = DateUtil.str(poll10);
		
		return pollnum;
	}
	
	public Date getSdate() {
		return DateUtil.toDate(getSyear(), getSmonth(), getSday());
	}
	
	public Date getEdate() {
		return DateUtil.toDate(getEyear(), getEmonth(), getEday());
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSyear() {
		return syear;
	}

	public void setSyear(int syear) {
		this.syear = syear;
	}

	public int getSmonth() {
		return smonth;
	}

	public void setSmonth(int smonth) {
		this.smonth = smonth;
	}

	public int getSday() {
		return sday;
	}

	public void setSday(int sday) {
		this.sday = sday;
	}

	public int getEyear() {
		return eyear;
	}

	public void setEyear(int eyear) {
		this.eyear = eyear;
	}

	public int getEmonth() {
		return emonth;
	}

	public void setEmonth(int emonth) {
		this.emonth = emonth;
	}

	public int getEday() {
		return eday;
	}

	public void setEday(int eday) {
		this.eday = eday;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}

	public String getPoll1() {
		return poll1;
	}

	public void setPoll1(String poll1) {
		this.poll1 = poll1;
	}

	public String getPoll2() {
		return poll2;
	}

	public void setPoll2(String poll2) {
		this.poll2 = poll2;
	}

	public String getPoll3() {
		return poll3;
	}

	public void setPoll3(String poll3) {
		this.poll3 = poll3;
	}

	public String getPoll4() {
		return poll4;
	}

	public void setPoll4(String poll4) {
		this.poll4 = poll4;
	}

	public String getPoll5() {
		return poll5;
	}

	public void setPoll5(String poll5) {
		this.poll5 = poll5;
	}

	public String getPoll6() {
		return poll6;
	}

	public void setPoll6(String poll6) {
		this.poll6 = poll6;
	}

	public String getPoll7() {
		return poll7;
	}

	public void setPoll7(String poll7) {
		this.poll7 = poll7;
	}

	public String getPoll8() {
		return poll8;
	}

	public void setPoll8(String poll8) {
		this.poll8 = poll8;
	}

	public String getPoll9() {
		return poll9;
	}

	public void setPoll9(String poll9) {
		this.poll9 = poll9;
	}

	public String getPoll10() {
		return poll10;
	}

	public void setPoll10(String poll10) {
		this.poll10 = poll10;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
	}

	public void setPollnum(String[] pollnum) {
		this.pollnum = pollnum;
	}
	
	
	
	
}



