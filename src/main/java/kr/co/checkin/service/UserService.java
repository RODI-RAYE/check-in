package kr.co.checkin.service;

import kr.co.checkin.model.User;

public interface UserService {

	void add(User user);

	boolean checkId(String id);

	boolean login(User user);
}
