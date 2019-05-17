<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<div>
	<form method="post" id="_frmForm" name="frmForm">
		비밀번호: <input type="text" name="pwd" id="_pwd" data-msg="비밀번호를">
		<br>
		<input type="submit" id="_btn" value="확인">
		<input type="button" id="_cancle" value="취소">
	</form>
</div>

<script>
$('#_btn').click(function() {
	var pwd = $('#_pwd').val();
	if(pwd == "") {
		alert($('#_pwd').attr("data-msg") + " 입력해주세요");
		$('#_pwd').focus();
		return false;
	} else {
		$('#_frmForm').attr("action", "myInfoGoAf.do").submit();
	}
});

$('#_cancle').click(function() {
	location.href = "login.do";
});
</script>