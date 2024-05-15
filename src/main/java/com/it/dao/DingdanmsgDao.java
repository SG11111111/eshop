package com.it.dao;


import com.it.entity.Dingdan;
import com.it.entity.Dingdanmsg;

import java.util.HashMap;
import java.util.List;

public interface DingdanmsgDao {
	List<Dingdanmsg> selectAll(HashMap map);
	void add(Dingdanmsg dingdanmsg);
	void update(Dingdanmsg dingdanmsg);
	List<Dingdanmsg> selectPh();
	List<Dingdanmsg> selectSale(int id);
	Dingdanmsg findById(int id);



}
