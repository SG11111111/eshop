package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.LoginipDao;
import com.it.entity.Loginip;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class LoginipController {
    @Resource
    LoginipDao loginipDao;


    //后台访客登录列表
	@RequestMapping("admin/loginipList")
	public String loginipList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Loginip> list = loginipDao.selectAll(map);
		PageInfo<Loginip> pageInfo = new PageInfo<Loginip>(list);
		request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		return "loginiplist";
	}


	//删除访客登录
	@RequestMapping("admin/loginipDel")
	public String loginipDel(HttpServletRequest request) {
		loginipDao.delete();
		return "redirect:loginipList";
	}



}
