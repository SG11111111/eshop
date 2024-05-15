package com.it.util;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import com.it.dao.InventoryDAO;
import com.it.entity.Inventory;
import org.springframework.stereotype.Component;


@Component
public class Kcrecord {
	@Resource
	InventoryDAO inventoryDAO;
	
	public int getkc(Integer productid) {
		int totalkc = 0;
		int intotal = 0;
		int outtotal = 0;
		HashMap map = new HashMap();
		map.put("productid", productid);
		map.put("flag", "in");
		List<Inventory> inlist = inventoryDAO.selectAll(map);
		for(Inventory innum:inlist){
			intotal+=innum.getNum();
		}
		map.put("flag", "out");
		List<Inventory> outlist = inventoryDAO.selectAll(map);
		for(Inventory outnum:outlist){
			outtotal+=outnum.getNum();
		}
		totalkc = intotal-outtotal;
		return totalkc;
	}

}
