package kr.co.checkin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.checkin.dao.UserDao;
import kr.co.checkin.model.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserDao dao;

	@Override
	public void add(User user) {
		dao.add(user);
	}

	@Override
	public boolean checkId(String id) {
		if(dao.checkId(id) == 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean login(User user) {
		User item = dao.item(user);
		
		if(item != null) {
			user.setPw(null);
			user.setEmail(item.getEmail());
			
			return true;
		}
		return false;
	}
}
