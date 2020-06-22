package org.zerock.dao;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

public interface UserDAO {
	public UserVO login(LoginDTO dto)throws Exception;
}
