<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>农特产品商城</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->


    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/plugins/plugins.css">

    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from avobe) -->
    <!--
    <script src="assets/js/vendor/vendor.min.js"></script>
    <script src="assets/js/plugins/plugins.min.js"></script>
    -->

    <!-- Main Style CSS (Please use minify version for better website load performance) -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!--<link rel="stylesheet" href="assets/css/style.min.css">-->

</head>

<body>

<!-- Start Header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Start Header -->

<!-- Start Search Flyover -->

<!-- End Hamburger -->

<!-- Start Breadumb Area -->
<div class="breadcumb-area ptb--100 ptb_md--100 ptb_sm--100  bg_image bg_image--3">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="inner text-center">
                   
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadumb Area -->
<div class="main-wrapper">
    <!-- Start Contact Form -->
    <div class="contact-form ptb--130 ptb_md--80 ptb_sm--80 bg-color" data-bg-color="#ffffff">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="contact-form-wrapper">
                        <div class="single_review_content tab-pane fade show active"  role="tabpanel">

                            <c:forEach items="${pageInfo.list}" var="msg">
                                <div class="content" style="border:0px solid orange;margin-bottom: 20px;">
                                    <div style="float: left;border:0px solid red;width: 98%">
                                        <div style="float:left;border:0px solid orange;padding-top: 10px;">
                                            <img src="upfile/${msg.member.filename}"  style="width: 70px;height: 70px;border-radius: 100px 100px;">
                                        </div>
                                        <div style="float: left;border:0px solid orange;width: 84%;padding-left: 10px;">
                                            ${msg.savetime}
                                            <p>${msg.content}</p>
                                                <c:if test="${msg.hfcontent ne null}">
                                                <p><span style="font-weight: bolder;">回复内容:</span>${msg.hfcontent}</p>
                                                </c:if>
                                        </div>
                                    </div>
                                    <div style="clear:both;"></div>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- Start Contact Wrapper -->
                        <form class="contact__form--1"  action="msgAdd" method="post">
                            <div class="row">
                                <div class="col-lg-12 mt--20">
                                    <textarea name="content" placeholder="留言内容"    required oninvalid="setCustomValidity('留言内容不能为空')" oninput="setCustomValidity('');"></textarea>
                                </div>
                                <div class="col-lg-12 mt--30">
                                    <input type="submit" value="提交">
                                    <p class="form-messege"></p>
                                </div>
                            </div>
                        </form>
                        <!-- End Contact Wrapper -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Contact Form -->

</div>

<!-- Quick View Modal -->
<!--// Quick View Modal -->
<!-- Start Footer Area -->
<jsp:include page="foot.jsp"></jsp:include>
<!-- End Footer Area -->















<!-- JS
============================================ -->

<!-- Modernizer JS -->
<script src="assets/js/vendor/modernizr.min.js"></script>
<!-- jQuery JS -->
<script src="assets/js/vendor/jquery.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/vendor/bootstrap.min.js"></script>
<script src="assets/js/plugins/plugins.js"></script>
<!-- Vendor & Plugins JS (Please remove the comment from below vendor.min.js & plugins.min.js for better website load performance and remove js files from avobe) -->
<!--
<script src="assets/js/vendor/vendor.min.js"></script>
<script src="assets/js/plugins/plugins.min.js"></script>
-->

<!-- Main JS -->
<script src="assets/js/main.js"></script>

</body>

</html>



