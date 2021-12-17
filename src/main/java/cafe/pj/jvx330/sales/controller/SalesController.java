package cafe.pj.jvx330.sales.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cafe.pj.jvx330.domain.Menu;
import cafe.pj.jvx330.domain.Product;
import cafe.pj.jvx330.domain.Sales;
import cafe.pj.jvx330.domain.User;
import cafe.pj.jvx330.menu.service.MenuService;
import cafe.pj.jvx330.sales.service.SalesService;
import cafe.pj.jvx330.user.service.UserService;
import cafe.pj.jvx330.web.command.ProductCommand;
import cafe.pj.jvx330.web.command.SalesCommand;
import cafe.pj.jvx330.web.controller.CafeController;

/**
 * Sales 관련 부모 컨트롤러
 * @author 김보령
 *
 */
public class SalesController extends CafeController {
	@Resource(name="salesService")
	SalesService ss;
	
	@Resource(name="menuService")
	MenuService ms;

	@Resource(name="userService")
	UserService us;
	
	/**
	 * orderCommand 를 order로 변환
	 * @param orderCommand
	 * @return
	 */
	protected List<Product> convertProductCommandToProduct(List<ProductCommand> orderCommand){
		List<Product> order = new ArrayList<>();
		for (ProductCommand pc : orderCommand) {
			Menu menu = ms.findMenuById(pc.getMenu().getId());
			Product p = new Product(menu, pc.getQuantity());
			order.add(p);
		}
		return order;
	}
	
	/**
	 * session 내 order 를 반환
	 * @param session
	 * @return
	 */
	protected Map<String, List<Product>> checkOrderInSession(HttpSession session) {
		Map<String, List<Product>> order = (Map<String, List<Product>>)session.getAttribute("order");
		// order 가 null 이면 실행
		if (validator.isEmpty(order)) {
			Map<String, List<Product>> makeOrder = new HashMap<>();
			session.setAttribute("order", makeOrder);
			
			order = (Map<String, List<Product>>) session.getAttribute("order");
		}
		return order;
	}

	/**
	 * session 내 compSales 반환
	 * @param session
	 * @return
	 */
	protected Map<String, Sales> checkCompSalesInSession(HttpSession session) {
		Map<String, Sales> compSales = (Map<String, Sales>)session.getAttribute("compSales");
		if (validator.isEmpty(compSales)) {
			Map<String, Sales> makeCompSales = new TreeMap<>();
			session.setAttribute("compSales", makeCompSales);
			
			compSales = (Map<String, Sales>) session.getAttribute("compSales");
		}
		return compSales;
	}
}
