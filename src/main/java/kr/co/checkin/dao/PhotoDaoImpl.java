package kr.co.checkin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.checkin.model.Photo;

@Repository
public class PhotoDaoImpl implements PhotoDao {
	
	@Autowired
	SqlSession sql;

	@Override
	public void add(Photo image) {
		sql.insert("photo.add", image);
	}

	@Override
	public boolean delete(int code) {
		if(sql.delete("photo.delete", code) > 0)
			return true;
		
		else
			return false;
	}

}
