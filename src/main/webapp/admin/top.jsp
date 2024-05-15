<%@ page import="com.it.entity.Sysuser" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>后台管理系统</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />

    <!--[if lt IE 9]>
    <![endif]-->
    <!-- / demo -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body class='contrast-red '>
<header>
    <div class='navbar'>
        <div class='navbar-inner'>
            <div class='container-fluid'>
                <a class='brand' href='index.html'>

                    <span class='hidden-phone'>商城模块</span>
                </a>
                <a class='toggle-nav btn pull-left' href='#'>
                    <i class='icon-reorder'></i>
                </a>
                <ul class='nav pull-right'>
                    <li class='dropdown dark user-menu'>
                        <a class='dropdown-toggle' data-toggle='dropdown' href='#'>
                            <img alt='Mila Kunis' height='23' src='assets/images/avatar.jpg' width='23' />
                            <span class='user-name hidden-phone'>${sessionScope.admin.uname}(${sessionScope.admin.utype})</span>
                            <b class='caret'></b>
                        </a>
                        <ul class='dropdown-menu'>
                            <!--
                            <li>
                                <a href='skipToUserInfomation'>
                                    <i class='icon-user'></i>
                                    个人信息
                                </a>
                            </li>
                            -->
                            <li>
                                <a href='userpassword.jsp'>
                                    <i class='icon-cog'></i>
                                    密码修改
                                </a>
                            </li>
                            <li class='divider'></li>
                            <li>
                                <a href='login.jsp'>
                                    <i class='icon-signout'></i>
                                    退出
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </div>
</header>

</body>
</html>