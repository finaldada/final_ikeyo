package kh.com.a.util;

import java.util.List;

import kh.com.a.model.CalendarDto;

public class CalendarUtil {
	
	// null값이면 true로 반환
	public static boolean nvl(String msg) {
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	// 날짜를 보여주는 함수 
	public static String caltoday(int year, int month, int day) {
		
		String s = "";
	    
		s += String.format("%2d", day);
		
		return s;		
	}
	
	// 일정을 추가하기 위한 calwrite.jsp로 이동하기 위한 함수로 이미지 클릭시 처리
	public static String showimage(int year, int month, int day) {
		String s = "";
		
		String image = "<img src='./image/stamp_off.jpg'>";
		
		s = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>", 
						  "calwrite.do", year, month, day, image);	
		
		return s;		
	}
	
	
	/*
	// db  1 -> 01 해주는 함수 
	public static String two(String msg) {
		return msg.trim().length()<2?"0"+msg.trim():msg.trim();
	}
	*/
	
	// 각 날짜별로 테이블을 생성하는 함수
	/*
		public static String makeTable(int year, int month, int day, List<CalendarDto> list) {
			
			String s = "";
			String dates = (year + "") + two(month + "") + two(day + ""); // "20190301"
			
			s += "<table>";
			s += "<col width='98'>";
			
			for(CalendarDto dto : list) {			
				if(dto.getRdate().substring(0, 8).equals(dates)) { // 20190301 == dates
					
					s += "<tr bgcolor='green'>";
					s += "<td>";
					
					s += "<a href='caldetail.jsp?seq=" + dto.getSeq() + "'>";
					s += "<font style='font-size:3; color:white'>";
					s += dot3( dto.getTitle() );
					s += "</font>";
					s += "</a>";
					
					s += "</td>";
					s += "</tr>";
				}			
			}	
			s += "</table>";
			
			return s;
		}
		*/
	
		// 제목이 너무 길면, ...으로 처리할 함수		예) 데이트약속...
		/*
		public static String dot3(String msg) {
			String s = "";
			if(msg.length() >= 5) {
				s = msg.substring(0, 5);
				s += "...";
			}else {
				s = msg.trim();
			}	
			return s;
		}
		*/
	

}






