package com.it.dao;


import com.it.entity.Address;

import java.util.HashMap;
import java.util.List;

public interface AddressDao {
	List<Address> selectAll(HashMap map);
	void add(Address address);
	Address findById(Integer id);
	void update(Address address);
	void delete(int id);
}
