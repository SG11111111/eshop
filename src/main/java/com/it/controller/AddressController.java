package com.it.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.it.dao.AddressDao;
import com.it.entity.Address;
import com.it.entity.Member;
import com.it.util.Info;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Controller
public class AddressController {
    @Resource
    AddressDao addressDao;


    //前台地址列表
    @RequestMapping("addressLb")
    public String addressLb(@RequestParam(defaultValue = "1", value = "pageNum") Integer pageNum, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        HashMap map = new HashMap();
        if (member == null) {
            return "redirect:login";
        }
        map.put("memberid", member.getId());
        PageHelper.startPage(pageNum, 10);
        List<Address> list = addressDao.selectAll(map);
        PageInfo<Address> pageInfo = new PageInfo<Address>(list);
        request.setAttribute("pageInfo", pageInfo);
        return "addresslb";
    }


    //添加地址
    @RequestMapping("addressAdd")
    public String addressAdd(Address address, HttpServletRequest request) {
        Member member = (Member) request.getSession().getAttribute("sessionmember");
        address.setMemberid(String.valueOf(member.getId()));
        address.setDelstatus("0");
        addressDao.add(address);
        return "redirect:addressLb";
    }

    //删除地址
    @RequestMapping("addressDel")
    public String addressDel(Integer id, HttpServletRequest request) {
        addressDao.delete(id);
        return "redirect:addressLb";
    }


}
