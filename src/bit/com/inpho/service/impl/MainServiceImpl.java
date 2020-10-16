package bit.com.inpho.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.inpho.dao.MainDao;
import bit.com.inpho.dto.MainPostDto;
import bit.com.inpho.service.MainService;
@Service
public class MainServiceImpl implements MainService{
	@Autowired
	MainDao dao;
	
	@Override
	public List<MainPostDto> getNewFeed() {
		return dao.getNewFeed();
	}

}