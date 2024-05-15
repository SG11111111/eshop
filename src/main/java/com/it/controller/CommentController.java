package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.CommentDao;
import com.it.dao.DingdanmsgDao;
import com.it.dao.MemberDao;
import com.it.dao.ProductDao;
import com.it.entity.Comment;
import com.it.entity.Dingdanmsg;
import com.it.entity.Member;
import com.it.entity.Product;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class CommentController {
    @Resource
	CommentDao commentDao;
	@Resource
	DingdanmsgDao dingdanmsgDao;
	@Resource
	ProductDao productDao;
	@Resource
	MemberDao memberDao;





	//添加评论
	@RequestMapping("commentAdd")
	public String commentAdd(Comment comment,HttpServletRequest request) {
		Member member = (Member)request.getSession().getAttribute("sessionmember");
		if(member!=null) {
			HashMap map = new HashMap();
			map.put("memberid",member.getId());
			map.put("productid",comment.getProductid());
			map.put("status","已发货");
			List<Dingdanmsg> list = dingdanmsgDao.selectAll(map);
			if(list.size()!=0) {
				comment.setMemberid(String.valueOf(member.getId()));
				commentDao.add(comment);
				return "redirect:productDetails?id="+comment.getProductid()+"&suc=suc";
			}else{
				return "redirect:productDetails?id="+comment.getProductid()+"&error=error";
			}
		}else{
			return "redirect:login";
		}
	}

	//删除评论
	@RequestMapping("admin/commentDel")
	public String commentDel(Integer id,HttpServletRequest request) {
		commentDao.delete(id);
		return "redirect:commentList";
	}

	//后台评论列表
	@RequestMapping("admin/commentList")
	public String commentList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Comment> list = commentDao.selectAll(map);
		for(Comment comment:list){
			Product pt = productDao.findById(Integer.parseInt(comment.getProductid()));
			Member member = memberDao.findById(Integer.parseInt(comment.getMemberid()));
			comment.setPt(pt);
			comment.setMember(member);
		}
		PageInfo<Comment> pageInfo = new PageInfo<Comment>(list);
		request.setAttribute("key", key);
		request.setAttribute("pageInfo", pageInfo);
		return "commentlist";
	}

}
