package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.MemberDao;
import com.it.dao.MsgDao;
import com.it.entity.Member;
import com.it.entity.Msg;
import com.it.util.Info;
import com.it.util.Savesession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class MsgController {
    @Resource
	MsgDao msgDao;
	@Resource
	MemberDao memberDao;
	@Resource
	Savesession savesession;



    //后台留言列表
	@RequestMapping("admin/msgList")
	public String MsgList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Msg> list = msgDao.selectAll(map);
		for(Msg msg:list){
			Member member = memberDao.findById(Integer.parseInt(msg.getMemberid()));
			msg.setMember(member);
		}
		PageInfo<Msg> pageInfo = new PageInfo<Msg>(list);
		request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		return "msglist";
	}

	//添加留言
	@RequestMapping("msgAdd")
	public String MsgAdd(Msg msg,HttpServletRequest request) {
		Member sessionmember = (Member)request.getSession().getAttribute("sessionmember");
		if(sessionmember!=null) {
			msg.setMemberid(String.valueOf(sessionmember.getId()));
			msg.setSavetime(Info.getDateStr());
			msgDao.add(msg);
			return "redirect:msgLb";
		}else{
			return "redirect:login";
		}
	}

	//删除留言
	@RequestMapping("admin/msgDel")
	public String msgDel(Integer id,HttpServletRequest request) {
		msgDao.delete(id);
		return "redirect:MsgList";
	}

	//查找Msg到修改页面
	@RequestMapping("admin/msgShow")
	public String msgShow(Integer id,HttpServletRequest request) {
		Msg msg = msgDao.findById(id);
		request.setAttribute("msg",msg);
		return "msgedit";
	}

	@RequestMapping("admin/msgUpdate")
	public String msgUpdate(Msg msg,HttpServletRequest request) {
		msgDao.update(msg);
		return "redirect:msgList";
	}


	//前台留言列表
	@RequestMapping("msgLb")
	public String msgLb(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		List<Msg> list = msgDao.selectAll(map);
		for(Msg msg:list){
			Member member = memberDao.findById(Integer.parseInt(msg.getMemberid()));
			msg.setMember(member);
		}
		PageInfo<Msg> pageInfo = new PageInfo<Msg>(list);
		request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		savesession.getSessionMember(request);
		savesession.getCategorySession(request);
		return "msglb";
	}


}
