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
    <link rel="stylesheet" href="css/page.css" />
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
    <div class="contact-form ptb--130 ptb_md--80 ptb_sm--80 bg-color" data-bg-color="#ffffff" style="margin: 0px;padding: 10px 0px;">
        <div class="container">
            <div class="row" >
                <div class="col-lg-12">
                    <div class="contact-form-wrapper">
                        <div class="single_review_content tab-pane fade show active"  role="tabpanel" style="border:1px solid #EEEEEE;padding:10px;min-height: 300px;display: flex;flex-direction: column">

                         <h4 style="text-align: center">${news.title}</h4>
                            <span style="text-align: center">发布时间:${news.savetime}</span>
                            <c:if test="${news.filename ne null and news.filename ne ''}">
                                <div style="text-align: center" >
                                    <img src="upfile/${news.filename}" style="width: 40%;">
                                </div>
                            </c:if>
                            <p>${news.content}</p>
                        </div>
                        <!-- Start Contact Wrapper -->

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



