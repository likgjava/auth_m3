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
import com.likg.msg.domain.InsideLetterUser;

@Repository
public interface InsideLetterMapper {
	
	@Select("SELECT * FROM inside_letter WHERE id=#{id}")
	InsideLetter get(int id);

	
	public InsideLetter getInsideLetter(int id);

	public List<User> getUserList();
	
	public void saveUser(InsideLetter insideLetter);
	public void saveUserRole(List<InsideLetterUser> list);
	
	public void updateUser(User user);

	public void deleteUser(int id);

	//@DataSource(DynamicDataSource.SLAVE)
	public List<InsideLetter> getInboxPage(int userId, RowBounds rowBounds);

	public Integer getInboxCount(int userId);
	
	public List<InsideLetter> getOutboxPage(int userId, RowBounds rowBounds);

	public Integer getOutboxCount(int userId);
	

	public void deleteUserRole(int id);

	@DataSource(DynamicDataSource.SLAVE)
	public Integer getMaxGoodsId();

	public List<Map<String, Object>> getUserByUserName(String username);
	
}
