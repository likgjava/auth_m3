package com.likg.common.dao;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TreeDao {
	
	/**菜单记录号前缀字符*/
	public static final String MENU_PREFIX = "M";
	/**资源记录号前缀字符*/
	public static final String RESOURCE_PREFIX = "R";
	/**商品分类记录号前缀字符*/
	public static final String GOODS_CLASS_PREFIX = "G";

	@Resource
	private JdbcTemplate jdbcTemplate;
	
	public String getSequenceNo(String tableName, String prefix) {
		String sequenceNo = prefix;
		String sql = "select MAX(SUBSTRING(id, -2)) from "+tableName+" where id like '"+prefix+"__'";
		Integer result = this.jdbcTemplate.queryForObject(sql, Integer.class);
		if(result!=null) {
			int num = Integer.parseInt(result.toString()) + 1;
			sequenceNo += (num<10 ? "0" : "") + num;
		} else {
			sequenceNo += "01";
		}
		return sequenceNo;
	}
	
	public void removeAll(final String objId, String tableName) throws Exception {
		//获取当前实体类的类名
		//final String className = "auth_resource";
		
		//删除节点及其所有子孙节点
		String hql = "delete from "+tableName;
		if(!StringUtils.isBlank(objId)) {
			hql += " where id like '" + objId + "%'";
		}
		this.jdbcTemplate.execute(hql);
		
		//如果该节点无兄弟节点，则修改父节点的isLeaf属性的值
		if(!StringUtils.isBlank(objId) && objId.length()>3){
			String parentId = objId.substring(0, objId.length()-2);
			String sql = "select count(m.id) from "+tableName+" m where m.parent_id='"+parentId+"'";
			Integer result = this.jdbcTemplate.queryForObject(sql, Integer.class);
			if(result!=null && Integer.parseInt(result.toString())==0) {
				sql = "update "+tableName+" set is_leaf = 1 where id =?";
				this.jdbcTemplate.update(sql, parentId);
			}
		}
	}
}