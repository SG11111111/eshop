<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home</title>
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->


    <!-- CSS
	============================================ -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- Bootstrap CSS -->


    <!-- Vendor & Plugins CSS (Please remove the comment from below vendor.min.css & plugins.min.css for better website load performance and remove css files from avobe) -->
    <!--
    <script src="assets/js/vendor/vendor.min.js"></script>
    <script src="assets/js/plugins/plugins.min.js"></script>
    -->

    <!-- Main Style CSS (Please use minify version for better website load performance) -->
    <!--<link rel="stylesheet" href="assets/css/style.min.css">-->

</head>

<body>
<!-- Start Header -->

<!-- Start Header -->
<!-- Start Search Flyover -->
<div class="search-flyoveray"></div>
<div class="cart-flyout">
    <div class="cart-flyout-inner">
        <a class="btn-close-cart" href="#">
            <i class="fa fa-times"></i>
        </a>
        <div class="cart-flyout__content">
            <div class="cart-flyout__heading">购物车</div>
            <div class="widget_shopping_cart_content">
                <ul class="product_list_widget">

                    <c:forEach items="${sessioncartlist}" var="cart">
                    <li>
                        <div class="thumb">
                            <img src="upfile/${cart.product.filename}" alt="product">
                        </div>
                        <div class="content">
                            <h6><a href="single-product.html">${cart.product.productname}</a></h6>
                            <div class="quntity">${cart.num} ×
                              <c:choose>
                                  <c:when test="${cart.product.tjprice ne null and cart.product.tjprice gt 0}">
                                      ￥${cart.product.tjprice}
                                  </c:when>
                                  <c:otherwise>
                                      ￥${cart.product.price}
                                  </c:otherwise>
                              </c:choose>
                            </div>
                            <button class="remove-btn" onclick="cartDel('${cart.id}')">×</button>
                        </div>
                    </li>
                    </c:forEach>




                </ul>
            </div>
            <p class="minicart__total">合计: <span class="price">${total}</span></p>
            <div class="cart__btn">
                <a href="cartList">查看购物车</a>

                <c:choose>
                    <c:when test="${fn:length(sessioncartlist) gt 0}">
                        <a href="javascript:void(0)" onclick="location.replace('checkOut')">结算</a>
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<!-- End Search Flyover -->
<!-- Start Hamburger -->
<!-- End Hamburger -->

<!-- Start Banner Area -->

<!-- End Banner Area -->


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
<script src="assets/js/main.js"></script>
</html>

