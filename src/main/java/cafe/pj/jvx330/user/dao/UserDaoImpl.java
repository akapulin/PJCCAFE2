package cafe.pj.jvx330.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import cafe.pj.jvx330.domain.Customer;
import cafe.pj.jvx330.domain.Employee;
import cafe.pj.jvx330.domain.User;

@Component("userDao")
public class UserDaoImpl implements UserDao {
	@Resource(name = "jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	
	
	/**
	 * 커스터머에 테이블에 고객 추가
	 * @author 정원식
	 *
	 */

	@Override
	public void addUser(User user) {
		
		if(user instanceof Customer) {
			String sql ="INSERT INTO Customer(name,phone,birth)"
					+ "VALUES(? , ? , ?)";
			Customer customer = (Customer)user;
			jdbcTemplate.update(sql,customer.getCustomerName(), customer.getPhone(),
					customer.getBirth());
				
		}
	}
	
	
	
	
	
	/**
	 * 폰번호로 고객정보 찾기
	 */

	@Override
	public List<User> findUsersByPhone(String phone) {
		String sql = "SELECT id, name, phone, birth, point ,regDate"
				+ " FROM Customer WHERE phone = ?";
		
		List<User> users = jdbcTemplate.query(sql, new UserRowMapper(),phone);
		return users;
	}
	
	/**
	 * 고객 전체 회원목록 보기
	 */
	@Override
	public List<User> findAllUsers() {
		
		List<User> users = jdbcTemplate.query("SELECT id, name, phone, birth, point, regDate From Customer", new UserRowMapper());
		return users;
	}
	
	/**
	 * 고객 정보 변경하기
	 */

	@Override
	public User updateUserById(User user) {
		
		String sql = "UPDATE Customer SET name = ?,phone = ?,birth = ?,point = ? WHERE id = ?";
		
		
		jdbcTemplate.update(sql, ((Customer)user).getCustomerName(), ((Customer)user).getPhone(),
				((Customer)user).getBirth(), ((Customer)user).getPoint(), user.getId());
		return user;
		
		
		
	}
	
	
	public void updateUser(User user) {
		String sql = "UPDATE Customer SET nema = ?, phone = ?, birth = ?, point = ? ";
		jdbcTemplate.query(sql, new UserRowMapper());
	}
	
	/**
	 * 고객 삭제하기
	 */

	@Override
	public void removeUserId(long id) {
		String sql = "DELETE FROM Customer WHERE id =?";
		
		jdbcTemplate.update(sql, id);
		
	}
	
	/**
	 * 고객 아이디로 검색하기
	 */
	@Override
	public User findUserById(long id) {
		String sql = "SELECT id, name, phone, birth, point, regDate FROM Customer WHERE id= ?";
		
		return jdbcTemplate.queryForObject(sql, new UserRowMapper(), id);
	}

	/**
	 * 고객 이름으로 검색히가
	 */
	@Override
	public List<User> findUserByName(String userName) {
		String sql = "SELETE id, name, phone, birth, point, regDate FROM Customer WHERE name = ?";
	
	return jdbcTemplate.query(sql, new UserRowMapper(), userName);
	}




	/**
	 * 고객 생일로 검색하기
	 */
	@Override
	public List<User> findUserByBirth(String birth) {
		String sql = "SELECTE id, name, phone, birth, point, regDate FROM Customer WHERE birth = ?";
		return jdbcTemplate.query(sql, new UserRowMapper(), birth);
	}
	
}
