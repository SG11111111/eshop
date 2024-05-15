<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Checkout</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->


    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/plugins/plugins.css">
    <link rel="stylesheet" href="assets/css/plugins/youhuiquan.css">

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
    <ul class="menu-primary-menu-1 responsive-manu d-block d-xl-none" id="responsive-manu">
        <li class="has-dropdown"><a href="index.html">Home</a>
            <ul class="sub-menu">
                <li><a href="index.html"><span>Home 01</span></a></li>
                <li><a href="index-2.html"><span>Home 02</span></a></li>
            </ul>
        </li>
        <li><a href="about.html">About</a></li>
        <li class="has-dropdown"><a href="shop.html">Shop</a>
            <ul class="sub-menu">
                <li><a href="shop.html"><span>Shop</span></a></li>
                <li><a href="shop-left-sidebar.html"><span>Shop Left Sidebar</span></a></li>
                <li><a href="shop-no-sidebar.html"><span>Shop No Sidebar</span></a></li>
                <li><a href="product-details.html"><span>Product Details</span></a></li>
            </ul>
        </li>
        <li class="has-dropdown"><a href="#">Pages</a>
            <ul class="sub-menu">
                <li><a href="cart.html"><span>Cart</span></a></li>
                <li><a href="checkout.html"><span>Checkout</span></a></li>
                <li><a href="wishlist.html"><span>Wishlist</span></a></li>
                <li><a href="compare.html"><span>Compare</span></a></li>
                <li><a href="my-account.html"><span>My Account</span></a></li>
                <li><a href="login-register.html"><span>Login/Register</span></a></li>
            </ul>
        </li>
        <li class="has-dropdown"><a href="onlineshop.html">onlineshop</a>
            <ul class="sub-menu">
                <li><a href="onlineshop.html"><span>onlineshop</span></a></li>
                <li><a href="onlineshop-left-sidebar.html"><span>onlineshop Left Sidebar</span></a></li>
                <li><a href="onlineshop-details.html"><span>onlineshop Details</span></a></li>
            </ul>
        </li>
        <li><a href="contact.html">Contact</a></li>
    </ul>
    <!-- End Main Menu -->
</div>
<!-- End Hamburger -->

<!-- Start Breadumb Area -->
<div class="breadcumb-area ptb--100 ptb_md--100 ptb_sm--100  bg_image bg_image--3">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
    </div>
</div>
<!-- End Breadumb Area -->
<div class="main-wrapper">

    <!-- Checkout Page Start -->
    <div class="checkout_area pt--120 pt_md--80 pt_sm--80 pb--60 bg-color" data-bg-color="#ffffff">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- 效果3 begin -->
                    <div class="coupon coupon-wave-left coupon-wave-right coupon-blue-gradient">
                        <div class="coupon-info coupon-info-right-dashed">
                            <div class="coupon-store">农产品商城优惠券</div>
                            <div class="coupon-price">¥50.00<span>优惠券</span></div>
                            <div class="coupon-description">订单满200.00元</div>
                        </div>
                        <div class="coupon-get"><a onclick="getYouhuiquan()">立即领取</a></div>
                    </div>
                    <!-- 效果3 end -->
                    <!-- 效果4 begin -->
                    <div class="coupon coupon-wave-left coupon-wave-right coupon-green-gradient">
                        <div class="coupon-info coupon-info-right-dashed">
                            <div class="coupon-store">农产品商城优惠券</div>
                            <div class="coupon-price">¥100.00<span>优惠券</span></div>
                            <div class="coupon-description">订单满500.00元</div>
                        </div>
                        <div class="coupon-get"><a onclick="getYouhuiquan()">立即领取</a></div>
                    </div>
                    <!-- 效果4 end -->
                    <div class="inner text-center">
                        <h2 class="font--40 mb--0">创建订单</h2>
                    </div>
                    <!-- Checkout Form s-->
                    <form action="createDingdan" method="post" class="checkout-form">
                        <div class="row">
                            <div class="col-lg-7 mb--20">
                                <!-- Billing Address -->
                                <div id="billing-form" class="mb--40">
                                    <h4 class="checkout-title">请填写订单收货信息</h4>

                                    <div class="row">


                                        <div class="col-md-12 col-12 mb--20">
                                            <label>收货地址*</label>
                                            <select name="shraddr" required oninvalid="setCustomValidity('请选择收货地址')" oninput="setCustomValidity('');">
                                                <option value="">请选择收货地址</option>
                                                <c:forEach items="${addresslist}" var="address">
                                                    <option value="${address.addr}&nbsp;&nbsp;${address.name}&nbsp;&nbsp;${address.tel}">${address.addr}&nbsp;&nbsp;${address.name}&nbsp;&nbsp;${address.tel}</option>
                                                </c:forEach>
                                            </select>
                                        </div>



                                    </div>

                                </div>

                                <div class="col-12 mb--60">

                                    <h4 class="checkout-title">支付方式</h4>

                                    <div class="checkout-payment-method">

                                        <div class="single-method">
                                            <input type="radio" id="payment_check" name="fkfs" value="当前支付" checked>
                                            <label for="payment_check">当前支付</label>
                                            <p data-method="check"></p>
                                        </div>

                                        <div class="single-method">
                                            <input type="radio" id="payment_bank" name="fkfs" value="货到支付">
                                            <label for="payment_bank">货到支付</label>
                                            <p data-method="bank"></p>
                                        </div>




                                    </div>
                                    <c:choose>
                                        <c:when test="${fn:length(sessioncartlist) gt 0}">
                                            <button class="place-order">创建订单</button>
                                        </c:when>
                                        <c:otherwise>
                                            <button class="place-order" onclick="location.replace('index')">无订单创建</button>
                                        </c:otherwise>
                                    </c:choose>

                                </div>

                                <!-- Shipping Address -->

                            </div>

                            <div class="col-lg-5">
                                <div class="row">

                                    <!-- Cart Total -->
                                    <div class="col-12 mb--60">

                                        <h4 class="checkout-title">购物车清单</h4>

                                        <div class="checkout-cart-total">

                                            <h4>商品 <span>小计</span></h4>

                                            <ul>
                                                <c:forEach items="${list}" var="cart">
                                                    <li><a href="productDetails?id=${cart.product.id}">${cart.product.productname}</a> X ${cart.num} <span>￥${cart.xjtotal}</span></li>
                                                </c:forEach>
                                            </ul>


                                            <h4>总价 <span>${total}</span></h4>

                                        </div>

                                    </div>

                                    <!-- Payment Method -->


                                </div>
                            </div>

                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <!-- Checkout Page End -->

</div>

<!-- Quick View Modal -->

<!--// Quick View Modal -->
<!-- Start Footer Area -->
<jsp:include page="foot.jsp"></jsp:include>
<!-- End Footer Area -->



<!-- JS
============================================ -->
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
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
<script type="text/javascript">
    function getYouhuiquan(){
        alert("领取成功！");
    }
</script>
</body>
</html>

