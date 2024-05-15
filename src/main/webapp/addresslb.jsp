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

    <style>

         button {
            display: inline-block;
            border: 1px solid #292323;
            font-weight: 700;
            font-size: 14px;
            padding: 10px 35px 9px 35px;
            text-transform: uppercase;
            text-align: center;
            -webkit-transition: all 0.4s ease-in-out 0s;
            -o-transition: all 0.4s ease-in-out 0s;
            transition: all 0.4s ease-in-out 0s;
            background: #292323;
            color: #ffffff;
        }
    </style>

</head>

<body>


<!-- Start Header -->
<jsp:include page="header.jsp"></jsp:include>
<!-- Start Header -->

<!-- Start Search Flyover -->
<!-- End Search Flyover -->
<!-- Start Hamburger -->
<!-- End Hamburger -->

<!-- Start Breadumb Area -->
<div class="breadcumb-area ptb--100 ptb_md--100 ptb_sm--100  bg_image bg_image--3">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="inner text-center">
                    <h2 class="font--40 mb--0">收货地址</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadumb Area -->
<div class="main-wrapper">

    <!-- Cart Page Start -->
    <div class="cart_area pt--120 pb--80 bg-color pt_md--80 pt_sm--80" data-bg-color="#ffffff">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form action="#">
                        <!-- Cart Table -->
                        <div class="cart-table table-responsive mb--40">
                            <div class="single-input" style="margin-bottom: 12px;">
                                <button type="button" class="mr-3" onclick="location.replace('addressadd.jsp')">
                                    <span>新增收货地址</span>
                                </button>
                            </div>
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="pro-title">地址</th>
                                    <th class="pro-price">联系人</th>
                                    <th class="pro-quantity">联系电话</th>
                                    <th class="pro-remove">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageInfo.list}" var="address">
                                <tr>
                                    <td class="pro-title">${address.addr}</td>
                                    <td class="pro-price">${address.name}</td>
                                    <td class="pro-price">${address.tel}</td>
                                    <td class="pro-remove">
                                        <a href="addressDel?id=${address.id}">删除</a>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </form>

                    <div class="row">
                        <div class="col-lg-6 col-12 mb--15">
                            <!-- Calculate Shipping -->
                            <!-- Discount Coupon -->
                        </div>

                        <!-- Cart Summary -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart Page End -->
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

</body>
<script type="text/javascript">
        function cartDel(id){
            $.ajax({
                url:'cartDel?id='+id,
                date:'',
                type:'post',
                success:function(msg){
                    if(msg==1){
                        location.reload();
                    }
                }
            })
        }

</script>

</html>

