package com.it.dao;

import com.it.entity.Imgadv;
import com.it.entity.News;

import java.util.HashMap;
import java.util.List;

public interface ImgadvDao {
	List<Imgadv> selectAll();
	void add(Imgadv imgadv);
	void delete(Integer id);
}
