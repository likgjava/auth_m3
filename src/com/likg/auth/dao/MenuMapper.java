package com.likg.auth.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.likg.auth.domain.Menu;
import com.likg.auth.domain.Resource;
import com.likg.auth.domain.User;
import com.likg.framework.DynamicDataSource;
import com.likg.framework.annotation.DataSource;

@Repository
public interface MenuMapper {
	

	public List<Resource> getResourceList();

	public List<Menu> getMenuList(int parentId);
	
	
}
