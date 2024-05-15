package com.it.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.MemberDao;
import com.it.dao.SysuserDao;
import com.it.entity.Member;
import com.it.entity.News;
import com.it.entity.Sysuser;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SysuserController {
    @Resource
    SysuserDao sysuserDao;
	@Resource
	MemberDao memberDao;

	//后台登录
	@RequestMapping("admin/welcome")
	public String welcome(Sysuser sysuser,HttpServletRequest request){
			return "login";
	}


	//后台登录
	@RequestMapping("admin/login")
	public String adminLogin(Sysuser sysuser,HttpServletRequest request){
		HashMap map = new HashMap();
		map.put("uname",sysuser.getUname());
		map.put("upass",sysuser.getUpass());
		List<Sysuser> list = sysuserDao.selectAll(map);
		if(list.size()==0){
			request.setAttribute("suc","用户名或密码错误");
			return "login";
		}else{
			request.getSession().setAttribute("admin",list.get(0));

			return "redirect:/admin/index.jsp";
		}
		}

	//后台退出
	@RequestMapping("admin/adminExit")
	public String adminExit(HttpServletRequest request){
		request.getSession().removeAttribute("admin");
		return "login";
	}

	//后台刷新首页
	@RequestMapping("admin/index")
	public String adminIndex(){
		return "index";
	}

	//跳转到修改个人信息页面
	@RequestMapping("admin/skipToUserInfomation")
	public String skipToUserInfomation(HttpServletRequest request){
		Sysuser admin = (Sysuser)request.getSession().getAttribute("admin");
		Sysuser sysuser = (Sysuser)sysuserDao.findById(admin.getId());
		request.setAttribute("sysuser",sysuser);
		return "userinfomation";
	}

	//修改密码
	@RequestMapping("admin/userpasswordEdit")
	public String userpasswordEdit(HttpServletRequest request){
		Sysuser admin = (Sysuser)request.getSession().getAttribute("admin");
		Sysuser sysuser = (Sysuser)sysuserDao.findById(admin.getId());
		String oldpassword = request.getParameter("oldpassword");
		String newspassword = request.getParameter("newspassword");
		if(oldpassword.equals(sysuser.getUpass())){
			sysuser.setUpass(newspassword);
			sysuserDao.update(sysuser);
			request.setAttribute("suc","操作成功");
			return "userpassword";
		}else{
			request.setAttribute("suc","原密码错误");
			return "userpassword";
		}
	}

	//添加管理员
	@RequestMapping("admin/userAdd")
	public String userAdd(Sysuser user, HttpServletRequest request) {
		user.setDelstatus("0");
		sysuserDao.add(user);
		return "redirect:userList";
	}

	//管理员页面
	@RequestMapping("admin/userShow")
	public String userShow(int id, HttpServletRequest request) {
		Sysuser user = sysuserDao.findById(id);
		request.setAttribute("user", user);
		return "useredit";
	}

	//编辑管理员
	@RequestMapping("admin/userEdit")
	public String userEdit(Sysuser user, HttpServletRequest request) {
		sysuserDao.update(user);
		return "redirect:userList";
	}

	//删除
	@RequestMapping("admin/userDel")
	public String userDel(int id, HttpServletRequest request) {
		Sysuser user = sysuserDao.findById(id);
		user.setDelstatus("1");
		sysuserDao.update(user);
		return "redirect:userList";
	}

	@RequestMapping("admin/userList")
	public String userList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum, HttpServletRequest request) {
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		map.put("cw", "cw");
		PageHelper.startPage(pageNum,10);
		List<Sysuser> list = sysuserDao.selectAll(map);
		PageInfo<Sysuser> pageInfo = new PageInfo<Sysuser>(list);
		request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		return "userlist";
	}


	//检查用户名的唯一性
	@RequestMapping("admin/checkUsername")
	public void checkUname(String uname, HttpServletRequest request, HttpServletResponse response){
		PrintWriter out = null;
		try {
			out = response.getWriter();
			HashMap map = new HashMap();
			map.put("uname", uname);
			List<Sysuser> list = sysuserDao.selectAll(map);
			if(list.size()==0){
				out.print(0);
			}else{
				out.print(1);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("admin/chat")
	public String chat(Member member, HttpServletRequest request, Model model) {
		Member user = memberDao.findById(member.getId());
		model.addAttribute("chatUser",user);
		return "chat";
	}


}
