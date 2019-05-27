<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>reviewWrite</title>
<style type="text/css">
.noto { font-family: 'Noto Sans KR'; letter-spacing: -1px;}
.f13 {
	font-size:13px;	/* 10pt */
	margin-bottom: 5px;
}
</style>
</head>
<body>

<div id="r_container">
<div align="center" style="padding: 60px 60px 35px 60px;">
<h3>포토 상품평</h3>
<br/>
<hr/>

<div id="frm_container" align="left">

<form id="_frmForm1" method="post" enctype="multipart/form-data">
<span class="noto f13">제목</span>
<br/>
<input type="text" name="title" id="title"/>
<br/>
<span class="noto f13">내용을 입력해 주세요</span>
<br/>
<textarea rows="10" cols="50" name="content" id="content" style="max-width: 338px;"
>
</textarea>
<br/>
<span class="noto f13">만족도</span>
<img id="star1" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(1)" />
<img id="star2" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(2)"/>
<img id="star3" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(3)"/>
<img id="star4" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(4)"/>
<img id="star5" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark(5)"/>
<br/><br/>
<input type="hidden" name="model_id" value="${pdto.model_id }" />
<input type="hidden" name="id" value="${login.id }" />
<input type="hidden" name="parent" value="${pdto.prod_seq }" />
<input type="hidden" name="starpoint" id="starpoint" value="" />
<span class="noto f13">파일첨부</span>
<input type="file" name="fileload" id="fileload" />
<br/>
<br/>
<br/>
<div align="center">
	<input type="button" value="작성 완료" onclick="goWrite()" />
</div>

</form>

</div>
</div>

</div>
<script>
function mark(st) {
	var image;
	// alert(st);
	$("#starpoint").val(st);	
	for(j = 5; j > st; j--){
		image = "#star" + j;
		$(image).attr("src", "<%=request.getContextPath()%>/image/star_off.png");
	}
	
	for(i = 1; i <= st; i++){
		image = "#star" + i;
		//alert(image);		
		$(image).attr("src", "<%=request.getContextPath()%>/image/star_on.png");
	}
}

function goWrite() {
	alert("왜 안되냐?");
	$("#_frmForm1").attr("action", "reviewWriteAf.do").submit();
}

</script>
</body>
</html>