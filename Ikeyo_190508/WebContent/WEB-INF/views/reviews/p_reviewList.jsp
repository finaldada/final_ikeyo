<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<style type="text/css">
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 9; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 100px auto 0px; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 500px; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}
.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>
</head>
<body>
<br/>

<div align="center">
<span style="font-size: 14px; color: #aaa;">
*상품과 무관하거나 오해의 소지가 있는 내용의 상품평은 통보 없이 삭제될 수 있습니다. 게시물에 대한 상업적/비상업적 권리는 이케요에 귀속됩니다.
</span>
</div>
<br/>
<div class="title">
<!-- <span class="noto tt">상품평</span> -->
<h3>상품평</h3>
</div>

<div align="right">
<input type="button" value="상품평쓰기" id="goWrite" <%-- onclick="goWrite('${pdto.model_id}', '${login.id }')" --%>/>
</div>

<hr/>
<div id="mainContainer">
<table>
<colgroup>
	<col width="20%"><col width="60%"><col width="15%"><col width="5%">
</colgroup>

<c:if test="${empty rlist }">
	<tr>
		<td colspan="4">작성된 글이 없습니다</td>
	</tr>
</c:if>

<c:if test="${not empty rlist }">
	<c:forEach items="${rlist }" var="review" varStatus="vs">
		<tr style="height: 200px;">
			<td>
				<img style="max-width: 200px;" src="/img/${review.photo_af }" alt="" />
			</td>
			
			<td>			
			
			<c:forEach var="st" begin="1" end="5" step="1">
				<c:choose>
				<c:when test="${review.starpoint ge st}">
					<img src="<%=request.getContextPath() %>/image/star_on.png" alt="" />				
				</c:when>
				<c:when test="${review.starpoint lt st}">
					<img src="<%=request.getContextPath() %>/image/star_off.png" alt="" />				
				</c:when>				
				</c:choose>
			</c:forEach>
			<br/>
			<span>${review.title }</span>
			<br/>
			<span>${review.content }</span>
			</td>
			<td>${review.wdate }</td>
			<td></td>
		</tr>
	</c:forEach>
</c:if>


</table>

</div>





<!-- The Modal -->
<div id="myModal" class="modal">
 
	<!-- Modal content -->
    <div class="modal-content">
    	<span class="close" style="text-align: right;">&times;</span>                                                               
        <jsp:include page="/WEB-INF/views/reviews/reviewWrite.jsp" flush="false"/> 
    </div>
</div>

<script>

//When the user clicks on the button, open the modal 
$("#goWrite").on("click", function() {
	$(".modal").css("display", "block");
});

//When the user clicks on <span> (x), close the modal
$(".close").click(function() {
	var im;
	$(".modal").css("display", "none");
	$("#title").val("");
	$("#content").val("");
	for(i = 1; i <=5; i++){
		im = "#star" + i;
		$(im).attr("src", "<%=request.getContextPath()%>/image/star_off.png");
	}
	$("#fileload").val("");
});

</script>


<hr/>


</body>
</html>