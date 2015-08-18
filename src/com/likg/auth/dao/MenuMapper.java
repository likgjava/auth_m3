package com.likg.auth.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.likg.auth.domain.Menu;

@Repository
public interface MenuMapper {
	

	public List<Menu> getResourceList();

	public List<Menu> getNavigateMenuTree(String parentId, int userId);
	
	

	public List<Menu> getMenuListByParentId(String pid);

	public Menu get(String id);

	public void save(Menu Menu);

	public void update(Menu parentResource);

	public void update2(Menu oldResource);

	public void removeAll(String id);
	
}
