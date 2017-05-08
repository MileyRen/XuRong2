package org.ecnu.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.ecnu.orm.ChannelHis;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.service.ChannelHisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("channelHisController")
public class ChannelHisController {
	@Autowired
	private ChannelHisService channelHisService;
	
	@RequestMapping("/to_channelhis_page_3")
	public String channelPage()
	{
		return "ChannelHisSearch";
	}
	
	@RequestMapping("/do_channelhis_search_3")
	public ModelAndView channelSearch(@RequestParam("PageNo") int pageNo,ChannelHis ci, @RequestParam("mintime") String mint, @RequestParam("maxtime") String maxt) throws IllegalArgumentException, IllegalAccessException{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelHisSearch");
		
		List<Date> tlist = new ArrayList<Date>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		
		Date ltime = new Date();
		Date rtime = new Date();
		
		if(mint.trim().equals("")||mint.trim().length()==0)
		{
			try {
				ltime=sdf.parse("2013-03-08 00:00:01");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				ltime=sdf.parse(mint.substring(0, 4)+"-"+mint.substring(4, 6)+"-"+mint.substring(6)+" "+"00:00:01");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(maxt.trim().equals("")||maxt.trim().length()==0)
		{
			rtime=now;
		}else{
			try {
				rtime=sdf.parse(maxt.substring(0, 4)+"-"+maxt.substring(4, 6)+"-"+maxt.substring(6)+" "+"23:59:59");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mav.addObject("cilist", channelHisService.searchByLike(ci, ltime, rtime, pageNo));
		long rows = channelHisService.countRowsByLike(ci, ltime, rtime);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("p", ci);
		mav.addObject("ltime",mint);
		mav.addObject("rtime",maxt);
		return mav;
	}
}
