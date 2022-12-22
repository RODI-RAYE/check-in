package kr.co.checkin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.checkin.dao.HomeDao;
import kr.co.checkin.dao.PhotoDao;
import kr.co.checkin.model.Home;
import kr.co.checkin.model.Photo;
import kr.co.checkin.util.Pager;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	HomeDao dao;
	
	@Autowired
	PhotoDao photoDao;

	@Override
	public List<Home> list(Pager pager) {
		return dao.list(pager);
	}
	
	@Override
	@Transactional
	public void add(Home item) {
		dao.add(item);
		
		if(item.getImages() != null) {
			for(Photo image : item.getImages()) {
				image.setCode(item.getCode());
				
				photoDao.add(image);
			}
		}
	}

	@Override
	public Home item(int code) {
		return dao.item(code);
	}

	@Override
	public void update(Home item) {
		dao.update(item);
		
		if(item.getImages() != null) {
			for(Photo image : item.getImages()) {
				image.setCode(item.getCode());
				
				photoDao.add(image);
			}
		}
	}

	@Override
	@Transactional
	public void delete(int code) {
		Home item = dao.item(code);
		for(Photo image : item.getImages())
			photoDao.delete(image.getCode());
		
		dao.delete(code);
	}

	@Override
	public boolean deleteImage(int code) {
		
		return photoDao.delete(code);
	}
}
