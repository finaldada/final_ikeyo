<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/> 

<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<div>
	<h1>회원가입</h1>
</div>

<div>
	<form method="post" id="_frmForm" name="frmForm">
		<table>
			<tbody>
				<tr>
					<th>아이디 확인</th>
					<td>
						<input type="text" name="sid" id="_id">
						<a href="#none" id="_checkId" title="ID체크">ID 중복확인</a>
						<div id="_getId"></div>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="id" id="_uid" data-msg="아이디를" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password" name="pwd" id="_pwd" data-msg="패스워드를">
					</td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td>
						<input type="password" id="_pwdchk" data-msg="패스워드 확인을">
					</td>
				</tr>
				<tr>
					<td>
						<div id="alert-success" style="color: blue; font-weight: 900;">비밀번호가 일치합니다.</div>
						<div id="alert-danger" style="color: red; font-weight: 900;">비밀번호가 일치하지 않습니다.</div>
					</td>
				</tr>
				<tr>
					<th>결제 비밀번호</th>
					<td>
						<input type="password" name="paypwd" id="_paypwd" data-msg="결제 비밀번호를">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" id="_name" data-msg="이름을">
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<input type="hidden" name="email" id="_email">
						<input type="text" id="_email1" data-msg="이메일을">
						@ <input type="text" id="_email2" data-msg="이메일 주소를">
						<select id="_selemail">
							<option value="" selected>직접입력</option>
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
						</select> 
						<input type="button" value="이메일 인증" id="_auth">
					</td>
				</tr>
				<tr>
					<td>
						<div id="_getEmail"></div>
					</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>
						<input type="text" name="phone" id="_phone" data-msg="핸드폰을">
					</td>
				</tr>
				<tr>
					<td>
						<div id="_getPhone"></div>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" id="sample2_postcode" placeholder="우편번호">
						<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" size="10"><br>
						<input type="text" name="address1" id="sample2_address" placeholder="주소" size="50" data-msg="주소를"><br>
						<input type="text" name="address2" id="sample2_detailAddress" placeholder="상세주소" size="25" data-msg="상세주소를">
						<input type="text" id="sample2_extraAddress" placeholder="참고항목" size="20">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" id="_btnRegi" title="회원가입" value="회원가입">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

<script>
$('#_btnRegi').click(function() {
	var paypwd = $('#_paypwd').val();
	
	if($('#_uid').val() == ""){
		alert("아이디를 입력해주세요");
		$('#_uid').focus();
		return false;
	} else if($('#_pwd').val() == ""){
		alert($('#_pwd').attr("data-msg") + " 입력해주세요");
		$('#_pwd').focus();
		return false;
	} else if($('#_pwdchk').val() == ""){ 
		alert($('_pwdchk').attr("data-msg") + " 입력해주세요");
		$('#_pwdchk').focus();
		return false;
	} else if($('#_paypwd').val() == ""){
		alert($('#_paypwd').attr("data-msg") + " 입력해주세요");
		$('#_paypwd').focus();
		return false;
	} else if(!($.isNumeric(paypwd))){
		alert("숫자만 입력해주세요");
		$('#_paypwd').val("");
		$('#_paypwd').focus();
		return false;
	} else if($('#_name').val() == ""){
		alert($('#_name').attr("data-msg") + " 입력해주세요");
		$('#_name').focus();
		return false;
	} else if($('#_email1').val() == "" || $('#_email1').val().indexOf("@") != -1){
		if($('#_email1').val() == "") {
			alert($('#_email1').attr("data-msg") + " 입력해주세요");
			$('#_email1').focus();	
		} else {
			alert("이메일 형식이 알맞지 않습니다. 다시 확인해 주세요");
			$('#_email1').val("");
			$('#_email1').focus();
		}
		return false;
	} else if($('#_email2').val() == "") {
		alert($('#_email2').attr("data-msg") + " 입력해주세요");
		$('#_email2').focus();
		return false;
	} else if($('#_phone').val() == ""){
		alert($('#_phone').attr("data-msg") + " 입력해주세요");
		$('#_phone').focus();
		return false;
	} else if($('#sample2_address').val() == ""){
		alert($('#sample2_address').attr("data-msg") + " 입력해주세요");
		return false;
	} else if($('#sample2_detailAddress').val() == "") {
		alert($('#sample2_detailAddress').attr("data-msg") + " 입력해주세요");
		return false;
	} else {
		var email = $('#_email1').val().trim() + "@" + $('#_email2').val().trim();
		$('#_email').val(email);
		if($('#_auth').attr('disabled')) {
			$('#_frmForm').attr("action", "regiAf.do").submit();
		} else {
			alert("이메일 인증을 해주세요");
			return false;
		}
	}
});

// 비밀번호 일치 확인
$(function(){
    $("#alert-success").hide();
    $("#alert-danger").hide();
    $("input").keyup(function(){
        var pwd1=$("#_pwd").val();
        var pwd2=$("#_pwdchk").val();
        if(pwd1 != "" || pwd2 != ""){
            if(pwd1 == pwd2){
                $("#alert-success").show();
                $("#alert-danger").hide();
                $("#_btnRegi").removeAttr("disabled");
            }else{
                $("#alert-success").hide();
                $("#alert-danger").show();
                $("#_btnRegi").attr("disabled", "disabled");
            }    
        }
    });
});

$('#_checkId').click(function() {
	var id = $('#_id').val().trim();
	if(id == ""){
		alert("ID를 입력해주세요");
		$('#_id').focus();
	} else{
		$.ajax({
			url:"idcheck.do",
			type:"post",
			data:"id=" + $('#_id').val().trim(),
			success:function(data){
				if(data.trim() == "OK"){
					$('#_getId').css({"color":"blue", "font-weight":"900"});
					$('#_getId').html("ID 사용가능!");
					$('#_uid').val(id);
					$("#_btnRegi").removeAttr("disabled");
				} else{
					$('#_getId').css({"color":"red", "font-weight":"900"});
					$('#_getId').html("ID 사용중!");
					$('#_uid').val("");
					$("#_btnRegi").attr("disabled", "disabled");
				}
			},
			error:function(r, s, err){
				alert("error");
			}
		});
	}
});

// 이메일 확인
$('#_auth').click(function() {
	var email = $('#_email1').val().trim() + "@" + $('#_email2').val().trim();
	$('#_email').val(email);
	if(email.trim() == "@") {
		alert("이메일을 입력해주세요");
		$('#_email1').focus();
	} else {
		$.ajax({
			url:"emailcheck.do",
			type:"post",
			data:"email=" + $('#_email').val().trim(),
			success:function(data) {				
				if(data.trim() == "OK"){
					$('#_getEmail').css({"color":"blue", "font-weight":"900"});
					$('#_getEmail').html("이메일 사용가능");
					$("#_auth").attr("disabled", "disabled");
				} else{
					$('#_getEmail').css({"color":"red", "font-weight":"900"});
					$('#_getEmail').html("이메일 사용중")
					$('#_email1').val("");
					$("#_auth").removeAttr("disabled");
				}
			},
			error:function(r, s, err) {
				alert("error");
			}
		});
	}
});

// 핸드폰 확인
$(function() {
	$('#_phone').focusout(function() {
		if($('#_phone').val().trim() == "") {
			alert("폰번호를 입력해주세요.");
		} else {
			$.ajax({
				url:"phonecheck.do",
				type:"post",
				data:"phone=" + $('#_phone').val().trim(),
				success:function(data) {
					if(data.trim() == "OK"){
						$('#_getPhone').css({"color":"blue", "font-weight":"900"});
						$('#_getPhone').html("핸드폰 사용가능");
					} else{
						$('#_getPhone').css({"color":"red", "font-weight":"900"});
						$('#_getPhone').html("핸드폰 사용중");
						$('#_phone').val("");
					}
				},
				error:function(r, s, err) {
					alert("error");
				}
			});
		}
	});
});

// 메일 select
$('#_selemail').change(function() {
	$('#_selemail option:selected').each(function() {
		if($(this).val() == "") {	// 직접 입력인 경우
			$('#_email2').val("");
			$('#_email2').attr("disabled", false);
		} else {
			$('#_email2').val($(this).text());	// 선택값 입력
			$('#_email2').attr("disabled", true);	// 비활성화
		}
	});
});	
</script>

<!-- 다음 주소 API -->
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>