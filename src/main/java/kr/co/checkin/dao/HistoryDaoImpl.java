package kr.co.checkin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.checkin.model.History;
import kr.co.checkin.util.Pager;

@Repository
public class HistoryDaoImpl implements HistoryDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public List<History> list(Pager pager) {
		return sql.selectList("history.list", pager);
	}

	@Override
	public void add(History item) {
		sql.insert("history.add", item);
	}

	@Override
	public History item(int code) {
		return sql.selectOne("history.item", code);
	}

	@Override
	public void update(History item) {
		sql.update("history.update", item);
	}

	@Override
	public void delete(int code) {
		sql.delete("history.delete", code);
	}


}
