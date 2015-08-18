package com.likg.auth.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.likg.auth.dao.MenuMapper;
import com.likg.auth.domain.Menu;
import com.likg.common.dao.TreeDao;

@Service
public class MenuService {
	
	@javax.annotation.Resource
	private MenuMapper menuMapper;
	
	@javax.annotation.Resource
	private TreeDao treeDao;

	public List<Menu> getNavigateMenuTree(String parentId, int userId) {
		return menuMapper.getNavigateMenuTree(parentId, userId);
	}
	

	public List<Menu> getMenuList(String parentId) {
		return menuMapper.getMenuListByParentId(parentId);
	}

	public Menu getMenu(String id) {
		Menu menu = menuMapper.getMenu(id);
		if(menu.getParentId() != null){
			menu.setParent(menuMapper.getMenu(menu.getParentId()));
		}
		return menu;
	}

	public void saveMenu(Menu Menu) {
		//新增
		if(StringUtils.isBlank(Menu.getId())) {
			//修改父节点isLeaf的属性值
			String parentId = Menu.getParentId();
			if(!StringUtils.isBlank(parentId)) {
				Menu parentMenu = menuMapper.getMenu(parentId);
				if(parentMenu.getIsLeaf()) {
					parentMenu.setIsLeaf(false);
					menuMapper.update(parentMenu);
				}
			}
			
			//保存节点对象
			Menu.setIsLeaf(true);
			if(StringUtils.isBlank(parentId)) {
				Menu.setParentId(null);
			}
			String prefix = (StringUtils.isBlank(parentId) ? treeDao.MENU_PREFIX : parentId);
			Menu.setId(treeDao.getSequenceNo("auth_menu", prefix));
			menuMapper.save(Menu);
			
		}
		//修改
		else {
			Menu oldMenu = menuMapper.getMenu(Menu.getId());
			oldMenu.setMenuName(Menu.getMenuName());
			oldMenu.setResId(Menu.getResId());
			menuMapper.update2(oldMenu);
		}
	}
	
	/**
	 * 删除节点及其所有子孙节点
	 * @param objId
	 */
	@Transactional
	public void removeAll(String objId) throws Exception {
		//删除节点及其所有子孙节点
		treeDao.removeAll(objId, "auth_menu");
		
	}
	
}
