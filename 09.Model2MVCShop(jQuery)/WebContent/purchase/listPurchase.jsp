<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
<%@ page import="java.util.List"%>

<%@ page import="com.model2.mvc.service.domain.*"%>
<%@ page import="com.model2.mvc.common.Search"%>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Purchase> list = (List<Purchase>) request.getAttribute("list");
	Page resultPage = (Page) request.getAttribute("resultPage");

	Search search = (Search) request.getAttribute("search");
	//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
%>/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
   		$("#currentPage").val(currentPage)
		//document.detailForm.submit();		
   		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
	}
	
	$(function() {
		//if(${param.menu == 'manage'}){
			 $( ".ct_list_pop td:contains('���ǵ���')" ).on("click" , function() {
					 var tranNo = $(this).data("param");
					 self.location ="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3";
			});
			// }
			 $( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					var tranNo = $(this).data("param");
					self.location ="/purchase/getPurchase?tranNo="+tranNo;
			});
			 
			 $( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
				 self.location ="/user/getUser?userId="+$(this).text().trim();
			});
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">
		<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
		<form name="detailForm" action="/purchase/listPurchase" method="post">
 		////////////////////////////////////////////////////////////////////////////////////////////////// -->
 		<form name="detailForm">
			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37"></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">���� �����ȸ</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ��ID</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">ȸ����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��ȭ��ȣ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����Ȳ</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">��������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<%
					for (int i = 0; i < list.size(); i++) {
						Purchase purchase = (Purchase) list.get(i);
						System.out.println("listPurchase.jsp���� TranCode ��� : " + purchase.getTranCode());
				%>
				<% } %>  
				<tr class="ct_list_pop">
					<td align="center">
					<a href="/getPurchase.do?tranNo=<%=purchase.getTranNo()%>"><%= i + 1 %></a>
					</td>
					<td></td>
					<td align="left">
					<a href="/getUser.do?userId=<%=purchase.getBuyer().getUserId()%>"><%=purchase.getBuyer().getUserId()%></a>
					</td>
					<td></td>
					<td align="left"><%=purchase.getReceiverName()%></td>
					<td></td>
					<td align="left"><%=purchase.getReceiverPhone()%></td>
					<td></td>
					<td align="left">���� <%
						if (purchase.getTranCode().trim().equals("1")) {
					%>
						���ſϷ� <%
						} else if (purchase.getTranCode().trim().equals("2")) {
					%> ����� <%
						} else if (purchase.getTranCode().trim().equals("3")) {
					%>
						��ۿϷ� <%
						}
					%> ���� �Դϴ�.
					</td>
					<td></td>
					<td align="left">
						<%
							if ((purchase.getTranCode().trim()).equals("2")) {
						%> 
						<a href="/updateTranCode.do?tranNo=<%=purchase.getTranNo()%>&tranCode=3">���ǵ���</a>
						<%}	%>
					</td>

				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
				<% } %>  %>/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
					<td align="center" data-param="${purchase.tranNo}">
					<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
					<a href="/purchase/getPurchase?tranNo=${purchase.tranNo}">${ i }</a> 
					////////////////////////////////////////////////////////////////////////////////////////////////// -->
					${ i }</td>
					<td></td>
					<td align="left" ">
					<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
					<a href="/user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a> 
					////////////////////////////////////////////////////////////////////////////////////////////////// -->
					${user.userId}</td>
					<td></td>
					<td align="left">${purchase.receiverName}</td>
					<td></td>
					<td align="left">${purchase.receiverPhone}</td>
					<td></td>
					<td align="left">���� 
							<c:if test = "${fn:trim(purchase.tranCode)=='1'}">
							���ſϷ� 
							</c:if>
							<c:if test = "${fn:trim(purchase.tranCode)=='2'}">
							����� 
							</c:if>
							<c:if test = "${fn:trim(purchase.tranCode)=='3'}">
							��ۿϷ�
							</c:if>
							���� �Դϴ�.
					</td>
					<td></td>
					<td align="left" data-param="${purchase.tranNo }">
						<c:if test = "${fn:trim(purchase.tranCode)=='2'}">
						<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
						<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo}&tranCode=3">���ǵ���</a> 
						////////////////////////////////////////////////////////////////////////////////////////////////// -->
						���ǵ���
						</c:if>
					</td>

				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>	
				</c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center">
						<input type="hidden" id="currentPage" name="currentPage" value=""/>
						<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// 		  
						<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
								�� ����
						<% }else{ %>
								<a href="javascript:fncGetPurchaseList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
						<% } %>

						<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
								<a href="javascript:fncGetPurchaseList('<%=i %>');"><%=i %></a>
						<% 	}  %>
	
						<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
								���� ��
						<% }else{ %>
								<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
						<% } %>
						 /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
					<jsp:include page="../common/pageNavigator.jsp"/>
						
					</td>
				</tr>
			</table>
			<!--  ������ Navigator �� -->
			
		</form>

	</div>

</body>
</html>