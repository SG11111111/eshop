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
<!-- End Hamburger -->
<!-- Start Breadumb Area -->
<div class="breadcumb-area ptb--100 ptb_md--100 ptb_sm--100  bg_image bg_image--3">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="inner text-center">
                    <h2 class="font--40 mb--0">特价商品</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadumb Area -->
<div class="main-wrapper">

    <!-- Start Shop Area -->
    <div class="shop-area bg-color ptb--120 ptb_md--80 ptb_sm--80" data-bg-color="#ffffff">
        <div class="container">
            <div class="row">
                <div class="order-2 order-lg-1 col-lg-4 mt_md--60 mt_sm--60">
                    <!-- Start Sidebar Area -->
                    <div class="shop-sidebar-container">
                        <div class="shop-sidebar-wrapper">
                            <!-- Start Single Widget -->
                            <div class="shop-sidebar search">
                                <h5 class="widget-title">搜索</h5>
                                <form class="inner" action="tjproductLb" method="post">
                                    <div class="search-box">
                                        <input type="text" name="key" value="${key}" placeholder="商品名称…">
                                        <button><span class="fa fa-search"></span></button>
                                    </div>
                                </form>
                            </div>
                            <!-- End Single Widget -->

                            <!-- Start Single Widget -->
                            <div class="shop-sidebar related-product-inner mt--50">
                                <h5 class="widget-title">热销商品</h5>
                                <ul class="related-product">
                                    <!-- Start Single Product -->
                                    <c:forEach items="${phlist}" var="phproduct" begin="0" end="3">
                                    <li>
                                        <div class="product-item">
                                            <div class="thumbnail">
                                                <a href="productDetails?id=${phproduct.product.id}">
                                                    <img src="upfile/${phproduct.product.filename}" alt="multi-purpose">
                                                </a>
                                            </div>
                                            <div class="info">
                                                <h5 class="heading heading-h5"><a href="productDetails?id=${phproduct.product.id}">${phproduct.product.productname}</a></h5>
                                                <ul class="rating">
                                                </ul>
                                                <div class="price">
                                                    <c:choose>
                                                        <c:when test="${phproduct.product.tjprice ne null and phproduct.product.tjprice gt 0}">
                                                            <span class="prize" style="font-weight:bolder;color:gray"><s style="color:dimgray;font-weight: bolder">￥${phproduct.product.price}</s></span>
                                                            <span class="prize" style="font-weight:bolder;color:red">${phproduct.product.tjprice}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="prize" style="font-weight:bolder;color:red">￥${phproduct.product.price}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    </c:forEach>
                                    <!-- End Single Product -->

                                    <!-- Start Single Product -->
                                    <!-- End Single Product -->

                                    <!-- Start Single Product -->
                                    <!-- End Single Product -->

                                    <!-- Start Single Product -->
                                    <!-- End Single Product -->

                                    <!-- Start Single Product -->
                                    <!-- End Single Product -->
                                </ul>
                            </div>
                            <!-- End Single Widget -->

                            <!-- Start Single Widget -->
                            <div class="shop-sidebar related-product-inner mt--50">
                                <h5 class="widget-title">价格区间</h5>

                                <div class="content-shopby">
                                    <div class="price_filter s-filter clear">
                                        <form action="#" method="post" name="pricesearch">
                                            <div id="slider-range"></div>
                                            <div class="slider__range--output">
                                                <div class="price__output--wrap">
                                                    <div class="price--output">
                                                        <span>价格 :</span><input type="text" id="amount" readonly>
                                                    </div>

                                                    <input type="hidden" id="minprice" name="minprice" value="${minprice}" >
                                                    <input type="hidden" id="maxprice" name="maxprice" value="${maxprice}">
                                                    <input type="hidden"  id="fid" name="fid" value="${fid}" >
                                                    <input type="hidden" id="sid"  name="sid" value="${sid}" >
                                                    <div class="price--filter">
                                                        <a href="javascript:void(0)" onclick="priceSearch()">筛选</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Widget -->


                            <!-- Start Single Widget -->
                            <!-- End Single Widget -->

                            <!-- End Single Widget -->
                            <!-- Start Single Widget -->
                            <!-- End Single Widget -->

                        </div>
                    </div>
                    <!-- End Sidebar Area -->
                </div>
                <div class="order-1 order-lg-2 col-lg-8">
                    <div class="archive-shop-actions mb--30">
                        <div class="row align-items-center">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="archive-shop-inner text-center text-sm-left">
                                    <p class="bk_pra">特价商品</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-12">
                                <div class="archive-shop-inner text-center text-sm-right mt_mobile--20">
                                    <!--
                                    <select>
                                        <option>Sort by popularity</option>
                                        <option>Sort by average rating</option>
                                        <option>Sort by price: low to high</option>
                                        <option>Sort by price: high to low</option>
                                    </select>
                                    -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Start Shop Minimal Product -->
                    <div class="shop-minimal-product">
                        <div class="row row--25">

                            <!-- Start Single Product -->
                            <c:forEach items="${pageInfo.list}" var="product">
                            <div class="col-lg-4 col-md-6 col-sm-6 col-12 mt--60">
                                <div class="product">
                                    <div class="inner">
                                        <div class="thumbnail">
                                            <a href="productDetails?id=${product.id}">
                                                <img src="upfile/${product.filename}" alt="Product Images">
                                            </a>
                                        </div>
                                        <div class="product-hover-action">
                                            <div class="hover-inner">
                                                <a href="javascript:void(0)" onclick="addCart('${product.id}',1)"><i class="fa fa-cart-plus"></i></a>
                                                <a href="javascript:void(0)" onclick="favAdd('${product.id}')"><i class="fa fa-heart-o"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="content">
                                        <h2><a href="productDetails?id=${product.id}">${product.productname}</a></h2>
                                        <c:choose>
                                            <c:when test="${product.tjprice ne null and product.tjprice gt 0}">
                                                <s style="color:dimgray;font-weight: bolder"><span class="prize" style="font-weight:bolder;color:gray">￥${product.price}</span></s>
                                                <span class="prize" style="font-weight:bolder">${product.tjprice}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="prize" style="font-weight:bolder">￥${product.price}</span>
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

                            <!-- Start Pagenation Area -->
                            <div class="col-lg-12">
                                当前 <span>${pageInfo.pageNum}</span> 页,总 <span>${pageInfo.pages}</span> 页,共 <span>${pageInfo.total}</span> 条记录
                                <a href="tjproductLb?pageNum=1&key=${key}&fid=${fid}&sid=${sid}&minprice=${minprice}&maxprice=${maxprice}">首页</a>
                                <a href="tjproductLb?pageNum=${pageInfo.hasPreviousPage==false?1:pageInfo.prePage}&key=${key}&fid=${fid}&sid=${sid}&minprice=${minprice}&maxprice=${maxprice}">上一页</a>
                                <a href="tjproductLb?pageNum=${pageInfo.hasNextPage==false?pageInfo.pages:pageInfo.nextPage}&key=${key}&fid=${fid}&sid=${sid}&minprice=${minprice}&maxprice=${maxprice}">下一页</a>
                                <a href="tjproductLb?pageNum=${pageInfo.pages}&key=${key}&fid=${fid}&sid=${sid}&minprice=${minprice}&maxprice=${maxprice}">尾页</a>
                            </div>
                            <!-- End Pagenation Area -->

                        </div>
                    </div>
                    <!-- End Shop Minimal Product -->
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Area -->
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


    function priceSearch(){
        var minprice = $("#minprice").val();
        var maxprice = $("#maxprice").val();

        var fid = $("#fid").val();
        var sid = $("#sid").val();
        location.replace('tjproductLb?minprice='+minprice+"&maxprice="+maxprice+"&fid="+fid+"&sid="+sid);
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

