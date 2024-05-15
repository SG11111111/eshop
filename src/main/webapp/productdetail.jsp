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
                    <h2 class="font--40 mb--0">商品详情</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadumb Area -->

<div class="main-wrapper">
    <!-- Start Single Product -->
    <div class="brook-single-product plr--160 plr_lg--100 plr_md--50 plr_sm--50">
        <div class="single-product-wrapper ptb--120">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                    <div class="single-product-left-side">
                        <div class="product__details__container">
                            <div class="tab_container big_img_container">
                                <div class="big_img tab-pane fade show active" id="img1" role="tabpanel">
                                    <img class="w-100" src="upfile/${product.filename}" alt="gomes restaurant">
                                </div>
                                <div class="big_img tab-pane fade" id="img2" role="tabpanel">
                                    <img class="w-100" src="assets/images/product/2.jpg" alt="gomes restaurant">
                                </div>
                                <div class="big_img tab-pane fade" id="img3" role="tabpanel">
                                    <img class="w-100" src="assets/images/product/3.jpg" alt="gomes restaurant">
                                </div>
                                <div class="big_img tab-pane fade" id="img4" role="tabpanel">
                                    <img class="w-100" src="assets/images/product/4.jpg" alt="gomes restaurant">
                                </div>
                                <div class="big_img tab-pane fade" id="img5" role="tabpanel">
                                    <img class="w-100" src="assets/images/product/5.jpg" alt="gomes restaurant">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-12 mt_sm--40">
                    <div class="single-product-details-side">
                        <div class="product-details">
                            <div class="inner">
                                <div class="header">
                                    <div class="product-badges">
                                        <span>热卖</span>
                                    </div>
                                    <h4 class="heading heading-h4">${product.productname}</h4>
                                </div>

                                <div class="price" style="border:0px;">
                                    <p class="theme-color">
                                        <c:choose>
                                            <c:when test="${product.tjprice ne null and product.tjprice gt 0}">
                                                <s style="color:dimgray;font-weight: bolder"><span class="prize" style="font-weight:bolder;color:gray">￥${product.price}</span></s>
                                                <span class="prize" style="font-weight:bolder">${product.tjprice}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="prize" style="font-weight:bolder">￥${product.price}</span>
                                            </c:otherwise>
                                        </c:choose>

                                    </p>
                                </div>


                                <div class="quenty-container">
                                    <div class="quenty-button">
                                        <h6 class="heading heading-h6">数量</h6>
                                        <input type="number" class="input-text qty text" step="1" min="1" id="quantity" name="quantity" value="1" title="Qty" size="4">
                                    </div>

                                    <div class="product-action">
                                        <a class="addtocart" href="javascript:void(0)" onclick="addCart('${product.id}',1)"><i class="fa fa-cart-arrow-down"></i><span>添加到购物车</span></a>
                                        <a class="wislist" href="javascript:void(0)" onclick="favAdd('${product.id}')" title="收藏">收藏</a>
                                    </div>
                                </div>

                                <div class="product-meta">
                                    <div class="meta-item">
                                        <h6 class="heading heading-h6">分类:</h6>
                                        <div class="item-list">
                                            <a href="#">${product.fcategory.name}</a>
                                            <a href="#">${product.scategory.name}</a>
                                        </div>
                                    </div>
                                    <!--
                                    <div class="meta-item">
                                        <h6 class="heading heading-h6">TAG:</h6>
                                        <div class="item-list">
                                            <a href="#">standard,</a>
                                            <a href="#">business,</a>
                                            <a href="#">multipurpose,</a>
                                            <a href="#">createtive,</a>
                                            <a href="#">clean,</a>
                                            <a href="#">themplate,</a>
                                            <a href="#">theme,</a>
                                        </div>
                                    </div>

                                    -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Single Product -->

    <!-- Start Product Review -->
    <div class="product_review pb--80 pb_md--80 pb_sm--60">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="description_nav nav nav-tabs d-block" role="tablist">
                        <a class="active" id="descrip-tab" data-toggle="tab" href="#descrip" role="tab" aria-controls="descrip" aria-selected="true">描述</a>
                        <a id="nav-review" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">评论</a>
                    </div>
                </div>
            </div>
            <div class="tab_container">
                <div class="single_review_content tab-pane fade show active" id="descrip" role="tabpanel">
                    <div class="content">
                        <p>${product.content} </p>
                    </div>
                </div>
                <div class="single_review_content tab-pane fade" id="review" role="tabpanel" style="border:0px solid red;">
                    <div class="single_review_content tab-pane fade show active"  role="tabpanel">

                        <c:forEach items="${commentlist}" var="comment">
                        <div class="content" style="border:0px solid orange;margin-bottom: 20px;">
                            <div style="float: left;border:0px solid red;width: 98%">
                                <div style="float:left;border:0px solid orange;padding-top: 10px;">
                                    <img src="upfile/${comment.member.filename}"  style="width: 70px;height: 70px;border-radius: 100px 100px;">
                                </div>
                                <div style="float: left;border:0px solid orange;width: 84%;padding-left: 10px;">
                                    <ul class="rating" style="margin-bottom: 5px;">
                                        <c:forEach begin="0" end="${comment.pf-1}">
                                        <li><i class="fa fa-star"></i></li>
                                        </c:forEach>
                                    </ul>
                                    <p>${comment.content}</p>
                                </div>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        </c:forEach>

                    </div>
                    <div class="classs__review__inner">
                        <h4>请在下方评论</h4>
                        <form action="commentAdd" method="post" name="commentForm">
                            <input type="hidden" name="productid" value="${product.id}">
                            <div class="input__box">
                                <span>五星 *</span>
                                <div >
                                    <div  style="float: left;margin-right: 20px;">
                                        <input type="radio"  name="pf" value="5" checked style="width: 13px;height: 13px;float: left;display: block; margin-top: 12px;margin-right: 10px;">
                                        <ul class="rating" style="">
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>

                                    <div class="single-method" style="float: left;margin-right: 20px;">
                                        <input type="radio"  name="pf" value="4"  style="width: 13px;height: 13px;float: left;display: block; margin-top: 12px;margin-right: 10px;">
                                            <ul class="rating">
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                    </div>

                                    <div class="single-method" style="float: left;margin-right: 20px;">
                                        <input type="radio"  name="pf" value="3"  style="width: 13px;height: 13px;float: left;display: block; margin-top: 12px;margin-right: 10px;">
                                        <ul class="rating">
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>

                                    <div class="single-method" style="float: left;margin-right: 20px;">
                                        <input type="radio"  name="pf" value="2"  style="width: 13px;height: 13px;float: left;display: block; margin-top: 12px;margin-right: 10px;">
                                        <ul class="rating">
                                            <li><i class="fa fa-star"></i></li>
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>

                                    <div class="single-method" style="float: left;margin-right: 20px;">
                                        <input type="radio"  name="pf" value="1"  style="width: 13px;height: 13px;float: left;display: block; margin-top: 12px;margin-right: 10px;">
                                        <ul class="rating">
                                            <li><i class="fa fa-star"></i></li>
                                        </ul>
                                    </div>



                                    <div style="clear: both"></div>
                                </div>
                            </div>
                            <div class="input__box">
                                <span>评论内容 *</span>
                                <textarea name="content" placeholder="内容" required oninvalid="setCustomValidity('评论内容不能为空')" oninput="setCustomValidity('');"></textarea>
                            </div>
                            <div class="submit__btn2 mt--30">
                                <button class="product-btn" >提交评论</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Product Review -->
    <!-- Start Product Area -->
    <div class="feature-product-area bg-color pb--120 pb_md--80 pb_sm--80" data-bg-color="#fff">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center">
                        <h2 class="title">相关商品</h2>
                        <img src="assets/images/logo/shape.png" alt="Shape Images">
                    </div>
                </div>
            </div>
            <div class="row mt--20">
                <!-- Start Single Product -->
                <c:forEach items="${xglist}" var="xgproduct">
                <div class="col-lg-3 col-md-6 col-sm-6 col-12 mt--30">
                    <div class="product">
                        <div class="inner">
                            <div class="thumbnail">
                                <a href="productDetails?id=${xgproduct.id}">
                                    <img src="upfile/${xgproduct.filename}" alt="Product Images">
                                </a>
                            </div>
                            <div class="product-hover-action">
                                <div class="hover-inner">
                                    <a href="javascript:void(0)" onclick="addCart('${xgproduct.id}','1')"><i class="fa fa-cart-plus"></i></a>
                                    <a href="javascript:void(0)" onclick="favAdd('${xgproduct.id}')"><i class="fa fa-heart-o"></i></a>

                                </div>
                            </div>
                        </div>
                        <div class="content">
                            <h2><a href="productDetails?id=${xgproduct.id}">${xgproduct.productname}</a></h2>
                            <c:choose>
                                <c:when test="${xgproduct.tjprice ne null and xgproduct.tjprice gt 0}">
                                    <s style="color:dimgray;font-weight: bolder"><span class="prize" style="font-weight:bolder;color:gray">￥${xgproduct.price}</span></s>
                                    <span class="prize" style="font-weight:bolder">${xgproduct.tjprice}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="prize" style="font-weight:bolder">￥${xgproduct.price}</span>
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
    </div>
    <!-- End Product Area -->

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
        var quantity = $("#quantity").val();
        num=quantity;
        $.ajax({
            url:'addCart?productid='+productid+"&num="+num,
            date:'',
            type:'post',
            success:function(msg){
                if(msg==0){
                    location.replace("login.jsp")
                }else if(msg==1){
                    layer.msg('已成功添加到购物车', {
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

    <% String suc = (String) request.getAttribute("suc");if(suc!=null){%>
    layer.msg('${suc}', {
        //skin: 'layer-ext-yourskin',
        //shade: [0.8, '#393D49'] ,// 透明度  颜色
        offset:'rt',
        anim: 2,
        time: 2000, //2s后自动关闭
    });
    <%}%>

    <% String error = (String) request.getAttribute("error");if(error!=null){%>
    layer.msg('${error}', {
        //skin: 'layer-ext-yourskin',
        //shade: [0.8, '#393D49'] ,// 透明度  颜色
        offset:'rt',
        anim: 2,
        time: 2000, //2s后自动关闭
    });
    <%}%>
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

