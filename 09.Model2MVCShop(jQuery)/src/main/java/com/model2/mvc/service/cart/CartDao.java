package com.model2.mvc.service.cart;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Cart;


public interface CartDao {
	//INSERT
	public void addCart(Cart cart) throws Exception;
	
	//SELECT LIST
	public List<Cart> getCartList(Search search, String userCartId) throws Exception;
	
	//DELETE
	public void deleteCart(Cart cart) throws Exception;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(String userCartId) throws Exception ;

	
}
