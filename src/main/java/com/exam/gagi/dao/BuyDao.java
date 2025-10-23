package com.exam.gagi.dao;

import com.exam.gagi.model.Buy;
import com.exam.gagi.model.Items;
import com.exam.gagi.model.OrderSaleViewDto;
import com.exam.gagi.model.Orders;

public interface BuyDao {

	OrderSaleViewDto buy();

	Buy item(int id);

	void saveOrder(Orders order);

}
