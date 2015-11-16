package com.com2mem.service;

import com.com2mem.model.Usr;

public interface UsrService {
	
	Usr addUsr();
	Usr getUsrByLogin();
	Usr getUsrById();
	Usr editUsr();
	
}
