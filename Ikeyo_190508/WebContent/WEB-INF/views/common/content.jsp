<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<fmt:requestEncoding value="utf-8"/>

<!-- <div style="width: 100%; height: 90%; margin-left: 200px; margin-top: 100px;">
<h2>Carousel Example</h2>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<img src="image/Carousel_bad.jpg" alt="" style="width:1200px; height: 550px;">
	</div>
</div>
 -->
 

<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>


<div class="container">
  <h2>Carousel Example</h2>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    Indicators
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    Wrapper for slides
    <div class="carousel-inner">

      <div class="item active">
        <img src="image/Carousel_bad.jpg" alt="" style="width:1370px; height: 600px;">
        <div class="carousel-caption">
          <h3>하늘색 침대</h3>
          <p>하늘색 침대하늘색 침대하늘색 침대!</p>
        </div>
      </div>

      <div class="item">
        <img src="image/Carousel_desk.jpg" alt="" style="width:1370px; height: 600px;">
        <div class="carousel-caption">
          <h3>책상</h3>
          <p>책상책상책상!</p>
        </div>
      </div>
    
      <div class="item">
        <img src="image/Carousel_sofa.jpg" alt="" style="width:1370px; height: 600px;">
        <div class="carousel-caption">
          <h3>편안한 소파</h3>
          <p>소파소파소파소파!</p>
        </div>
      </div>
  
    </div>

    Left and right controls
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  
  
</div>



</body>
</html>

