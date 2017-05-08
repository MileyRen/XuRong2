package org.ecnu.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.NodeMapping;
import org.ecnu.orm.Sale;
import org.ecnu.orm.Users;
import org.ecnu.service.ChannelInfoService;
import org.ecnu.service.NodeInfoService;
import org.ecnu.service.NodeMappingService;
import org.ecnu.service.SaleService;
import org.ecnu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("saleController")
public class SaleController {
	@Autowired
	private ChannelInfoService cis;
	
	@Autowired
	private NodeInfoService nis;
	
	@Autowired
	private NodeMappingService nms;
	
	@Autowired
	private SaleService ss;

	@Autowired
	private UserService us;
	
	@RequestMapping("/to_mysale_page_3")
	public ModelAndView mysalePage(ServletRequest request)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MySalePage");
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		String ename = user.getEmployeeName();

		List<Sale> slist = new ArrayList<Sale>();
		
		List<NodeMapping> nmlist = new ArrayList<NodeMapping>();
		nmlist = nms.searchAllByEname(ename);
		
		for(int i=0; i< nmlist.size(); i++){
			List<ChannelInfo> cilist = new ArrayList<ChannelInfo>();
			cilist = cis.searchAllByNodeId(nmlist.get(i).getNodeId());
			for(int k=0; k<cilist.size(); k++){
				if(cilist.get(k).getIsSpecial().equals("2")){
					Sale s = new Sale();
					s.setChannelId(cilist.get(k).getChannelId());
					s.setEmployeeName(ename);
					s.setNodeId(nmlist.get(i).getNodeId());
					s.setNodeName(nmlist.get(i).getNodeName());
					s.setWareName(cilist.get(k).getWareName());
					
					slist.add(s);
				}
			}
		}
		mav.addObject("ename", ename);
		mav.addObject("slist", slist);
		return mav;
	}
	
	@RequestMapping("/do_mysale_add_0")
	public ModelAndView mysaleSearch(@RequestParam("Time") String time, @RequestParam("ename") String ename, @RequestParam("nodeId") List<String> nis, @RequestParam("nodeName") List<String> nns, @RequestParam("channelId") List<String> cis, @RequestParam("wareName") List<String> wns, @RequestParam("saleNum") List<Integer> sns, @RequestParam("salePrice") List<Integer> sps, @RequestParam("thoeryPrice") List<Integer> tps) //@RequestParam("year") String y, @RequestParam("month") String m, @RequestParam("day") String d,
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MySalePage");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		
		for(int i=0; i<nis.size(); i++){
			if(sns.get(i)!=0){
				Sale s = new Sale();
				s.setChannelId(nis.get(i));
				s.setEmployeeName(ename);
				s.setNodeId(nis.get(i));
				s.setNodeName(nns.get(i));
				s.setWareName(wns.get(i));
				s.setSaleNum(sns.get(i));
				s.setSalePrice(sps.get(i));
				s.setThoeryPrice(tps.get(i));
				
				s.setLastTime(sdf.format(now));
				s.setYear(time.substring(0, 4));
				s.setMonth(time.substring(5, 7));
				s.setDay(time.substring(8, 10));
				
				ss.insert(s);
			}
		}
		return mav;
	}
	
	@RequestMapping("/to_sale_page_3")
	public ModelAndView tosalePage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SaleSearch");
		
		List<Users> users=us.searchAllEmp();//有效的搜索所有营业员
		mav.addObject("users", users);
		
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_sale_search_3")
	public ModelAndView dosalePage(Sale s)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SaleSearch");
		
		mav.addObject("s", s);
		s.setType("1");
		List<Sale> slist = (List<Sale>) ss.searchAll(s);
		mav.addObject("slist", slist);

		int count = 0;
		for(int i=0; i<slist.size(); i++){
			count+= (slist.get(i).getSaleNum() * (slist.get(i).getThoeryPrice() - slist.get(i).getSalePrice()));
		}
		
		mav.addObject("count", count);
		
		return mav;
	}
	
	@RequestMapping("/do_sale_check_4")
	public ModelAndView dosalecheck(@RequestParam("saleId") List<Long> sis)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("SaleSearch");

		ss.updateStates(sis, "type", 2);

		return mav;
	}
}
