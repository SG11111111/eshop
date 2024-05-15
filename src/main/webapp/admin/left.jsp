<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>后台管理系统</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'/>


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body class='contrast-red '>

<nav class='' id='main-nav'>
    <div class='navigation'>
        <div class='search'>
            <form accept-charset="UTF-8" action="search_results.html" method="get"/>
            <div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;"/></div>
            <div class='search-wrapper'>
                <input autocomplete="off" class="search-query" id="q" name="q" placeholder="Search..." type="text"
                       value=""/>
                <button class="btn btn-link icon-search" name="button" type="submit"></button>
            </div>
            </form>
        </div>
        <ul class='nav nav-stacked'>
            <li class='active'>
                <a href='index'>
                    <i class='icon-home'></i>
                    <span>首页</span>
                </a>
            </li>
            <li class=''>
                <a class='dropdown-collapse in' href='#'>
                    <i class='icon-th'></i>
                    <span>业务管理</span>
                    <i class='icon-angle-down angle-down'></i>
                </a>
                <ul class='nav nav-stacked in'>
<%--                    <c:if test="${sessionScope.admin.utype eq '管理员'}">--%>
                        <li class=''>

                        </li>
                        <%--<li class=''>
                            <a href='memberList'>
                                <i class='icon-caret-right'></i>
                                <span>会员管理</span>
                            </a>
                        </li>
                        <li class=''>
                            <a href='userList'>
                                <i class='icon-caret-right'></i>
                                <span>管理员管理</span>
                            </a>
                        </li>--%>
                        <li class=''>
                            <a href='categoryList'>
                                <i class='icon-caret-right'></i>
                                <span>类别管理</span>
                            </a>
                        </li>
<%--                    </c:if>--%>

<%--                    <c:if test="${sessionScope.admin.utype eq '商品管理员' or sessionScope.admin.utype eq '仓库管理员'}">--%>
                        <li class=''>
                            <a href='warehouseList'>
                                <i class='icon-caret-right'></i>
                                <span>仓库管理</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='productList'>
                                <i class='icon-caret-right'></i>
                                <span>商品管理</span>
                            </a>
                        </li>
<%--                    </c:if>--%>

<%--                    <c:if test="${sessionScope.admin.utype eq '订单管理员'}">--%>
                        <li class=''>
                            <a href='dingdanList'>
                                <i class='icon-caret-right'></i>
                                <span>订单管理</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='backproductList'>
                                <i class='icon-caret-right'></i>
                                <span>退货管理</span>
                            </a>
                        </li>
<%--                    </c:if>--%>

<%--                    <c:if test="${sessionScope.admin.utype eq '管理员'}">--%>
                        <li class=''>
                            <a href='commentList'>
                                <i class='icon-caret-right'></i>
                                <span>评价管理</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='msgList'>

                            </a>
                        </li>


<%--                    </c:if>--%>

                </ul>
            </li>


<%--            <c:if test="${sessionScope.admin.utype eq '管理员'}">--%>

                <li>
                    <a class='dropdown-collapse in' href='#'>
                        <i class='icon-cog'></i>
                        <span>统计分析</span>
                        <i class='icon-angle-down angle-down'></i>
                    </a>
                    <ul class='nav nav-stacked in'>
                        <li class=''>
                            <a href='saleMoney'>
                                <i class='icon-caret-right'></i>
                                <span>销售额统计</span>
                            </a>
                        </li>

                        <li class=''>
                            <a href='statisticsNum'>
                                <i class='icon-caret-right'></i>
                                <span>销量统计</span>
                            </a>
                        </li>

                    </ul>
                </li>


                <%--<li>
                    <a class='dropdown-collapse in' href='#'>
                        <i class='icon-cog'></i>
                        <span>系统设置</span>
                        <i class='icon-angle-down angle-down'></i>
                    </a>
                    <ul class='nav nav-stacked in'>
                        <li class=''>
                            <a href='imgadvList'>
                                <i class='icon-caret-right'></i>
                                <span>滚动图片</span>
                            </a>
                        </li>
                    </ul>
                </li>--%>
<%--            </c:if>--%>

        </ul>
    </div>
</nav>


</body>
</html>