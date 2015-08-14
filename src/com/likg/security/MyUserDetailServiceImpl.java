package com.likg.security;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.likg.auth.domain.Resource;
import com.likg.auth.domain.Role;
import com.likg.auth.domain.User;
import com.likg.auth.service.UserService;

//@SuppressWarnings("deprecation")
public class MyUserDetailServiceImpl implements UserDetailsService {

	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * 根据用户名获取用户的详细信息
	 * @param username 用户名
	 * @return 用户详细信息
	 */
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("username is " + username);
		User myUser = null;
		
		try {
			myUser = this.userService.getUserByUserName(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (myUser == null) {
			throw new UsernameNotFoundException(username);
		}
		
		Set<GrantedAuthority> grantedAuths = this.obtionGrantedAuthorities(myUser);
		myUser.setAuthorities(grantedAuths);
		myUser.setAccountNonExpired(true);
		myUser.setAccountNonLocked(true);
		myUser.setCredentialsNonExpired(true);
		myUser.setEnabled(true);

		return myUser;
	}

	// 取得用户的权限
	private Set<GrantedAuthority> obtionGrantedAuthorities(User user) {
		Set<GrantedAuthority> authSet = new HashSet<GrantedAuthority>();
		
		List<Role> roles = user.getRoleList();
		for (Role role : roles) {
			Set<Resource> tempRes = role.getResourceSet();
			for (Resource res : tempRes) {
				authSet.add(new SimpleGrantedAuthority(res.getResName()));
			}
		}
		
		return authSet;
	}
}