package kr.co.checkin.dao;

import kr.co.checkin.model.Photo;

public interface PhotoDao {

	void add(Photo image);

	boolean delete(int code);

}
