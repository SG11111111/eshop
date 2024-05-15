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
<!-- End Search Flyover -->
<!-- Start Hamburger -->
<!-- End Hamburger -->

<!-- Start Breadumb Area -->
<div class="breadcumb-area ptb--100 ptb_md--100 ptb_sm--100  bg_image bg_image--3">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="inner text-center">
                    <h2 class="font--40 mb--0">订单详情</h2>
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
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="pro-title">图片</th>
                                    <th class="pro-title">商品</th>
                                    <th class="pro-price">价格</th>
                                    <th class="pro-quantity">数量</th>
                                    <th class="pro-subtotal">小计</th>
                                    <th class="pro-subtotal">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${list}" var="dingdanmsg">
                                <tr>
                                    <td class="pro-thumbnail"><a href="productDetails?id=${dingdanmsg.product.id}"><img src="upfile/${dingdanmsg.product.filename}" alt="Product"></a></td>
                                    <td class="pro-title"><a href="productDetails?id=${dingdanmsg.product.id}">${dingdanmsg.product.productname}</a></td>
                                    <td class="pro-price">
                                        <span>
                                        <c:choose>
                                            <c:when test="${dingdanmsg.product.tjprice ne null and dingdanmsg.product.tjprice gt 0}">
                                                <s style="color:dimgray;">￥${dingdanmsg.product.price}</s>
                                                ${dingdanmsg.product.tjprice}
                                            </c:when>
                                            <c:otherwise>
                                                ￥${dingdanmsg.product.price}
                                            </c:otherwise>
                                        </c:choose>
                                        </span>
                                    </td>
                                    <td class="pro-price">${dingdanmsg.num}</td>
                                    <td class="pro-price">${dingdanmsg.xjtotal}</td>
                                    <td class="pro-price">
                                        <c:if test="${dingdanmsg.thstatus eq '可退货'}">
                                            <a href="skipBackproduct?orderid=${dingdanmsg.id}">申请退货</a>
                                        </c:if>

                                        <c:if test="${dingdanmsg.thstatus eq '已提交退货申请'}">
                                            已提交退货申请
                                        </c:if>

                                        <c:if test="${dingdanmsg.thstatus eq '已退货'}">
                                            已退货
                                        </c:if>

                                        <c:if test="${dingdanmsg.thstatus eq '拒绝退货'}">
                                            拒绝退货
                                        </c:if>
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

