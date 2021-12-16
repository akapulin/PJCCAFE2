package cafe.pj.jvx330.menu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.pj.jvx330.domain.Menu;
import cafe.pj.jvx330.menu.dao.MenuDao;
import cafe.pj.jvx330.web.util.Validator;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	
	@Resource(name="menuDao")
	private MenuDao md;
	
	@Autowired
	private Validator validator;

	@Transactional
	@Override
	public Menu addMenu(Menu menu) {
		md.addMenu(menu);
		return findLastMenuByMenuType(menu.getMenuType());
		// 마지막거를 가져오면 더 빠르다.
	}

	@Override
	public Menu findMenuById(long id) {
		return md.findMenuById(id);
	}

	@Override
	public List<Menu> findAllMenuByMenuName(String menuName) {
		return md.findAllMenuByMenuName(menuName);
	}

	@Override
	public List<Menu> findAllMenus() {
		return md.findAllMenus();
	}

	@Override
	public List<Menu> findAllMenusByMenuType(char menuType) {
		return md.findAllMenusByMenuType(menuType);
	}

	@Override
	public Menu updateMenuById(Menu menu) {
		md.updateMenuById(menu);
		return menu;
	}

	@Override
	public void removeMenuById(long id) {
		md.removeMenuById(id);
	}

	@Override
	public Menu findLastMenuByMenuType(char menuType) {
		return md.findLastMenuByMenuType(menuType);
	}

	@Transactional
	@Override
	public boolean isMenuName(String menuName) {
		Menu menu = md.findMenuByMenuName(menuName);
		if (validator.isEmpty(menu)) {
			return false;
		}
		return true;
	}
	
	
}
