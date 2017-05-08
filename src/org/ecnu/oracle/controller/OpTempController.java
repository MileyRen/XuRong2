package org.ecnu.oracle.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.ecnu.oracle.dao.OpTempDao;
import org.ecnu.oracle.orm.OpTemp;
import org.ecnu.oracle.service.OpTempService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("opTempController")
public class OpTempController {
	@Autowired
	private OpTempService opTempService;
	
	@RequestMapping("/to_optemp_page_3")
	public String OPPage()
	{
		return "SearchOpTemp";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_optemp_search_3")
	public ModelAndView optempSearch(OpTemp opt, @RequestParam("PageNo") int pageNo)
	{
//		System.out.println("isclick "+isclick);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SearchOpTemp");
		System.out.println("opt.getTableName():"+opt.getTableName());
		System.out.println("opt.getOp():"+opt.getOp());
		System.out.println("opt.getLastTime():"+opt.getLastTime());
//		System.out.println("optem:"+opt.toString());
		List<OpTemp> otlist = new ArrayList<OpTemp>();
		otlist = (List<OpTemp>) opTempService.searchByLike(opt, pageNo);
		mav.addObject("oplist", otlist);
		long rows = opTempService.countRowsByLike(opt);
		System.out.println("rows:"+rows);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("ot", opt);
//		String datetime=new SimpleDateFormat("yyyyMMddHH24mmSS").format(Calendar.getInstance().getTime()).substring(0, 14);
//		long ltime = Long.parseLong(datetime);
//		mav.addObject("ltime", ltime);
		return mav;
	}
	
	@RequestMapping("/do_optemp_update_0")	//更新SQL表并删除oracle的optemp表
	public String nodeInfoUpdate(OpTemp opTemp)
	{		
		opTempService.update(opTemp);
		return "SearchOpTemp";
	}
	
	@RequestMapping("/do_optemp_delete_2")
	public String optempdelete(@RequestParam("check")List<BigDecimal> mycheck)
	{
		opTempService.deleteMoreByHql(mycheck);
		return "SearchOpTemp";
	}
}
