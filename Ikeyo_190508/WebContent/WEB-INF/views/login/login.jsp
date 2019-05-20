<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<div class="container" align="center">
	<h1>ikeyo</h1>
</div>   

<div class="container" align="center">
	<form action="loginAf.do" name="frmForm" id="_frmForm" method="post">
		<table>
			<colgroup>
				<col style="width: 30%">
				<col style="width: 70%">
			</colgroup>
			<tbody>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" id="_uid" name="id" data-msg="ID를" title="아이디">
						<input type="checkbox" id="idSaveCheck">ID 저장
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" id="_pwd" name="pwd" data-msg="패스워드를" title="패스워드">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<span>
							<a href="#none" id="_findId" title="ID찾기">ID 찾기</a>
							<a href="#none" id="_findPwd" title="비밀번호찾기">비밀번호 찾기</a>
						</span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<span>
							<a href="#none" id="_btnLogin" title="로그인">로그인</a>
							<a href="#none" id="_btnRegi" title="회원가입">회원가입</a>
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<script>
// ID 저장
$(document).ready(function() {
	// 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	var uid = getCookie("uid");
	
	$('#_uid').val(uid);
	if($('#_uid').val() != "") { // 그전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		$('#idSaveCheck').attr("checked", true);
	}
	
	$('#idSaveCheck').change(function() {
		if($('#idSaveCheck').is(":checked")) {	// ID 저장하기 체크했을 때,
			setCookie("uid", $('#_uid').val(), 7);	// 7일 동안 쿠키 보관
		} else {	// ID 저장하기 체크 해제 시,
			deleteCookie("uid");
		}
	});
	
	// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	$('#_uid').keyup(function() {	// ID 입력 칸에 ID를 입력할 때,
		if($('#idSaveCheck').is(":checked")) {	// ID 저장하기를 체크한 상태라면,
			setCookie("uid", $('#_uid').val(), 7);
		}	
	});
});
function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "= " + cookieValue;
}
function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
function getCookie(cookieName) {
	cookieName = cookieName + "=";
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)
			end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
$('#_btnLogin').click(function() {
	if($('#_uid').val() == "") {
		alert($('#_uid').attr("data-msg") + " 입력해 주세요");
		$('#_uid').focus();
	} else if($('#_pwd').val() == "") {
		alert($('#_pwd').attr("data-msg") + " 입력해 주세요");
		$('#_pwd').focus();
	} else {
		$('#_frmForm').attr("target", "_self").submit();
	}
});
$('#_uid').keypress(function(event){
	if(event.which == "13"){
		event.preventDefault();
		$('#_pwd').focus();
	}
});
$('#_pwd').keypress(function(event){
	if(event.which == "13"){
		event.preventDefault();
		$('#_btnLogin').click();
	}
});
$('#_btnRegi').click(function() {
	location.href = "regi.do";
});
$('#_findId').click(function() {
	location.href = "findId.do";
});
$('#_findPwd').click(function() {
	location.href = "findPwd.do";
});
</script>