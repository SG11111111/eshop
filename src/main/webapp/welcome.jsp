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
<jsp:include page="top.jsp"></jsp:include>
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

<!-- Start Banner Area -->
<div class="slider-activation">
    <!-- Start Single Slide -->
            <c:forEach items="${imgadvlist}" var="imgadv" varStatus="status" >
                    <div class="slider-area ptb--150  fullscreen d-flex align-items-center" style="background-image: url('upfile/${imgadv.filename}');background-repeat:no-repeat;background-size: 100% 800px; ">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-4 offset-xl-8 col-lg-6 offset-lg-6">
                                    <div class="slide-content">
                                        <p></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </c:forEach>


    <!-- End Single Slide -->
    <!-- Start Single Slide -->

    <!-- End Single Slide -->
</div>

<!-- End Banner Area -->

<div class="main-wrapper" style="border:0px solid red;margin: 0px;">
    <!-- Start Banner Area -->
    <div class="banner-area">
        <div class="row row--0">
            <!-- Start Single Banner -->

            <!-- End Single Banner -->

            <!-- Start Single Banner -->

            <!-- End Single Banner -->

            <!-- Start Single Banner -->

            <!-- End Single Banner -->

        </div>
    </div>
    <!-- End Banner Area -->

    <!-- Start Product Area -->
    <%--<div class="feature-product-area bg-color pt--90 pt_md--80 pt_sm--80 pb--100 pb_md--80 pb_sm--80" data-bg-color="#fff">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center">
                        <h2 class="title">推荐商品</h2>
                        <img src="assets/images/logo/shape.png" alt="Shape Images">
                    </div>
                </div>
            </div>
            <div class="row mt--20">

                <!-- Start Single Product -->
                <c:forEach items="${tjproductlist}" var="tjproduct">
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 mt--30">
                    <div class="product">
                        <div class="inner">
                            <div class="thumbnail">
                                <a href="productDetails?id=${tjproduct.id}">
                                    <img src="upfile/${tjproduct.filename}" alt="Product Images">
                                </a>
                            </div>
                            <div class="product-hover-action">
                                <div class="hover-inner">
                                    <a href="javascript:void(0)" onclick="addCart('${tjproduct.id}',1)"><i class="fa fa-cart-plus"></i></a>
                                    <a href="javascript:void(0)" onclick="favAdd('${tjproduct.id}')"><i class="fa fa-heart-o"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="content">
                            <h2><a href="productDetails?id=${tjproduct.id}">${tjproduct.productname}</a></h2>
                            <c:choose>
                                <c:when test="${tjproduct.tjprice ne null and tjproduct.tjprice gt 0}">
                                    <s style="color:dimgray;font-weight: bolder"><span class="prize" style="font-weight:bolder;color:gray">￥${tjproduct.price}</span></s>
                                    <span class="prize" style="font-weight:bolder">${tjproduct.tjprice}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="prize" style="font-weight:bolder">￥${tjproduct.price}</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- End Single Product -->

                <!-- Start Single Product -->

                <!-- End Single Product -->

                <!-- Start Single Product -->

                <!-- End Single Product -->

                <!-- Start Single Product -->

                <!-- End Single Product -->

            </div>
        </div>
    </div>--%>
    <!-- End Product Area -->

    <!-- Start Countdown Area -->

    <!-- End Countdown Area -->

    <!-- Start Product Feature Tab -->
   <%-- <div class="product-sale-area pt--100 pt_md--80 pt_sm--80 bg-color" data-bg-color="#ffffff" style="margin-bottom: 20px;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Start Product Tab -->
                    <ul class="nav nav-tabs onsale-tab" id="myTab" role="tablist">
                        <c:forEach items="${fcategorylist}" var="fcategory" varStatus="status">
                        <li class="nav-item">
                            <a class="nav-link ${status.count==1?"active":""}" id="${fcategory.id}-tab" data-toggle="tab" href="#${fcategory.id}" role="tab" aria-controls="${fcategory.id}" aria-selected="true">${fcategory.name}</a>
                        </li>
                        </c:forEach>
                    </ul>
                    <!-- End Product Tab -->
                </div>
            </div>
            <div class="row mt--30">
                <div class="col-lg-12">
                    <div class="tab-content" id="myTabContent">
                        <!--s-->
                        <c:forEach items="${fcategorylist}" var="fcategory" varStatus="fstatus">
                        <div class="tab-pane fade show ${fstatus.count==1?"active":""}" id="${fcategory.id}" role="tabpanel" aria-labelledby="${fcategory.id}-tab">
                            <div class="row">

                            <c:forEach items="${fcategory.fproduct}" var="fproduct" varStatus="sstatus" begin="0" end="3">
                                <div class="col-lg-3 col-md-6 col-sm-6 col-12 mt--30">
                                    <div class="product">
                                        <div class="inner">
                                            <div class="thumbnail">
                                                <a href="productDetails?id=${fproduct.id}">
                                                    <img src="upfile/${fproduct.filename}" alt="Product Images">
                                                </a>
                                            </div>
                                            <div class="product-hover-action">
                                                <div class="hover-inner">
                                                    <a href="javascript:void(0)" onclick="addCart('${fproduct.id}',1)"><i class="fa fa-cart-plus"></i></a>
                                                    <a href="javascript:void(0)" onclick="favAdd('${fproduct.id}')"><i class="fa fa-heart-o"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="content">
                                            <h2><a href="productDetails?id=${fproduct.id}">${fproduct.productname}</a></h2>
                                            <c:choose>
                                                <c:when test="${fproduct.tjprice ne null and fproduct.tjprice gt 0}">
                                                    <s style="color:dimgray;font-weight: bolder"><span class="prize" style="font-weight:bolder;color:gray">￥${fproduct.price}</span></s>
                                                    <span class="prize" style="font-weight:bolder">${fproduct.tjprice}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="prize" style="font-weight:bolder">￥${fproduct.price}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                                <!-- End Single Product -->

                                <!-- Start Single Product -->
                                <!-- End Single Product -->

                                <!-- Start Single Product -->
                                <!-- End Single Product -->

                            </div>
                        </div>
                        </c:forEach>
<!--e-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Product Feature Tab -->

    <!-- Start Recent Selling Area -->

    <!-- End Recent Selling Area -->

    <!-- Start Brand Area -->

    <!-- End Brand Area -->

</div>--%>

<!-- Quick View Modal -->

<!--// Quick View Modal -->
<!-- Start Footer Area -->
<jsp:include page="foot.jsp"></jsp:include>
<!-- End Footer Area -->















<!-- JS
============================================ -->
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
<script type="text/javascript">
    function addCart(productid,num){
        layer.load(0, {shade: false});
        $.ajax({
            url:'addCart?productid='+productid+"&num="+num,
            date:'',
            type:'post',
            success:function(msg){
                if(msg==0){
                    location.replace("login.jsp")
                }else if(msg==1){
                    layer.msg('已成功添加到购物车',{
                        //skin: 'layer-ext-yourskin',
                        //shade: [0.8, '#393D49'] ,// 透明度  颜色
                        offset:'rt',
                        anim: 2,
                        time: 2000, //2s后自动关闭
                    });
                    setTimeout(function(){
                        window.location.reload();//刷新当前页面.
                    },2000)
                }else{
                    layer.msg('操作成功', {
                        //skin: 'layer-ext-yourskin',
                        //shade: [0.8, '#393D49'] ,// 透明度  颜色
                        offset:'rt',
                        anim: 2,
                        time: 2000, //2s后自动关闭
                    });
                    setTimeout(function(){
                        window.location.reload();//刷新当前页面.
                    },2000)
                }
            }
        })
    }


    function favAdd(productid){
        layer.load(0, {shade: false});
        $.ajax({
            url:'favAdd?productid='+productid,
            date:'',
            type:'post',
            success:function(msg) {
                if (msg == 0) {
                    location.replace("login.jsp")
                } else if(msg == 1){
                    layer.msg('已添加至收藏', {
                        //skin: 'layer-ext-yourskin',
                        //shade: [0.8, '#393D49'] ,// 透明度  颜色
                        offset:'rt',
                        anim: 2,
                        time: 2000, //2s后自动关闭
                    });
                    setTimeout(function(){
                        window.location.reload();//刷新当前页面.
                    },2000)
                }else{
                    layer.msg('不能重复操作', {
                        //skin: 'layer-ext-yourskin',
                        //shade: [0.8, '#393D49'] ,// 透明度  颜色
                        offset:'rt',
                        anim: 2,
                        time: 2000, //2s后自动关闭
                    });
                    setTimeout(function(){
                        window.location.reload();//刷新当前页面.
                    },2000)
                }
            }
        })
    }
</script>
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

