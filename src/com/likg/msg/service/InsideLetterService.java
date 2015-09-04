package com.likg.msg.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.likg.auth.domain.Resource;
import com.likg.auth.domain.Role;
import com.likg.auth.domain.User;
import com.likg.common.domain.EasyuiPage;
import com.likg.msg.dao.InsideLetterMapper;
import com.likg.msg.domain.InsideLetter;
import com.likg.msg.domain.InsideLetterUser;
import com.likg.security.AuthenticationHelper;

@Service
public class InsideLetterService {
	
	@javax.annotation.Resource
	private InsideLetterMapper insideLetterMapper;
	
	public EasyuiPage<InsideLetter> getPage(EasyuiPage<InsideLetter> page, String boxType) throws Exception {
		
		int userId = AuthenticationHelper.getCurrentUser().getId();
		
		if("inbox".equals(boxType)){
			Integer totalCount = insideLetterMapper.getInboxCount(userId);
			page.setTotal(totalCount);
			if(totalCount > 0) {
				RowBounds rowBounds = new RowBounds(page.getIndex(), page.getPageSize());
				List<InsideLetter> list = insideLetterMapper.getInboxPage(userId, rowBounds);
				page.setResult(list);
			}
		}else{
			Integer totalCount = insideLetterMapper.getOutboxCount(userId);
			page.setTotal(totalCount);
			if(totalCount > 0) {
				RowBounds rowBounds = new RowBounds(page.getIndex(), page.getPageSize());
				List<InsideLetter> list = insideLetterMapper.getOutboxPage(userId, rowBounds);
				page.setResult(list);
			}
		}
		
		
		
		return page;
	}

	
	public User getUser(int id) throws Exception {
		return insideLetterMapper.getUser(id);
	}
	
	public List<User> getUserList() throws Exception {
		return insideLetterMapper.getUserList();
	}

	@Transactional
	public void saveUser(InsideLetter insideLetter) throws Exception {
		insideLetter.setCreateTime(new Timestamp(System.currentTimeMillis()));
		
		insideLetterMapper.saveUser(insideLetter);
		//保存角色信息
		for(InsideLetterUser u : insideLetter.getRecipientList()){
			u.setInsideLetterId(insideLetter.getId());
		}
		insideLetterMapper.saveUserRole(insideLetter.getRecipientList());
	}

	public void delete(int id) throws Exception {
		insideLetterMapper.deleteUser(id);
		
	}


	public User getUserByUserName(String username) {
		List<Map<String, Object>> list = insideLetterMapper.getUserByUserName(username);
		
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
