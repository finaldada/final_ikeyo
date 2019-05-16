<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<div>
	<h1>ikeyo</h1>
</div>   

<div>
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
							<a href="#none" id="_btnLogin" title="로그인">로그인</a>
							<a href="#none" id="_btnRegi" title="회원가입">회원가입</a>
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<script type="text/javascript">
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
</script>