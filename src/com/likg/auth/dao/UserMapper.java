package com.likg.auth.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.likg.auth.domain.User;
import com.likg.framework.DynamicDataSource;
import com.likg.framework.annotation.DataSource;

@Repository
public interface UserMapper {
	
	@Select("SELECT * FROM auth_user WHERE id=#{id}")
	User get(int id);
	
	@Select("SELECT * FROM auth_user WHERE user_name=#{username}")
	User getUser(String username);

	
	public List<User> getUserList();
	
	public void saveUser(User user);
	public void saveUserRole(User user);
	
	public void updateUser(User user);

	public void deleteUser(int id);

	//@DataSource(DynamicDataSource.SLAVE)
	public List<User> getPage(User user, RowBounds rowBounds);

	public Integer getCount(User User);
	

	public void deleteUserRole(int id);

	@DataSource(DynamicDataSource.SLAVE)
	public Integer getMaxGoodsId();

	public List<Map<String, Object>> getUserByUserName(String username);


	
	
}
