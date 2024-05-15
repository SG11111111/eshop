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
                    <h2 class="font--40 mb--0">个人信息</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Breadumb Area -->
<div class="main-wrapper">
    <!-- Start My Account Area -->
    <div class="my-account-area pt--120 pb--90">
        <div class="container">
            <div class="row">
                <div class="ml-auto mr-auto col-lg-12">
                    <div class="checkout-wrapper">
                        <div id="faq" class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h5 class="panel-title">
                                        <span>1</span>
                                        <a data-toggle="collapse" data-parent="#faq" href="#my-account-1">编辑您的帐户信息 </a>
                                    </h5>
                                </div>
                                <form action="memberEdit" method="post">
                                    <input type="hidden" name="id" value="${member.id}">
                                <div id="my-account-1" class="panel-collapse collapse show">
                                    <div class="panel-body">
                                        <div class="billing-information-wrapper">
                                            <div class="account-info-wrapper">
                                                <h4>我的账户信息</h4>
                                                <h5>个人资料</h5>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="billing-info">
                                                        <label>头像</label>
                                                        <input name='filename' type='text' class="layui-input" required   style="width: 380px;" id='url'  size='50' value='${member.filename}' />&nbsp;<input type='button' value='上传'  class="layui-input" onClick="up('url')" style="width: 60px;height: 37px;border:1px solid #cccccc;background: white;border-radius:20px 20px;outline:none;"/>
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info">
                                                        <label>昵称</label>
                                                        <input type="text" name="nickname" placeholder="昵称" value="${member.nickname}" required oninvalid="setCustomValidity('昵称不能为空')" oninput="setCustomValidity('');">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info">
                                                        <label>电话</label>
                                                        <input type="text" name="tel" placeholder="电话" value="${member.tel}" required oninvalid="setCustomValidity('请输入11位数字或非法输入')" oninput="setCustomValidity('');" pattern="[1][3,4,5,7,8][0-9]{9}">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info">
                                                        <label>邮箱</label>
                                                        <input type="email" name="email" placeholder="邮箱" value="${member.email}" required oninvalid="setCustomValidity('格式输入错误')" oninput="setCustomValidity('');">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="billing-back-btn">
                                                <div class="billing-back">
                                                    <a href="#">
                                                        <i class="fa fa-long-arrow-up"></i> 返回</a>
                                                </div>
                                                <div class="billing-btn">
                                                    <button type="submit">提交</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h5 class="panel-title">
                                        <span>2</span>
                                        <a data-toggle="collapse" data-parent="#faq" href="#my-account-2">修改密码 </a>
                                    </h5>
                                </div>
                                <form action="upassEdit" method="post">
                                <div id="my-account-2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="billing-information-wrapper">
                                            <div class="account-info-wrapper">
                                                <h4>修改口令</h4>
                                                <h5>密码</h5>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="billing-info">
                                                        <label>原密码</label>
                                                        <input type="password" name="oldupass" placeholder="原密码" required oninvalid="setCustomValidity('原密码不能为空')" oninput="setCustomValidity('');">
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6">
                                                    <div class="billing-info">
                                                        <label>新密码</label>
                                                        <input type="password" name="newsupass" id="newsupass" placeholder="新密码" required oninvalid="setCustomValidity('密码字母或数字组成长度6位以上')" oninput="setCustomValidity('');" pattern="(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info">
                                                        <label>确认密码</label>
                                                        <input type="password" name="confirmupass" id="confirmupass" placeholder="确认密码" required oninvalid="setCustomValidity('密码字母或数字组成长度6位以上')" oninput="setCustomValidity('');" pattern="(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="billing-back-btn">
                                                <div class="billing-back">
                                                    <a href="#">
                                                        <i class="fa fa-long-arrow-up"></i> 返回</a>
                                                </div>
                                                <div class="billing-btn">
                                                    <button type="submit">提交</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End My Account Area -->
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
    <% String suc = (String)request.getAttribute("suc");if(suc!=null){%>
    layer.msg('${suc}',{
        //skin: 'layer-ext-yourskin',
        //shade: [0.8, '#393D49'] ,// 透明度  颜色
        offset:'rt',
        anim: 2,
        time: 2000, //2s后自动关闭
    });
    <%}%>
    <% String error = (String)request.getAttribute("error");if(error!=null){%>
    layer.msg('${error}',{
        //skin: 'layer-ext-yourskin',
        //shade: [0.8, '#393D49'] ,// 透明度  颜色
        offset:'rt',
        anim: 2,
        time: 2000, //2s后自动关闭
    });
    <%}%>

    $("#confirmupass").blur(function(){
        var confirmupass = $(this).val();
        var newsupass = $("#newsupass").val();
        if(confirmupass!=newsupass){
            layer.msg('确认密码输入错误',{
                //skin: 'layer-ext-yourskin',
                //shade: [0.8, '#393D49'] ,// 透明度  颜色
                offset:'rt',
                anim: 2,
                time: 2000, //2s后自动关闭
            });
            $("#confirmupass").val("");
        }
    })


    function up(tt)
    {
        layer.open({
            type: 2,
            title: '上传文件',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['450px', '200px'],
            content: 'upload.jsp?Result='+tt
        });
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

