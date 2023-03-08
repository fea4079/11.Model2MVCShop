package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;




//==> ��ǰ���� Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductController(){
		System.out.println("ProductController.java.ProductController() "+this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	//@Value("#{commonProperties['pageUnit']}")
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	//@Value("#{commonProperties['pageSize']}")4++++++++++
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value = "addProduct", method = RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("ProductController.java /Product GET");
		
		return "forward:/product/addProductView.jsp";
	}
	
	@RequestMapping(value = "addProduct", method = RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product ) throws Exception {

		System.out.println("ProductController.java /addProduct POST");
		//Business Logic
		productService.addProduct(product);
		
		return "forward:/product/getProduct.jsp";
	}
	
//	@RequestMapping("/getProduct.do")
	@RequestMapping(value = "getProduct", method = RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo, 
								@RequestParam("menu") String menu,
								Model model ) throws Exception {
		
		System.out.println("ProductController.java /getProduct GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		System.out.println("ProductController.java /getProduct.do  product "+product);
		//System.out.println("ProductController.java /getProduct.do  menu "+menu);
		
		if(menu.equals("manage")) {
			return "forward:/product/updateProductView.jsp";	
		}else {
			return "forward:/product/getProduct.jsp";
		}

	}
	
//	@RequestMapping("/updateProductView.do")
	@RequestMapping(value = "updateProduct", method = RequestMethod.GET)
	public String updateProductView( @RequestParam("prodNo") int prodNo , 
									Model model ) throws Exception{

		System.out.println("ProductController.java /updateProductView GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		
		return "forward:/product/updateProductView.jsp";
	}
	
//	@RequestMapping("/updateProduct.do")
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product ,
								 @RequestParam("menu") String menu,
									Model model , HttpSession session) throws Exception{

		System.out.println("ProductController.java /updateProduct POST");
		//Business Logic
		productService.updateProduct(product);
		System.out.println("ProductController.java /updateProduct.do ����ʽ���� ���� �����");
		System.out.println("menu "+menu);
		
//		model.addAttribute("menu", menu);
		
//		String sessionId=((Product)session.getAttribute("product")).getProdNo();
//		if(sessionId.equals(product.getProdNo())){
//			session.setAttribute("product", product);
//		}
//		return "forward:/getProduct.do";
		return "forward:/product/getProduct.jsp";
//		return "forward:/getProduct.do?menu="+menu;
	}
	
		
//	@RequestMapping("/listProduct.do")
	@RequestMapping(value = "listProduct")
	public String listProduct( @ModelAttribute("search") Search search ,
								Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("ProductController.java�� /listProduct GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
//		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
//		model.addAttribute("product",product);
//		model.addAttribute("menu", menu);
//		if(menu.equals("manage")) {
//			return "forward:/product/updateProductView.do";	
//		}else {
//			return "forward:/product/getProduct.jsp";
//		}
		return "forward:/product/listProduct.jsp";
	}
}