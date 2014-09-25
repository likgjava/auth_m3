package com.likg.auth.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.likg.auth.dao.UserMapper;
import com.likg.auth.domain.EasyuiPage;
import com.likg.auth.domain.User;
import com.likg.framework.DynamicDataSource;

@Service
public class UserService {
	
	@Resource
	private UserMapper userMapper;
	
	public EasyuiPage<User> getPage(EasyuiPage<User> page, User user) throws Exception {
		Integer totalCount = userMapper.getCount(user);
		page.setTotal(totalCount);
		if(totalCount > 0) {
			RowBounds rowBounds = new RowBounds(page.getIndex(), page.getPageSize());
			List<User> userList = userMapper.getPage(user, rowBounds);
			page.setResult(userList);
		}
		
		DynamicDataSource.setRoute(DynamicDataSource.SLAVE);
		int maxId = userMapper.getMaxGoodsId();
		System.out.println("maxId==="+maxId);
		
		return page;
	}

	
	public User getUser(int id) throws Exception {
		return userMapper.getUser(id);
	}
	
	public List<User> getUserList() throws Exception {
		return userMapper.getUserList();
	}

	@Transactional
	public void saveUser(User user) throws Exception {
		// 新增
		if (user.getId() == 0) {
			//保存用户信息
			userMapper.saveUser(user);
			//保存角色信息
			userMapper.saveUserRole(user);
		}
		// 修改
		else {
			//修改用户信息
			userMapper.updateUser(user);
			//删除旧的角色
			userMapper.deleteUserRole(user.getId());
			//保存角色信息
			userMapper.saveUserRole(user);
		}		
	}

	public void delete(int id) throws Exception {
		userMapper.deleteUser(id);
	}

	

}
