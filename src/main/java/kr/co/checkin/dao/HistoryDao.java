package kr.co.checkin.dao;

import java.util.List;

import kr.co.checkin.model.History;
import kr.co.checkin.util.Pager;

public interface HistoryDao {

	List<History> list(Pager pager);

	void add(History item);

	History item(int code);

	void update(History item);

	void delete(int code);
}
