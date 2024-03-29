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



//==> 상품관리 Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="addProduct", method=RequestMethod.GET)
	public String addProduct() throws Exception {

		System.out.println("/product/addProductView : GET");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST)
	public String addProduct( @ModelAttribute("product") Product product ) throws Exception {

		System.out.println("product/addProduct : POST");
		//Business Logic
		product.setManuDate(product.getManuDate().replace("/", ""));
		System.out.println("1실행은 하냐add");
		productService.addProduct(product);
		System.out.println("2실행은 하냐add");
		return "forward:/product/readProduct.jsp";
	}
	
	@RequestMapping(value="getProduct", method=RequestMethod.GET)
	public String getProduct( @RequestParam("prodNo") int prodNo , @RequestParam("menu") String menu , Model model ) throws Exception {
		
		System.out.println("product/getProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		
		//return "forward:/product/getProduct.jsp";
		System.out.println("1실행은 하냐get");
		if(menu == null) {
//			return "forward:/product/Product.jsp?prodNo="+prodNo;
			return "forward:/product/getProduct.jsp?prodNo="+prodNo;
		}
		if(menu.equals("search")) {
			System.out.println("GetProductAction Search");
			return "forward:/product/updateProductView.jsp";
		}else if(menu.equals("manage")){
			System.out.println("GetProductAction Manage");
			return "forward:/product/updateProduct.jsp";
		}else {
			return "forward:/product/getProduct.jsp?prodNo="+prodNo;
		}
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("product/updateProduct : GET");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		// Model 과 View 연결
		model.addAttribute("product", product);
		System.out.println("1실행은 하냐updateGET");
		Product productVO = (Product)getAttribute(prodNo);
		System.out.println(productVO);
		return "forward:/product/updateProduct.jsp";
	}
	
	private Product getAttribute(int prodNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@RequestMapping(value="updateProduct" ,method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product , Model model , HttpSession session, String menu) throws Exception{

		System.out.println("product/updateProduct : POST");
		//Business Logic
		productService.updateProduct(product);
		
		int sessionNo=((Product)session.getAttribute("product")).getProdNo();
		if(sessionNo==(product.getProdNo())) {
			session.setAttribute("product", product);
		}
		
		System.out.println("1실행은 하냐updatePOST");
		//return "forward:/product/readProduct.jsp";
		return "redirect:/getProduct.do?prodNo="+product.getProdNo()+"&menu="+menu;
	}

	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("product/listProduct : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		System.out.println("1실행은 하냐list");
		return "forward:/product/listProduct.jsp";
	}
}