package com.it.dao;

import com.it.entity.Msg;

import java.util.HashMap;
import java.util.List;

public interface MsgDao {
	List<Msg> selectAll(HashMap map);
	void add(Msg Msg);
	void delete(Integer id);
	Msg findById(Integer id);
	void update(Msg Msg);
}
