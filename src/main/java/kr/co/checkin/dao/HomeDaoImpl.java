package kr.co.checkin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.checkin.model.Home;
import kr.co.checkin.util.Pager;

@Repository
public class HomeDaoImpl implements HomeDao {
	
	@Autowired
	SqlSession sql;
	
	@Override
	public List<Home> list(Pager pager) {
		return sql.selectList("home.list", pager);
	}

	@Override
	public void add(Home item) {
		sql.insert("home.add", item);
	}

	@Override
	public Home item(int code) {
		return sql.selectOne("home.item", code);
	}

	@Override
	public void update(Home item) {
		sql.update("home.update", item);
	}

	@Override
	public void delete(int code) {
		sql.delete("home.delete", code);
	}
}
