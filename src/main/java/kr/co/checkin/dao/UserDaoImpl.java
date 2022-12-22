package kr.co.checkin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.checkin.model.User;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public void add(User user) {
		sql.insert("user.add", user);
	}

	@Override
	public int checkId(String id) {
		return sql.selectOne("user.check_id", id);
	}

	@Override
	public User item(User user) {
		return sql.selectOne("user.login", user);
	}
}
