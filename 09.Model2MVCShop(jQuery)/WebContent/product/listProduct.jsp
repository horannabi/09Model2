<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
<%@ page import="java.util.List"  %>

<%@ page import="com.model2.mvc.service.domain.Product" %>
<%@ page import="com.model2.mvc.common.Search" %>
<%@page import="com.model2.mvc.common.Page"%>
<%@page import="com.model2.mvc.common.util.CommonUtil"%>

<%
	List<Product> list= (List<Product>)request.getAttribute("list");
	Page resultPage=(Page)request.getAttribute("resultPage");

	Search search = (Search)request.getAttribute("search");
//==> null �� ""(nullString)���� ����
	String searchCondition = CommonUtil.null2str(search.getSearchCondition());
	String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
	
	String mode = request.getParameter("menu");
%>/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>

<html>
<head>
<title>��ǰ �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
//�˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;
   		$("#currentPage").val(currentPage)
		//document.detailForm.submit();		
   		$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();
	}
	
	$(function() {
		 
		//==> �˻� Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
		 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
			fncGetList(1);
		});
		 
		 $( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
			 var prodNo = $(this).data("param");
				//Debug..
				alert(  $( this ).text().trim() +"menu=search");
				//self.location ="/product/getProduct?prodNo=${product.prodNo}&menu=search";
				if(${param.menu == 'manage'}){
					self.location ="/product/updateProduct?prodNo="+prodNo+"&menu=manage";
				}else{
					self.location ="/product/getProduct?prodNo="+prodNo+"&menu=search";
				}
		});
		 
		 if(${param.menu == 'manage'}){
		 $( ".ct_list_pop td:contains('����ϱ�')" ).on("click" , function() {
				 self.location ="/purchase/updateTranCodeByProd?purchaseProd.prodNo=${product.prodNo}&tranCode=2";
		});
		 }
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
  <form name="detailForm" action="/product/listProduct?menu=${param.menu}" method="post"> 
 ////////////////////////////////////////////////////////////////////////////////////////////////// -->
 <form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<%-- 
					<% if(mode.equals("manage")) {%>
							��ǰ ����
					<% }else if(mode.equals("search")) {%>
							��ǰ ��� ��ȸ
					<% } %>	--%>
					<c:if test = "${param.menu == 'manage'}">
						��ǰ ����
					</c:if>
					<c:if test = "${param.menu == 'search'}">
						��ǰ ��� ��ȸ
					</c:if>
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<option value="0"<%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
				<option value="1"<%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
				<option value="2"<%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
				/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
				
			</select>
			<input type="text" name="searchKeyword" 
						value="${! empty search.searchKeyword ? search.searchKeyword : ""}"  
						class="ct_input_g" style="width:200px; height:20px" > 
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
						<a href="javascript:fncGetList('1');">�˻�</a>
						////////////////////////////////////////////////////////////////////////////////////////////////// -->
						�˻�
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<%--<td colspan="11" >��ü   <%= resultPage.getTotalCount() %> �Ǽ�, ���� <%= resultPage.getCurrentPage() %> ������</td>--%>
		<td colspan="11" >
			��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		</td>	
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
		<td class="ct_line02"></td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
	<% 	
		for(int i=0; i<list.size(); i++) {
			Product vo = list.get(i);
	%>	
	<tr class="ct_list_pop">
		<td align="center" ><%= i + 1 %></td>
		<td></td>
				<% if(mode.equals("manage")) {%>
				<td align="left"><a href="/product/updateProductView?prodNo=<%= vo.getProdNo()%>&menu=manage"><%= vo.getProdName() %></a></td>
				<% }else if(mode.equals("search")) {%>
				<td align="left"><a href="/product/getProduct?prodNo=<%= vo.getProdNo()%>&menu=search"><%= vo.getProdName() %></a></td>
				<% } %>
		<td></td>
		<td align="left"><%= vo.getPrice() %></td>
		<td></td>
		<td align="left"><%= vo.getRegDate()%></td>
		<td></td>
		<td align="left">
		
			�Ǹ���
		
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	<% } %>  %>/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
	<c:set var="i" value="0" />
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
				<td align="left" data-param="${product.prodNo }">
			<%-- 
			
			
			<c:if test = "${param.menu == 'manage'}">
				<td align="left">
				<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
				<a href="/product/updateProduct?prodNo=${product.prodNo}&menu=manage">${product.prodName}</a>
				///////////////////////////////////////////////////////////////////////////-->
				${product.prodName}
				</td>
			</c:if>
			<c:if test = "${param.menu == 'search'}">
				<td align="left">
				<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
				<a href="/product/getProduct?prodNo=${product.prodNo}&menu=search">${product.prodName}</a>
				///////////////////////////////////////////////////////////////////////////-->
				
				
				 --%>
				
				${product.prodName}
				</td>
			<%-- </c:if> --%>
		<td></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="left">${product.regDate}</td>
		<td></td>
		<td align="left">
			
					<c:if test = "${product.proTranCode==null || product.proTranCode=='0'}">
					�Ǹ���
					</c:if>
					<c:if test = "${product.proTranCode!=null && product.proTranCode!='0'}">
					������
					
						<c:if test = "${param.menu=='manage'&&fn:trim(product.proTranCode)=='1'}" >
						<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
						<a href="/purchase/updateTranCodeByProd?purchaseProd.prodNo=${product.prodNo}&tranCode=2">����ϱ�</a>
						///////////////////////////////////////////////////////////////////////////-->
						����ϱ�
						</c:if>
						<c:if test = "${param.menu=='manage'&&fn:trim(product.proTranCode)=='2'}" >
								(�����)
						</c:if>
						<c:if test = "${param.menu=='manage'&&fn:trim(product.proTranCode)=='3'}" >
								(��ۿϷ�)
						</c:if>
					</c:if>
		
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// 		   
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetProductList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetProductList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
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
