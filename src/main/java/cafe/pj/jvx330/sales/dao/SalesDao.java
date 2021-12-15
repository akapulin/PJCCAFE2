package cafe.pj.jvx330.sales.dao;

import java.util.Date;
import java.util.List;

import cafe.pj.jvx330.domain.Product;
import cafe.pj.jvx330.domain.Sales;

public interface SalesDao {
	void addSales(Sales sales);
	List<Sales> findSalesByDate(Date date1, Date date2);
	
	List<Sales> findSalesByDate(Date date);
	
	List<Sales> findSalesByMenuNameAndDate(String menuName, Date date1, Date date2);
	 
	
	Sales findSalesByOrderNumber(String orderNumber);

	Sales updateSales(long sid);


	void removeSales(String orderNumber);
	
	
	/**
	 * 
	 * @param date1
	 * @param date2
	 * For 일간, 주간, 월간 메뉴별 판매내역 출력, 
	 * OrderRecord Table에서 파라미터 범위에 해당하는 List<Product> 출력
	 */
	List<Product> findOrderRecordForMenu(String date1, String date2);
	
	int[] addOrderRecord(List<Product> order);

}
