package com.it.dao;


import com.it.entity.Loginip;

import java.util.HashMap;
import java.util.List;

public interface LoginipDao {
	List<Loginip> selectAll(HashMap map);
	void add(Loginip loginip);
	void delete();
}
