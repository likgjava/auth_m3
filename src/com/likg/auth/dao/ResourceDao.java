package com.likg.auth.dao;

import java.util.List;

public interface ResourceDao {

	/**
	 * 根据角色获取资源id列表
	 * @param roleId 角色id
	 * @return
	 */
	List<String> getResIdListByRole(String roleId) throws Exception;

	/**
	 * 为角色分配资源
	 * @param roleId 角色id
	 * @param resIds 资源ids
	 * @throws Exception
	 */
	void allotResource(String roleId, String[] resIds) throws Exception;

}
