package com.it.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.*;
import com.it.entity.*;
import com.it.util.CheckCode;
import com.it.util.Info;
import com.it.util.Kcrecord;
import com.it.util.Savesession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class DingdanController {
    @Resource
	DingdanDao dingdanDao;
	@Resource
	CartDao cartDao;
	@Resource
	ProductDao productDao;
	@Resource
	DingdanmsgDao dingdanmsgDao;
	@Resource
	Kcrecord kcrecord;
	@Resource
	InventoryDAO inventoryDAO;
	@Resource
	Savesession savesession;
	@Resource
	MemberDao memberDao;
    //后台订单列表
	@RequestMapping("admin/dingdanList")
	public String dingdanList(@RequestParam(defaultValue = "1",value = "pageNum") Integer pageNum,HttpServletRequest request) {
		PageHelper.startPage(pageNum,10);
		String key = request.getParameter("key");
		String error = request.getParameter("error")==null?"":request.getParameter("error");
		HashMap map = new HashMap();
		map.put("key", key);
		List<Dingdan> list = dingdanDao.selectAll(map);
		PageInfo<Dingdan> pageInfo = new PageInfo<Dingdan>(list);
		request.setAttribute("key", key);
		if(!error.equals("")){
			request.setAttribute("error", "库存不足");
		}
		request.setAttribute("pageInfo", pageInfo);
		return "dingdanlist";
	}

	//创建订单
	@RequestMapping("createDingdan")
	public String createDingdan(Dingdan dingdan,HttpServletRequest request) {
		Member sessionmember = (Member)request.getSession().getAttribute("sessionmember");
		if(sessionmember!=null){
			Member mmm = memberDao.findById(sessionmember.getId());
			CheckCode cc = new CheckCode();
			String ddno = cc.getCheckCode();
			dingdan.setSavetime(Info.getDateStr());
			dingdan.setDdno(ddno);
			dingdan.setMemberid(String.valueOf(sessionmember.getId()));
			HashMap map = new HashMap();
			map.put("memberid",sessionmember.getId());
			List<Cart> list  = cartDao.selectAll(map);
			double total = 0;
			for(Cart cart:list){
				Product product = productDao.findById(Integer.parseInt(cart.getProductid()));
				double sjprice =0;
				if(product.getTjprice()!=null&&product.getTjprice()>0){
					sjprice = product.getTjprice();
				}else{
					sjprice = product.getPrice();
				}

				if(mmm.getLev().equals("会员")){
					sjprice=sjprice*0.9;
				}else if(mmm.getLev().equals("高级会员")){
					sjprice=sjprice*0.8;
				}

				double xjtotal  = sjprice*cart.getNum();
				cart.setXjtotal(xjtotal);
				cart.setProduct(product);
				total+=sjprice*cart.getNum();
				Dingdanmsg dingdanmsg = new Dingdanmsg();
				dingdanmsg.setDdno(ddno);
				dingdanmsg.setProductid(cart.getProductid());
				dingdanmsg.setNum(cart.getNum());
				dingdanmsg.setMemberid(String.valueOf(sessionmember.getId()));
				dingdanmsg.setXjtotal(Double.parseDouble(String.format("%.2f", xjtotal)) );
				dingdanmsg.setStatus("未发货");
				dingdanmsg.setSavetime(Info.getDateStr().substring(0,10));
				dingdanmsgDao.add(dingdanmsg);

			}
			dingdan.setTotal(Double.parseDouble(String.format("%.2f", total)) );
			if(dingdan.getFkfs().equals("当前支付")){
                dingdan.setFkstatus("待付款");
                dingdan.setFhstatus("未发货");
            }else{
                dingdan.setFkstatus("未付款");
                dingdan.setFhstatus("待发货");
            }
			dingdanDao.add(dingdan);
			for(Cart cart:list){
				cartDao.delete(cart.getId());
			}
			List<Cart> sessioncartlist= cartDao.selectAll(map);
			request.getSession().setAttribute("sessioncartlist",sessioncartlist);
			request.getSession().setAttribute("total","0.00");
			return "redirect:dingdanLb";
		}else{
			return "redirect:login";
		}
	}

	//付款页面
	@RequestMapping("skipFukaun")
	public String skipFukaun(int id,HttpServletRequest request) {
		Dingdan dingdan = dingdanDao.findById(id);
		request.setAttribute("dingdan", dingdan);
		return "fukuan";
	}

	//订单列表
	@RequestMapping("dingdanLb")
	public String dingdanLb(HttpServletRequest request) {
		Member sessionmember = (Member)request.getSession().getAttribute("sessionmember");
		if(sessionmember!=null) {
			HashMap map = new HashMap();
			map.put("memberid",sessionmember.getId());
			List<Dingdan> list = dingdanDao.selectAll(map);
			request.setAttribute("list", list);
			savesession.getSessionMember(request);
			return "dingdanlb";
		}else{
			return "redirect:login";
		}
	}

	//删除订单
	@RequestMapping("dingdanSc")
	public String dingdanSc(int id,HttpServletRequest request) {
		dingdanDao.delete(id);
		return "redirect:dingdanLb";
	}

    //删除订单
    @RequestMapping("admin/dingdanDel")
    public String dingdanDel(int id,HttpServletRequest request) {
        dingdanDao.delete(id);
        return "redirect:dingdanList";
    }


	//订单详情页面
	@RequestMapping("dingdanmsgLb")
	public String dingdanmsgLb(HttpServletRequest request) {
		Member sessionmember = (Member)request.getSession().getAttribute("sessionmember");
		if(sessionmember!=null) {
			String ddno = request.getParameter("ddno");
			HashMap map = new HashMap();
			map.put("ddno",ddno);
			List<Dingdanmsg> list = dingdanmsgDao.selectAll(map);
			for(Dingdanmsg dingdanmsg:list){
				Product product = productDao.findById(Integer.parseInt(dingdanmsg.getProductid()));
				dingdanmsg.setProduct(product);
			}
			request.setAttribute("list", list);
			savesession.getSessionMember(request);
			return "dingdanmsglb";
		}else{
			return "redirect:login";
		}
	}

	//订单付款
	@RequestMapping("updateFkstatus")
	public String updateFkstatus(int id,HttpServletRequest request) {
		String zffs = request.getParameter("zffs");
		Dingdan dingdan = dingdanDao.findById(id);
		dingdan.setFkstatus("已付款");
		dingdan.setZffs(zffs);
		if(dingdan.getFkfs().equals("货到支付")) {
			HashMap map = new HashMap();
			map.put("ddno", dingdan.getDdno());
			List<Dingdanmsg> msglist = dingdanmsgDao.selectAll(map);
			for (Dingdanmsg dingdanmsg : msglist) {
				dingdanmsg.setThstatus("可退货");
				dingdanmsgDao.update(dingdanmsg);
			}
			dingdan.setFhstatus("交易完成");
		}
		dingdanDao.update(dingdan);
		return "redirect:dingdanLb";
	}

	//订单发货
	@RequestMapping("admin/updateFhstatus")
	public String updateFhstatus(int id,HttpServletRequest request) {
		Dingdan dingdan = dingdanDao.findById(id);
		HashMap map = new HashMap();
		map.put("ddno",dingdan.getDdno());
		List<Dingdanmsg> list = dingdanmsgDao.selectAll(map);
		boolean flag = true;
		for(Dingdanmsg dingdanmsg:list){
			int kc = kcrecord.getkc(Integer.parseInt(dingdanmsg.getProductid()));
			if(kc<dingdanmsg.getNum()){
				flag = false;
				break;
			}
		}

		if(flag==true){
			dingdan.setFhstatus("已发货");
			dingdanDao.update(dingdan);
			for(Dingdanmsg ddmsg:list){
				ddmsg.setStatus("已发货");
				dingdanmsgDao.update(ddmsg);

				Inventory inventory = new Inventory();
				inventory.setFlag("out");
				inventory.setNum(ddmsg.getNum());
				inventory.setProductid(ddmsg.getProductid());
				inventoryDAO.add(inventory);
			}
			return "redirect:dingdanList";
		}else{
			return "redirect:dingdanList?error=error";
		}
	}

	//后台订单详情列表
	@RequestMapping("admin/dingdanmsgList")
	public String dingdanmsgList(HttpServletRequest request) {
			String ddno = request.getParameter("ddno");
			HashMap map = new HashMap();
			map.put("ddno",ddno);
			List<Dingdanmsg> list = dingdanmsgDao.selectAll(map);
			for(Dingdanmsg dingdanmsg:list){
				Product product = productDao.findById(Integer.parseInt(dingdanmsg.getProductid()));
				dingdanmsg.setProduct(product);
			}
			request.setAttribute("list", list);
			return "dingdanmsglist";
	}


    //确认收货
    @RequestMapping("updateShstatus")
    public String updateShstatus(int id,HttpServletRequest request) {
        Dingdan dingdan = dingdanDao.findById(id);
        HashMap map = new HashMap();
        map.put("ddno", dingdan.getDdno());
        List<Dingdanmsg> msglist = dingdanmsgDao.selectAll(map);
        if(dingdan.getFkfs().equals("货到支付")){
            dingdan.setFkstatus("已付款");
        }
        dingdan.setFhstatus("交易完成");
        for(Dingdanmsg dingdanmsg:msglist){
        	dingdanmsg.setThstatus("可退货");
			dingdanmsgDao.update(dingdanmsg);
		}
        dingdanDao.update(dingdan);
        return "redirect:dingdanLb";
    }

    //取消订单
    @RequestMapping("quXiao")
    public String quXiao(int id,HttpServletRequest request) {
        Dingdan dingdan = dingdanDao.findById(id);
        if(dingdan.getFkstatus().equals("已付款")){
            dingdan.setFkstatus("已退款");
        }
        dingdan.setFhstatus("已取消");
        dingdanDao.update(dingdan);
        return "redirect:dingdanLb";
    }


}
