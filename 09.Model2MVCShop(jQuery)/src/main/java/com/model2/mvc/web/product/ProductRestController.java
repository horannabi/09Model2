package com.model2.mvc.web.product;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	
	@RequestMapping(value = "json/addProduct", method=RequestMethod.POST)
	public void addProduct(@RequestBody Product product) throws Exception{
		System.out.println("/product/json/addProduct : POST");
		System.out.println(product);
		productService.addProduct(product);
	}
	
	@RequestMapping(value = "json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception{
		System.out.println("/product/json/getProduct : GET");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value = "json/updateProduct/{prodNo}", method=RequestMethod.GET)
	public Product updateProduct(@PathVariable int prodNo) throws Exception{
		System.out.println("/product/json/updateProduct : GET");
		
		return productService.getProduct(prodNo);
	}
	
	@RequestMapping(value="json/updateProduct", method=RequestMethod.POST)
	public void updateProduct(@RequestBody Product product)	throws Exception{
		System.out.println("/product/json/updateProduct : POST");
		
		productService.updateProduct(product);
	}
	
	@RequestMapping(value = "json/getProductListbyGet", method=RequestMethod.GET)
	public Map<String, Object> getProductListbyGET() throws Exception{
		System.out.println("/product/json/getProductList : GET");
		Search search = new Search();
		
		Map<String, Object> map = productService.getProductList(search);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//System.out.println(resultPage); //
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		System.out.println(map); //
		return map;
	}
	
	@RequestMapping(value="json/getProductList", method=RequestMethod.POST)
	public Map<String, Object> getProductList(@RequestBody Search search)	throws Exception{
		System.out.println("/product/json/getProductList : POST");
		Map<String, Object> map = productService.getProductList(search);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//System.out.println(resultPage); //
		
		map.put("resultPage", resultPage);
		map.put("search", search);
		//System.out.println(map); //
		return map;
	}
	
	
}
