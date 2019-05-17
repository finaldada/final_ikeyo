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
	<form name="frmForm" id="_frmForm" method="post">
		<div>
			아이디: <input type="text" name="id" id="_id" value="${login.id }" readonly="readonly">
			<br>
			비밀번호: <input type="password" name="pwd" id="_pwd" value="">
			<br>
			이름: <input type="text" name="name" id="_name" value="${mem.name }" readonly="readonly">
			<br>
			Email: <input type="text" name="email" id="_email" value="${mem.email }" readonly="readonly">
			<br>
			결제비밀번호: <input type="password" name="paypwd" id="_paypwd" value="${mem.paypwd }">
			<br>
			핸드폰: <input type="text" name="phone" id="_phone" value="${mem.phone }" data-msg="핸드폰을">
			<br>
			<div id="_getPhone"></div>
			<br>
			주소: <input type="text" id="sample2_postcode" placeholder="우편번호">
				<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" size="10"><br>
				<input type="text" name="address1" id="sample2_address" placeholder="주소" size="50" value="${mem.address1 }" data-msg="주소를"><br>
				<input type="text" name="address2" id="sample2_detailAddress" placeholder="상세주소" size="25" value="${mem.address2 }" data-msg="상세주소를">
				<input type="text" id="sample2_extraAddress" placeholder="참고항목" size="20">
			<br>
			Point: <input type="text" name="point" value="${mem.point }" readonly="readonly">
			<br>
			등급: <input type="text" name="grade" value="${mem.grade }" readonly="readonly">
		</div>
		<input type="submit" id="_btnInfo" title="정보수정" value="정보수정">
	</form>
</div>

<script>
var pwd = $('#_pwd').val();
var paypwd = $('#_paypwd').val();

$(function() {
	$('#_btnInfo').attr("disabled", "disabled");
	
	if(!($.isNumeric(paypwd))){
		alert("숫자만 입력해주세요");
		$('#_paypwd').val("");
		$('#_paypwd').focus();
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
		$('#_btnInfo').removeAttr("disabled");
	}
});

$('#_btnInfo').click(function() {
	var pwd = $('#_pwd').val();
	
	if(pwd == "") {
		pwd = '${mem.pwd}';
	}
	$('#_pwd').val(pwd);
	$('#_frmForm').attr("action", "myInfoAf.do").submit();
});

//핸드폰 확인
$(function() {
	$('#_phone').focusout(function() {
		if($('#_phone').val().trim() == "") {
			alert("폰번호를 입력해주세요.");
		} else {
			var id = '${login.id}';
			$.ajax({
				url:"myInfoPhone.do",
				type:"post",
				data: {"phone" : $('#_phone').val().trim(), "id" : id},
				success:function(data) {
					if(data.OK == "OK"){
						$('#_getPhone').css({"color":"blue", "font-weight":"900"});
						$('#_getPhone').html("핸드폰 사용가능");
						$('#_btnInfo').removeAttr("disabled");
					} else{
						if(data.MY == "MYPHONE"){
							$('#_getPhone').css({"color":"red", "font-weight":"900"});
							$('#_getPhone').html("자신의 핸드폰");
							$('#_btnInfo').removeAttr("disabled");
						} else {
							$('#_getPhone').css({"color":"red", "font-weight":"900"});
							$('#_getPhone').html("핸드폰 사용중");
							$('#_btnInfo').attr("disabled", "disabled");
							$('#_phone').val("");	
						}
					}
				},
				error:function(r, s, err) {
					alert("error");
				}
			});
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