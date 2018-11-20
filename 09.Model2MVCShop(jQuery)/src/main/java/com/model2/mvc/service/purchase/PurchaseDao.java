package com.model2.mvc.service.purchase;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {
	//INSERT
	public void addPurchase(Purchase purchase) throws Exception;
	
	//SELECT ONE(�Ǹ��ڵ�)
	public Purchase getPurchase(int tranNo) throws Exception;
	
	//SELECT ONE(��ǰ ��ȣ)
	public Purchase getPurchase2(int prodNo) throws Exception;
	
	//SELECT LIST
	public List<Purchase> getPurchaseList(Search search,String buyerId) throws Exception;
	
	public List<Purchase> getSaleList(Search search) throws Exception;
	
	//UPDATE
	public void updatePurchase(Purchase purchase) throws Exception;
	
	//�ڵ� UPDATE ������
	public void updateTranCode(Purchase purchase) throws Exception;
	
	//�ڵ� UPDATE �Ǹ���
	public void updateTranCodeByProd(Purchase purchase) throws Exception;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(String buyerId) throws Exception ;
}
