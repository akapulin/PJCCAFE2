package cafe.pj.jvx330.sales.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import cafe.pj.jvx330.domain.Sales;

@Component("SalesDao")
public class SalesDaoImpl implements SalesDao {
	
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jt;

	@Override
	public void addSales(Sales sales) {
		String sql = "INSERT INTO SalesRecord(customerId, orderNumber, amount, usePoint, place)"
				+ " VALUES (?, ?, ?, ?, ?)";
		
		jt.update(sql, sales.getUser().getId(), sales.getOrderNumber(), sales.getAmount(),
				sales.getUsePoint(), String.valueOf(sales.getPlace()));
	}

	@Override
	public List<Sales> findSalesByDate(Date date1, Date date2) {
		String sql = "SELECT id, customerId, orderNumber, amount, usePoint, place, regDate"
				+ " FROM SalesRecord WHERE DATE(regDate) BETWEEN ? AND ?";
		List<Sales> sales = jt.query(sql, new SalesRowMapper(), date1, date2); 
	
		return sales;
	}

	@Override
	public List<Sales> findSalesByDate(Date date) {
		String sql = "SELECT id, customerId, orderNumber, amount, usePoint, place, regDate"
				+ " FROM SalesRecord WHERE DATE(regDate)=?";
		List<Sales> sales = jt.query(sql, new SalesRowMapper(), date); 
	
		return sales;
	}

	@Override
	public List<Sales> findSalesByMenuNameAndDate(String menuName, Date date1, Date date2) {
		
		return null;
	}

	@Override
	public Sales findSalesByOrderNumber(String orderNumber) {
		
		return null;
	}

	@Override
	public Sales updateSales(long sid) {
		
		return null;
	}

	@Override
	public void removeSales(String orderNumber) {
		
		
	}

		
	
}
