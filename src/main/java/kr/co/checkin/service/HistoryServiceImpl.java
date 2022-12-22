package kr.co.checkin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.checkin.dao.HistoryDao;
import kr.co.checkin.model.History;
import kr.co.checkin.util.Pager;

@Service
public class HistoryServiceImpl implements HistoryService {
	
	@Autowired
	HistoryDao dao;

	@Override
	public List<History> list(Pager pager) {		
		return dao.list(pager);
	}

	@Override
	public void add(History item) {		
		dao.add(item);
	}

	@Override
	public History item(int code) {		
		return dao.item(code);
	}

	@Override
	public void update(History item) {		
		dao.update(item);
	}

	@Override
	public void delete(int code) {		
		dao.delete(code);
	}


}
