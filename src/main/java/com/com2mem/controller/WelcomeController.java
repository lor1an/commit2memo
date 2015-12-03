package com.com2mem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String welcome(ModelMap model) {
        System.out.println("hello");
        return "UserManagement";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model) {
        System.out.println("hi");
        return "login";
    }
    
    @RequestMapping(value = "/card", method = RequestMethod.GET)
    public String card(ModelMap model) {
        return "card";
    }
    
    
    @RequestMapping(value = "/trainings", method = RequestMethod.GET)
    public String trainings(ModelMap model) {
        return "trainings";
    }
    
    @RequestMapping(value = "/decks", method = RequestMethod.GET)
    public String decks(ModelMap model) {
        return "decks";
    }
    
    @RequestMapping(value = "/cards", method = RequestMethod.GET)
    public String cards(ModelMap model) {
        return "cards";
    }
    
    

}