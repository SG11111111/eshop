<%@ page import="com.it.entity.Sysuser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("admin");
%>
<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <title></title>
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link rel="stylesheet" href="/onlineshop/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/onlineshop/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/onlineshop/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/onlineshop/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="/onlineshop/admin/css/pages/login.css">

</head>

<body> 

<!--====================================================
                        PAGE CONTENT
======================================================--> 
      <section class="hero-area">
        <div class="overlay"></div>
        <div class="container">
          <div class="row">
            <div class="col-md-12 ">
                <div class="contact-h-cont">
                  <h3 class="text-center">
                      农特产品商城
                     <!-- <img src="img/logo.png" class="img-fluid" alt="">-->
                  </h3><br>
                  <form action="login" method="post">
                    <div class="form-group">
                      <label for="uname">用户名</label>
                      <input type="text" class="form-control" name="uname" id="uname" placeholder="用户名" required oninvalid="setCustomValidity('用户名不能为空')" oninput="setCustomValidity('');">
                    </div>  
                    <div class="form-group">
                      <label >密码</label>
                      <input class="form-control" type="password" name="upass"  placeholder="密码" id="example-password-input" required oninvalid="setCustomValidity('密码不能为空')" oninput="setCustomValidity('');">
                    </div>   
                    <button class="btn btn-general btn-blue" role="button"><i fa fa-right-arrow></i>登录</button>
                  </form>
                </div>
            </div>
          </div>  
        </div>
      </section>
      
    <!--Global Javascript -->
<script src="/onlineshop/layer/jquery-2.0.3.min.js"></script>
<script src="/onlineshop/layer/layer.js"></script>
<script src="/onlineshop/admin/js/jquery.min.js"></script>
<script src="/onlineshop/admin/js/tether.min.js"></script>
<script src="/onlineshop/admin/js/bootstrap.min.js"></script>
</body>

<script type="text/javascript">
    <%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>

    layer.msg("用户名或密码错误");

    <%}%>
</script>
</html>