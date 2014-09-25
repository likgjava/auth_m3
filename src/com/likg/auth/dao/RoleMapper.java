package com.likg.auth.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.likg.auth.domain.Role;

@Repository
public interface RoleMapper {
	
	public Role getRole(int id) throws Exception;

	public List<Role> getRoleList() throws Exception;
	
	public void saveRole(Role role) throws Exception;
	
	public void updateRole(Role role);

	public void deleteRole(int id);
	/**
	 * 根据角色删除被分配的用户角色数据
	 * @param roleId 角色id
	 * @author likaige
	 * @create 2014年3月20日 上午9:24:54
	 */
	public void deleteUserRole(int roleId);

	public List<Role> getPage(Role role, RowBounds rowBounds) throws Exception;

	public Integer getCount(Role role) throws Exception;

	public List<Role> getRoleListByUser(int userId);

	
}
