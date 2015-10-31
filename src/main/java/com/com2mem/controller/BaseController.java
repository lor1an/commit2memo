package com.com2mem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.com2mem.dao.UsrDao;
import com.com2mem.model.Usr;

@Controller
public class BaseController {
	
	@Autowired
	UsrDao usrDao;
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView welcome(ModelMap model) {

        Usr peter = new Usr("Tony", "Stark");
        Usr nasta = new Usr("Steve", "Rogers");

        usrDao.save(peter);
        usrDao.save(nasta);
        
        List<Usr> persons = (List<Usr>) usrDao.findAll();
        for (Usr person : persons) {
            System.out.println(person);
        }
        
        List<Usr> personsByLogin = usrDao.findByLogin("Peter");

        for (Usr person : personsByLogin) {
            System.out.println(person);
        }
        
        return new ModelAndView("index");
    }

	public UsrDao getUserDao() {
		return usrDao;
	}

	public void setUserDao(UsrDao userDaoImpl) {
		this.usrDao = userDaoImpl;
	}



}