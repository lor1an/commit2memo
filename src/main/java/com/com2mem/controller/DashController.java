package com.com2mem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DashController {

	@RequestMapping(value = {"/dashboard"}, method = RequestMethod.GET)
	public String getDashboard(ModelMap model) {
		return "dashboard";
	}
	
	@RequestMapping(value = {"/dashboard2"}, method = RequestMethod.GET)
    public String getDashboard2(ModelMap model) {
        return "dashboard2";
    }
	
	@RequestMapping(value = "/heatmap", method = RequestMethod.GET)
	public String getHeatmap(ModelMap model) {
		return "heatmap";
	}
}
