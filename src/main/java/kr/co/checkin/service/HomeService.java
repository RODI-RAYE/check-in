package kr.co.checkin.service;

import java.util.List;

import kr.co.checkin.model.Home;
import kr.co.checkin.util.Pager;

public interface HomeService {
	
	List<Home> list(Pager pager);

	void add(Home item);

	Home item(int code);

	void update(Home item);

	void delete(int code);

	boolean deleteImage(int code);
}
