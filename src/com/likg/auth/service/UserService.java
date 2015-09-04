package com.likg.auth.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.likg.auth.dao.UserMapper;
import com.likg.auth.domain.Resource;
import com.likg.auth.domain.Role;
import com.likg.auth.domain.User;
import com.likg.common.domain.EasyuiPage;

@Service
public class UserService {
	
	@javax.annotation.Resource
	private UserMapper userMapper;
	
	public EasyuiPage<User> getPage(EasyuiPage<User> page, User user) throws Exception {
		
		User user11 = this.userMapper.get(1);
		System.out.println(user11);
		
		
		Integer totalCount = userMapper.getCount(user);
		page.setTotal(totalCount);
		if(totalCount > 0) {
			RowBounds rowBounds = new RowBounds(page.getIndex(), page.getPageSize());
			List<User> userList = userMapper.getPage(user, rowBounds);
			page.setResult(userList);
		}
		
		Integer maxId = userMapper.getMaxGoodsId();
		System.out.println("maxId==="+maxId);
		
		return page;
	}

	
	public User getUser(int id) throws Exception {
		return userMapper.get(id);
	}
	
	public User getUser(String username) {
		return userMapper.getUser(username);
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


	public User getUserByUserName(String username) {
		List<Map<String, Object>> list = userMapper.getUserByUserName(username);
		
		if(list.isEmpty()){
			return null;
		}
		
		User user = new User();
		Map<Integer, Role> roleMap = new HashMap<Integer, Role>();
		for(Map<String, Object> map : list){
			Integer id = (Integer) map.get("id");
			String resId = (String) map.get("resId");
			Integer roleId = (Integer) map.get("role_id");
			String resName = (String) map.get("res_name");
			String resUrl = (String) map.get("res_url");
			String password = (String) map.get("password");
			
			user.setId(id);
			user.setUserName(username);
			user.setPassword(password);
			
			Role r = null;
			if(!roleMap.containsKey(roleId)){
				r = new Role();
				r.setId(roleId);
				roleMap.put(roleId, r);
			}
			r = roleMap.get(roleId);
			
			Resource res = new Resource();
			res.setId(resId);
			res.setResName(resName);
			res.setResUrl(resUrl);
			r.getResourceSet().add(res);
		}
		
		user.getRoleList().addAll(roleMap.values());
		return user;
	}


	

	

}
