package com.it.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import com.it.dao.CategoryDao;
import com.it.dao.InventoryDAO;
import com.it.dao.ProductDao;
import com.it.entity.Inventory;
import com.it.entity.Product;
import com.it.util.Kcrecord;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


import java.util.*;

@Controller
public class InventoryController {
	
	@Resource
	InventoryDAO inventoryDAO;
	@Resource
	ProductDao productDAO;
	@Resource
	CategoryDao categoryDao;
	@Resource
	Kcrecord kcrecord;

	
	

	@RequestMapping("admin/inventoryAdd")
	public String inventoryAdd(Inventory inventory, HttpServletRequest request) {
		inventoryDAO.add(inventory);
		return "redirect:warehouseList";
	}

	@RequestMapping("admin/inventoryRemove")
	public String inventoryRemove(Inventory inventory, HttpServletRequest request) {
		inventoryDAO.remove(inventory);
		return "redirect:warehouseList";
	}

	

	

}
