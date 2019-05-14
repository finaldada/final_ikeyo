<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!-- <!DOCTYPE html> -->
<html>
<head>
<meta charset="UTF-8">
<title>hello! Ikeyo</title>
	<tiles:insertAttribute name="header"/>
</head>
<body>

<div style=" width: 98%; height: 15%; margin-bottom: 5px;">
	<tiles:insertAttribute name="top_menu"/>
</div>

<div style="border: 1px solid; width: 98%; height: auto;
	padding-top: 5%;">
	<tiles:insertAttribute name="content"/>
</div>

<div style="border: 1px solid; width: 98%; height: 15%;">
	<tiles:insertAttribute name="footer"/>
</div>



</body>
</html>