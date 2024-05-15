package com.it.controller;

import com.it.entity.Member;
import com.it.util.WebSocketServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class SocketController {

    @Resource
    private WebSocketServer webSocketServer;

    @RequestMapping("webSocket")
    public String socket(HttpServletRequest request) {
        return "webSocket";
    }


}
