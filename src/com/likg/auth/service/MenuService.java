package com.likg.auth.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.likg.auth.dao.MenuMapper;
import com.likg.auth.domain.Menu;

@Service
public class MenuService {
	
	@javax.annotation.Resource
	private MenuMapper menuMapper;

	public List<Menu> getMenuList(Integer parentId) {
		return menuMapper.getMenuList(parentId==null ? 0 : parentId);
	}
	
}
