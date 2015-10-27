package com.tatvasoft.dao;

import java.util.List;

import com.tatvasoft.model.User;

public interface IUserDao {
	public void insertData(User user);
	public List<User> listUser();
	public void editUser(User user);
	public void deleteUser(String userName);
	public User getUserByUserName(String userName);
	public User getAuthenticatedUser(String userName, String password);
	


}
