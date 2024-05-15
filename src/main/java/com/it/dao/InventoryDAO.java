package com.it.dao;
import com.it.entity.Inventory;

import java.util.*;
public interface InventoryDAO {
	List<Inventory> selectAll(HashMap map);
	void add(Inventory inventory);
	void remove(Inventory inventory);

}
