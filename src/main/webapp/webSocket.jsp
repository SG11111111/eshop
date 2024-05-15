<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/plugins/plugins.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <title>聊天页面</title>
    <style>
        /* bubble style */
        .sender {
            clear: both;
        }

        .sender div:nth-of-type(1) {
            float: left;
        }

        .sender div:nth-of-type(2) {
            background-color: aquamarine;
            float: left;
            margin: 0 20px 10px 15px;
            padding: 10px 10px 10px 0px;
            border-radius: 7px;
        }

        .receiver div:first-child img,
        .sender div:first-child img {
            width: 50px;
            height: 50px;
        }

        .receiver {
            clear: both;
        }

        .receiver div:nth-child(1) {
            float: right;
        }

        .receiver div:nth-of-type(2) {
            float: right;
            background-color: gold;
            margin: 0 10px 10px 20px;
            padding: 10px 0px 10px 10px;
            border-radius: 7px;
        }

        .left_triangle {
            height: 0px;
            width: 0px;
            border-width: 8px;
            border-style: solid;
            border-color: transparent aquamarine transparent transparent;
            position: relative;
            left: -16px;
            top: 3px;
        }

        .right_triangle {
            height: 0px;
            width: 0px;
            border-width: 8px;
            border-style: solid;
            border-color: transparent transparent transparent gold;
            position: relative;
            right: -16px;
            top: 3px;
        }
    </style>
</head>

<body class="gray-bg">
<div class="col-md-12">
    <div class="panel-body" style="background-color: white">
        <div class='control-label' style='align-content: center;color: blue;text-align: center;background-color:#bce8f1'>
            admin
        </div>
        <br/>
        <div id="chat" style="height: 600px;width: 100%;overflow:scroll;overflow-x:hidden;">

        </div>
        <div>
            <div class="col-md-12">
                <input id="text" name="text" class="form-control" type="text" style="width: 100%;height: 100px">
            </div>
        </div>
        <div>

                <button class="pull-right btn btn-danger" id="close" style="float: left">断开连接</button>
                <button class="pull-right btn btn-primary " id="send" style="float: right">发送</button>
        </div>
        <input id="username" name="username" class="form-control" type="text"
               value="${sessionScope.sessionmember.uname}" style="display: none">
    </div>
</div>
<script src="layer/jquery-2.0.3.min.js"></script>
<script src="layer/layer.js"></script>
<!-- Modernizer JS -->
<script src="assets/js/vendor/modernizr.min.js"></script>
<!-- jQuery JS -->
<script src="assets/js/vendor/jquery.js"></script>
<!-- Bootstrap JS -->
<script src="assets/js/vendor/bootstrap.min.js"></script>
<script src="assets/js/plugins/plugins.js"></script>
<script type="text/javascript">
    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:8088/onlineshop/websocket");
    } else {
        alert('当前浏览器 Not support websocket')
    }
    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };
    //连接成功建立的回调方法
    websocket.onopen = function () {
        setMessageInnerHTML("WebSocket连接成功，可以开始聊天了！！");
    };
    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        setMessage(event.data);
    };
    //连接关闭的回调方法
    websocket.onclose = function () {
        setMessageInnerHTML("WebSocket连接关闭");
    };
    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    };

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('chat').innerHTML += "<div class='control-label' style='align-content: center;color: blue;text-align: center;background-color:#bce8f1'>" + innerHTML + '</div><br/>';
    }

    //将消息显示在网页上
    function setMessage(innerHTML) {
        //获取当前登录的用户名
        var loginUserName = document.getElementById('username').value;
        var userNameEndIndex = innerHTML.indexOf("]");
        //获取发送人名称
        var fromUserName = innerHTML.substring(1, userNameEndIndex);
        var textStartIndex = innerHTML.indexOf(":");
        var textEndIndex = innerHTML.lastIndexOf("-");
        //获取信息
        var text = innerHTML.substring(textStartIndex + 1, textEndIndex);
        var toUserNameIndex = innerHTML.lastIndexOf(":");
        //获取接收人名称
        var toUserName = innerHTML.substring(toUserNameIndex + 1);
        if (toUserName != loginUserName && fromUserName != loginUserName) {
            return
        }
        var html;
        var date = new Date(new Date().getTime());
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        var d = date.getDate();
        var h = date.getHours();
        var mm = date.getMinutes();
        var s = date.getSeconds();
        var date_str = y + '-' + m + '-' + d + ' ' + h + ':' + mm + ':' + s + "  ";
        if (loginUserName == fromUserName && toUserName == 'admin') {
            html =
                "<div class='receiver'>" +
                "  <div>" +
                "<img src=/onlineshop/upfile/${sessionScope.sessionmember.filename} class='img-circle' width='25px' height='25px' style='margin-top: 1px;margin-right:5px;'/>" +
                " <p style='margin-left:7px'>" +
                fromUserName +
                "    </p>" +
                "<p style='margin-left:-50px'>" + date_str + "</p>" +
                "  </div>" +
                "  <div>" +
                "    <div class='right_triangle'></div>" +
                "    <span> " + text + "</span>" +
                "  </div>" +
                "</div>"
        } else if (loginUserName == toUserName && fromUserName == 'admin') {
            html = "<div class='sender'>" +
                "  <div>" +
                "<img src=/onlineshop/upfile/adminImage.png class='img-circle' width='25px' height='25px' style='margin-top: 1px;margin-right:5px;'/>" +
                " <p style='margin-left:7px'>" +
                fromUserName +
                "    </p>" +
                "<p>" + date_str + "</p>" +
                "  </div>" +
                "  <div style='margin-left: -40px;'>" +
                "    <div class='left_triangle'></div>" +
                "    <span> " + text + "</span>" +
                "  </div>" +
                "</div>"
        }
        document.getElementById('chat').innerHTML += html;
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //发送消息

    $("#send").click(function send() {
        var username = document.getElementById('username').value;
        var message = document.getElementById('text').value;
        if (message == "") {
            alert("不能发送空白信息");
            return false;
        }
        var msg = "[" + username + "]:" + message + "-To:admin";
        websocket.send(msg);
        document.getElementById('text').value = "";
    });
    $("#close").click(function closeWebSocket() {
        websocket.close();
    });
</script>
</body>
</html>