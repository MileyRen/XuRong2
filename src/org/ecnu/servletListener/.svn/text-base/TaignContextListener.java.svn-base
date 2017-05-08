package org.ecnu.servletListener;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.ecnu.task.TaignTask;
//import org.ecnu.task.XuRong2Task;
import org.ecnu.task.XuRong2Task;

public class TaignContextListener implements ServletContextListener {

	Timer timer = new Timer();
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		timer.cancel();
		
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
//		timer = new Timer(true);
//		timer.schedule(new XuRong2Task(event.getServletContext()),0,1000*180);
//		timer.schedule(new TaignTask(event.getServletContext()),0,1000*120);
	}

}
