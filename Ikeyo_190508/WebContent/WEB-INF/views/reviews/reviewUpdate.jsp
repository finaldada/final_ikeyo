<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<style type="text/css">
.noto { font-family: 'Noto Sans KR'; letter-spacing: -1px;}
.f13 {
   font-size:13px;   /* 10pt */
   margin-bottom: 5px; 
}
.f15 { font-size:15px; }
.lb_side {
   width: 50px;
}
.inputText {
    width: 171.5px;
    padding: 5px 10px;
}
.searchBtn {
   display:inline-block;
   text-align:center;
   width: 110px;
   height: 30px;
   padding: 4px 0px 7px;
   color : #fff;
   background-color: #63666a;
   border: 1px solid #63666a;
}
   
.searchBtn:hover {
   cursor:pointer;
   background-color: #4f5256;
   border: 1px solid #4f5256;
}
#sf2 {
    display: none;
}
</style>

<div id="r_u_container">
<div align="center" style="padding: 60px 60px 35px 60px;">
<h3>포토 상품평 수정</h3>
<br/>
<hr/>

<div id="up_frm_container" align="left">

<form id="_frmForm2" method="post" enctype="multipart/form-data">
<span class="noto f13">제목</span>
<br/>
<input type="text" name="title" id="title1" value=""/>
<br/>
<span class="noto f13">내용을 입력해 주세요</span>
<br/>
<textarea rows="10" cols="50" name="content" id="content1" style="max-width: 338px; resize: none;"
>
</textarea>
<br/>
<span class="noto f13">만족도</span>         
<img id="st1" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(1)" />
<img id="st2" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(2)"/>
<img id="st3" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(3)"/>
<img id="st4" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(4)"/>
<img id="st5" src="<%=request.getContextPath() %>/image/star_off.png" alt="" onclick="mark1(5)"/>
<br/><br/>
<input type="hidden" name="model_id" value="${pdto.model_id }" >
<input type="hidden" name="id" value="${login.id }" />
<input type="hidden" name="parent" value="${pdto.prod_seq }" >
<input type="hidden" name="starpoint" id="starpoint1" value="" >
<input type="hidden" name="rev_seq" id="rev_seq1" value="">
<!-- <input type="file" name="fileload" id="fileload1" /> -->
   <span class="lb noto f13 lb_side">파일첨부</span>
   <input type="text" class="inputText searchFileName" name="fileload" id="fileload1" readonly="readonly">
   <label for="sf2">
      <span class="searchBtn noto f15">찾아보기</span>
      <input type="file" class="searchFile" id="sf2" name="fileload">
   </label>
<br>
<br>
<br>
<div align="center">
   <input type="button" value="작성 완료" onclick="goUpdate()" class="redBtn" />
</div>

</form>

</div>
</div>

</div>
<script>
function mark1(st) {
   var image;
   // alert(st);
   $("#starpoint1").val(st);   
   for(j = 5; j > st; j--){
      image = "#st" + j;
      $(image).attr("src", "<%=request.getContextPath()%>/image/star_off.png");
   }
   
   for(i = 1; i <= st; i++){
      image = "#st" + i;
      //alert(image);      
      $(image).attr("src", "<%=request.getContextPath()%>/image/star_on.png");
   }
}

$(".searchFile").change(function(){
    // img File만 가능
    var ext = this.value.match(/\.(.+)$/)[1];
    switch (ext) {
       case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
           $(".searchFileName").val($(this).val().slice(12, $(this).val().length));
            break;
        default:
            alert('jpg, jpeg, png, gif 확장자인 이미지를 첨부해주세요.');
            $("#fileload1").val("");
    }
 });

function goUpdate() {
   
   if($("#title1").val().trim() == ""){
      alert("제목을 입력하세요");
   }else if($("#content1").val().trim() == ""){
      alert("내용을 입력하세요");
   }else if($("#fileload1").val() == ""){
      alert("파일을 넣어주세요");
   }else{
      $("#_frmForm2").attr("action", "reviewUpdate.do").submit();
   }
   
}
</script>