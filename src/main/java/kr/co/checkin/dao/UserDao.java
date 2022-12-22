package kr.co.checkin.dao;

import kr.co.checkin.model.User;

public interface UserDao {

	void add(User user);

	int checkId(String id);

	User item(User user);

}
