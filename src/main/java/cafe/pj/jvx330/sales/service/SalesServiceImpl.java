package cafe.pj.jvx330.sales.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cafe.pj.jvx330.domain.Sales;
import cafe.pj.jvx330.sales.dao.SalesDao;

@Component("SalesService")
public class SalesServiceImpl implements SalesService{
	private SalesDao salesDao;
	
	@Autowired
	public SalesServiceImpl(SalesDao salesDao) {
		this.salesDao = salesDao;
	}

	@Override
	public void addSales(Sales sales) {
		salesDao.addSales(sales);
	}

	@Override
	public List<Sales> findSalesByDate(Date date1, Date date2) {
		return salesDao.findSalesByDate(date1, date2);
	}

	@Override
	public List<Sales> findSalesByMenuNameAndDate(String menuName, Date date1, Date date2) {		
		return salesDao.findSalesByMenuNameAndDate(menuName, date1, date2);
	}
	
	@Override
	public List<Sales> findSalesByDate(char type, Date date1, Date date2) {
		return salesDao.findSalesByDate(date1, date2);
	}

	@Override
	public Sales findSalesByOrderNumber(String orderNumber) {
		return salesDao.findSalesByOrderNumber(orderNumber);
	}

	@Override
	public Sales updateSales(long sid) {	
		return salesDao.updateSales(sid);
	}

	@Override
	public void removeSales(String orderNumber) {
		salesDao.removeSales(orderNumber);
	}

	

}