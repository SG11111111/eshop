package com.it.dao;


import com.it.entity.Dingdan;

import java.util.HashMap;
import java.util.List;

public interface DingdanDao {
	List<Dingdan> selectAll(HashMap map);
	void add(Dingdan dingdan);
	void delete(int id);
	Dingdan findById(int id);
	void update(Dingdan dingdan);
	List<Dingdan> selectSaleMoney();

}
