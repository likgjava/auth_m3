package com.likg.auth.service;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.likg.auth.dao.MenuMapper;
import com.likg.auth.domain.Menu;
import com.likg.core.util.TreeSequenceUtil;

@Service
public class MenuService {
	
	@javax.annotation.Resource
	private MenuMapper menuMapper;
	
	@javax.annotation.Resource
	private TreeSequenceUtil treeSequenceUtil;

	public List<Menu> getMenuList2(String parentId) {
		return menuMapper.getMenuList2(parentId);
	}
	

	public List<Menu> getMenuList(String parentId) {
		return menuMapper.getMenuListByParentId(parentId);
	}

	public Menu get(String id) {
		return menuMapper.get(id);
	}

	public void saveMenu(Menu Menu) {
		//新增
		if(StringUtils.isBlank(Menu.getId())) {
			//修改父节点isLeaf的属性值
			String parentId = Menu.getParentId();
			if(!StringUtils.isBlank(parentId)) {
				Menu parentMenu = menuMapper.get(parentId);
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
			String prefix = (StringUtils.isBlank(parentId) ? TreeSequenceUtil.MENU_PREFIX : parentId);
			Menu.setId(treeSequenceUtil.getSequenceNo(Menu.class, prefix));
			menuMapper.save(Menu);
			
		}
		//修改
		else {
			Menu oldMenu = menuMapper.get(Menu.getId());
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
		treeSequenceUtil.removeAll(objId, "auth_menu");
		
	}
	
}
