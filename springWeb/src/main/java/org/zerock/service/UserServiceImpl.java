package org.zerock.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.dao.UserDAO;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

@Service
public class UserServiceImpl implements UserService{
	@Inject
	UserDAO dao;
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

}
