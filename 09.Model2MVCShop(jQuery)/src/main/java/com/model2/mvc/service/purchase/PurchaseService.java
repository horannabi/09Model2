package com.model2.mvc.service.purchase;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseService {

	//���� �߰�
	public void addPurchase(Purchase purchase) throws Exception;
	
	//���� ���� ����(�Ǹ��ڵ�)
	public Purchase getPurchase(int tranNo) throws Exception;
	
	//���� ���� ����(��ǰ ��ȣ)
	public Purchase getPurchase2(int ProdNo) throws Exception;
	
	//���� ����Ʈ
	public Map<String,Object> getPurchaseList(Search search,String buyerId) throws Exception;
	
	public Map<String,Object> getSaleList(Search search) throws Exception;
	
	//���� ���� ����
	public void updatePurchase(Purchase purchase) throws Exception;
	
	//�Ǹ� �ڵ� ���� ������
	public void updateTranCode(Purchase purchase) throws Exception;
	
	//�Ǹ� �ڵ� ���� �Ǹ���
	public void updateTranCodeByProd(Purchase purchase) throws Exception;
}