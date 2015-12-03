package com.com2mem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {

        ModelAndView model = new ModelAndView();
        model.addObject("title", "Spring Security Custom Login Form");
        model.addObject("message", "This is protected page!");
        model.setViewName("admin");

        return model;

    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(ModelMap model) {
        return "card";
    }
    
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }

        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("login");

        return model;

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