<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<header class="header-area haeder-default  black-logo-version ptb_lg--40 ptb_md--40 ptb_sm--30">

    <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-6" style="border:0px solid red;max-width: 100%;">
        <div style="padding-right: 20px;letter-spacing: 1px;border:0px solid orange;text-align: right;">
            <c:choose>
                <c:when test="${sessionScope.sessionmember ne null}">
                    欢迎你!&nbsp;&nbsp;${sessionScope.sessionmember.uname}(${sessionScope.sessionmember.lev})
                    <a href="webSocket">在线客服</a>
                    <a  href="memberExit">
                        退出
                    </a>
                </c:when>
                <c:otherwise>
                    <a  href="login">登录 </a>/<a  href="register">注册</a>

                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="header-wrapper container">
        <div class="row align-items-center">
            <!-- Start Header Left -->
            <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-6">
                <div class="logo">
                    <a href="index" style="color: black;letter-spacing: 5px;font-weight: bolder;font-family: Arial;font-size: 20px;-webkit-font-smoothing: antialiased;">
                        <!--
                        <img src="assets/images/logo/logo-black.png" alt="Draven logo">
                        -->
                        农特产品商城（消费者模块）
                    </a>
                </div>
            </div>
            <!-- Start Header Center -->
            <div class="col-xl-12 d-none d-xl-block">
                <nav class="mainmenu__nav">
                    <!-- Start Mainmanu Nav -->
                    <ul class="primary-menu megamenu-wrapper">
                        <li><a href="index">首页</a></li>
                        <li><a href="productLb">全部商品</a></li>
                        <li><a href="recommend">推荐商品</a></li>

                        <li><a href="cartList"><span>购物车</span></a></li>
                        <li><a href="dingdanLb"><span>订单信息</span></a></li>
                        <li><a href="favLb"><span>收藏</span></a></li>
                        <li><a href="addressLb"><span>收货地址</span></a></li>
                        <li><a href="accountMsg"><span>个人信息</span></a></li>

                       <%-- <c:forEach items="${sessionScope.fcategorylist}" var="fcategory">
                            <li class="lavel-1"><a href="productLb?fid=${fcategory.id}">${fcategory.name}</a>
                                <ul class="dropdown__menu">
                                    <c:forEach items="${fcategory.childlist}" var="scategory">
                                        <li><a href="productLb?fid=${fcategory.id}&sid=${scategory.id}"><span>${scategory.name}</span></a></li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:forEach>
                        <li><a href="tjproductLb">特价商品</a></li>
                        <c:if test="${sessionScope.sessionmember ne null}">
                        <li class="lavel-1"><a href="javascript:void(0)">个人中心</a>
                            <ul class="dropdown__menu">
                                <li><a href="cartList"><span>购物车</span></a></li>
                                <li><a href="dingdanLb"><span>订单信息</span></a></li>
                                <li><a href="favLb"><span>收藏</span></a></li>
                                <li><a href="addressLb"><span>收货地址</span></a></li>
                                <li><a href="accountMsg"><span>个人信息</span></a></li>
                            </ul>
                        </li>
                        </c:if>--%>
                       

                    </ul>
                    <!-- End Mainmanu Nav -->
                </nav>
            </div>
            <!-- Start Header Right -->
            <c:if test="${sessionScope.sessionmember ne null}">
            <div class="col-xl-1 col-lg-6 col-md-6 col-sm-6 col-6">
                <div class="header-icon d-flex justify-content-end cart text-right">
                    <a class="cart-trigger" href="#">
                        <i class="fa fa-shopping-cart"></i>
                        <span class="cart-count">${fn:length(sessioncartlist)}</span>
                    </a>
                    <a class="hamburger-trigger d-block d-xl-none pl--15" href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
            </div>
            </c:if>
        </div>
    </div>
</header>
<!-- Start Header -->

<!-- Start Search Flyover -->
<jsp:include page="gwc.jsp"></jsp:include>
<!-- End Search Flyover -->
<!-- Start Hamburger -->
<div class="hamburger-area">
    <div class="btn-close-search">
        <button>
            <i class="fa fa-times" aria-hidden="true"></i>
        </button>
    </div>
    <!-- Start Main Menu -->
    <!-- End Main Menu -->
</div>

<jsp:include page="gwc.jsp"></jsp:include>

<div class="hamburger-area">
    <div class="btn-close-search">
        <button>
            <i class="fa fa-times" aria-hidden="true"></i>
        </button>
    </div>
    <!-- Start Main Menu -->
    <ul class="menu-primary-menu-1 responsive-manu d-block d-xl-none" id="responsive-manu">
        <li><a href="index">首页</a></li>
        <li><a href="productLb">全部商品</a></li>
        <li><a href="recommend">推荐商品</a></li>

        <li><a href="cartList"><span>购物车</span></a></li>
        <li><a href="dingdanLb"><span>订单信息</span></a></li>
        <li><a href="favLb"><span>收藏</span></a></li>
        <li><a href="addressLb"><span>收货地址</span></a></li>
        <li><a href="accountMsg"><span>个人信息</span></a></li>

        <%--<c:forEach items="${sessionScope.fcategorylist}" var="fcategory">
            <li class="lavel-1"><a href="productLb?fid=${fcategory.id}">${fcategory.name}</a>
                <ul class="dropdown__menu">
                    <c:forEach items="${fcategory.childlist}" var="scategory">
                        <li><a href="productLb?fid=${fcategory.id}&sid=${scategory.id}"><span>${scategory.name}</span></a></li>
                    </c:forEach>
                </ul>
            </li>
        </c:forEach>
        <li class="has-dropdown"><a href="javascript:void(0)">个人中心</a>
            <ul class="sub-menu">
                <li><a href="cartList"><span>购物车</span></a></li>
                <li><a href="dingdanLb"><span>订单信息</span></a></li>
                <li><a href="favLb"><span>收藏</span></a></li>
                <li><a href="accountMsg"><span>个人信息</span></a></li>
            </ul>
        </li>--%>
       
    </ul>
    <!-- End Main Menu -->
</div>
<!-- End Hamburger -->
<!-- Start Breadumb Area -->
<!-- End Breadumb Area -->

<!-- Quick View Modal -->

<!--// Quick View Modal -->
<!-- Start Footer Area -->
<!-- End Footer Area -->















<!-- JS
============================================ -->

<!-- Modernizer JS -->
<!-- Vendor & Plugins JS (Please remove the comment from below vendor.min.js & plugins.min.js for better website load performance and remove js files from avobe) -->
<!--
<script src="assets/js/vendor/vendor.min.js"></script>
<script src="assets/js/plugins/plugins.min.js"></script>
-->

<!-- Main JS -->


</body>

</html>



