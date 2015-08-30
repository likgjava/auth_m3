package com.likg.msg.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.likg.auth.domain.User;
import com.likg.framework.DynamicDataSource;
import com.likg.framework.annotation.DataSource;
import com.likg.msg.domain.InsideLetter;

@Repository
public interface InsideLetterMapper {
	
	@Select("SELECT * FROM auth_user WHERE id=#{id}")
	User get(int id);

	
	public User getUser(int id);

	public List<User> getUserList();
	
	public void saveUser(User user);
	public void saveUserRole(User user);
	
	public void updateUser(User user);

	public void deleteUser(int id);

	//@DataSource(DynamicDataSource.SLAVE)
	public List<InsideLetter> getInboxPage(int userId, RowBounds rowBounds);

	public Integer getInboxCount(int userId);
	

	public void deleteUserRole(int id);

	@DataSource(DynamicDataSource.SLAVE)
	public Integer getMaxGoodsId();

	public List<Map<String, Object>> getUserByUserName(String username);
	
}
