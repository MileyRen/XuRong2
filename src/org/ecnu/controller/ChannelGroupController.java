package org.ecnu.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.ecnu.orm.ChannelGroup;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.Depot;
import org.ecnu.orm.DepotHis;
import org.ecnu.orm.MyStock;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.Shipping;
import org.ecnu.orm.Users;
import org.ecnu.orm.Wares;
import org.ecnu.service.ChannelGroupService;
import org.ecnu.service.ChannelInfoService;
import org.ecnu.service.NodeInfoService;
import org.ecnu.service.WaresService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("channelGroupController")
public class ChannelGroupController {
	@Autowired
	private ChannelGroupService cgs;
	
	@Autowired
	private WaresService ws;
	
	@Autowired
	private NodeInfoService nis;
	
	@Autowired
	private ChannelInfoService cis;
	
	@RequestMapping("/to_channelgroup_page_3")
	public ModelAndView channelgroupPage()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupSearch");

		mav.addObject("vnames", cgs.searchAllVersion2());
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/do_channelgroup_search_3")
	public ModelAndView channelgroupSearch(ChannelGroup cg)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupSearch");
		
		mav.addObject("vnames", cgs.searchAllVersion2());
		List<ChannelGroup>cglist = new ArrayList<ChannelGroup>();
		cglist = (List<ChannelGroup>) cgs.searchAll(cg);
		mav.addObject("cglist", cglist);
		mav.addObject("what", cg.getVersionName());
		return mav;
	}
	
	  @SuppressWarnings("unchecked")
	@RequestMapping({"/do_channelgroup_delete_2"})//删除时是否将之前的机器货道项删除--暂时未作
	  public ModelAndView cgDelete(@RequestParam("check") List<Long> mycheck)
	  {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("ChannelGroupSearch");

	    //删除channelInfo表中记录
	    for(int i=0; i<mycheck.size(); i++){
	    	ChannelGroup cg = (ChannelGroup) cgs.read(mycheck.get(i));
		    NodeInfo ni = new NodeInfo();
			ni.setVersionName(cg.getVersionName());
			ni.setNodeFrom("2");
			
			List<NodeInfo> nilist =(List<NodeInfo>) nis.searchAll(ni);
			for(int j=0; j<nilist.size(); j++){
				ChannelInfo ci = new ChannelInfo();
				ci.setChannelId(cg.getChannelId());
				ci.setNodeInfo(nilist.get(i));
				
				cis.delete(ci);
			}
	    }
	    //删除完成
	    
	    this.cgs.deleteMoreByHql(mycheck); //2013-07-15要先删除channelInfo表中记录后再删除channelGroup表中信息；否则将出现空值错误
	    
	    mav.addObject("vnames", this.cgs.searchAllVersion2());
	    return mav;
	  }
	  
	@RequestMapping("/to_channelgroup_add_1")
	public ModelAndView channelgroupAdd()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupAdd");

		mav.addObject("wslist", ws.searchAllWare());
		return mav;
	}
	
	@RequestMapping("/do_channelgroup_add_1")
	public ModelAndView cginsert(@RequestParam("versionName") String vname, @RequestParam("wid") List<Long> wids, @RequestParam("cid") List<String> cids, @RequestParam("ns") List<Integer> nss, @RequestParam("so") List<Integer> sos, @RequestParam("ty") List<String> tys) throws IOException
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupAdd");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		
		for(int i=0; i<wids.size(); i++){
			ChannelGroup cg = new ChannelGroup();
			cg.setWares((Wares) ws.read(wids.get(i)));
			cg.setChannelId(cids.get(i));
			cg.setNormalStock(nss.get(i));
			cg.setVersionName(vname);
			cg.setType(tys.get(i));
			cg.setLastTime(sdf.format(now));
			cg.setStdOut(sos.get(i));
			
			cgs.insert(cg);
		}
	return mav;
	}
	
	@RequestMapping("/to_channelgroup_addchann_1")
	public ModelAndView channelgroupAddChann()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupAddChannel");

		mav.addObject("vnames", cgs.searchAllVersion2());
		mav.addObject("wslist", ws.searchAllWare());
		return mav;
	}
	
	@RequestMapping("/do_channelgroup_addchann_1")//添加后是否将之前的机器添加货道项--暂时未作
	public ModelAndView docgAdd(ChannelGroup cg)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupAddChannel");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		cg.setLastTime(sdf.format(now));
		cgs.insert(cg);

		//为该货道组的售货机添加新的货道; 首先搜索出使用该组的所有售货机；然后再添加
		NodeInfo ni = new NodeInfo();
		ni.setVersionName(cg.getVersionName());
		ni.setNodeFrom("2");
		@SuppressWarnings("unchecked")
		List<NodeInfo> nilist =(List<NodeInfo>) nis.searchAll(ni);
		for(int i=0; i<nilist.size(); i++){
			ChannelInfo ci = new ChannelInfo();
			ci.setChannelId(cg.getChannelId());
			ci.setNodeInfo(nilist.get(i));
			ci.setNormalStock(cg.getNormalStock());
			ci.setWareId(Long.toString(cg.getWares().getWareId()));//两个版本的wareId类型不一致
//			ci.setWareName(cg.getWares().getWareName());//商品名称页面上没有
			Wares w = (Wares) ws.read(cg.getWares().getWareId());
			ci.setWareName(w.getWareName());
			
			ci.setIsSpecial("1");
			ci.setCurrentNumber(0);
			ci.setNormalStock(10);
			
			Date time=new Date();
			
			ci.setLastTime(time);
			cis.insert(ci);
		}
		//添加完成
		
		mav.addObject("vnames", cgs.searchAllVersion2());
		mav.addObject("wslist", ws.searchAllWare());
		return mav;
	}
	
	@RequestMapping("/to_channelgroup_edit_0")
	public ModelAndView tocgEdit(@RequestParam("id") Long cgid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupEdit");

//		ChannelGroup cg = new ChannelGroup();
//		cg.setId(cgid);
//		cg = (ChannelGroup) cgs.search(cg, 0).get(0);
//		mav.addObject("cginfo", (ChannelGroup) cgs.search(cg, 0).get(0));
		mav.addObject("cginfo", cgs.read(cgid));
		mav.addObject("wslist", ws.searchAllWare());
		return mav;
	}
	
	@RequestMapping("/do_channelgroup_edit_0")
	public ModelAndView docgEdit(ChannelGroup cg, @RequestParam("hchannelId") String hchannid)
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupSearch");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date now = new Date();
		cg.setLastTime(sdf.format(now));
		cgs.update(cg);
//		mav.addObject("cginfo", cg);
		//更新货道表
		NodeInfo ni = new NodeInfo();
		ni.setVersionName(cg.getVersionName());
		ni.setNodeFrom("2");
		@SuppressWarnings("unchecked")
		List<NodeInfo> nilist =(List<NodeInfo>) nis.searchAll(ni);
		for(int i=0; i<nilist.size(); i++){
			ChannelInfo ci = new ChannelInfo();
			ci.setChannelId(hchannid);//可能会被改掉，注意
			ci.setNodeInfo(nilist.get(i));
			
			ChannelInfo ci2 = new ChannelInfo();
			ci2 = (ChannelInfo) cis.search(ci, 0).get(0);
			
			ci2.setChannelId(cg.getChannelId());
			ci2.setNormalStock(cg.getNormalStock());
			ci2.setWareId(Long.toString(cg.getWares().getWareId()));//两个版本的wareId类型不一致
//			ci2.setWareName(cg.getWares().getWareName());
			Wares w = (Wares) ws.read(cg.getWares().getWareId());
			ci.setWareName(w.getWareName());
			
			Date time=new Date();
			
			ci2.setLastTime(time);
			cis.update(ci2);
		}
		//更新完成
		return mav;
	}
	
	@RequestMapping("/to_channelgroup_alledit_0")
	public ModelAndView tocgAEdit()
	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelGroupAllEdit");

		mav.addObject("vnames", cgs.searchAllVersion2());
		mav.addObject("wslist", ws.searchAllWare());
		return mav;
	}
	
	//use JSON
	@RequestMapping(value="/do_channelgroup_find_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> userfind(@RequestBody Map<String, String> model)
	{
		Map<String, String> map = new HashMap<String, String>(1);  
		ChannelGroup cg = new ChannelGroup();
		cg.setVersionName(model.get("versionName"));
		if(cgs.searchAll(cg).size()<=0)
		{
			map.put("success", "true");  
		}
		else 
		{
			map.put("success", "false");  
		}
		return map;
	}
	
	//use JSON
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/do_channelgroup_searchbyjson_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, List<ChannelGroup>> cgsearch(@RequestBody Map<String, String> model)
	{
		System.out.println("JSON do_channelgroup_searchbyjson_3");
		Map<String, List<ChannelGroup>> map = new HashMap<String, List<ChannelGroup>>(1);  
		ChannelGroup cg = new ChannelGroup();
		cg.setVersionName(model.get("versionName"));
		System.out.println("ChannelGroup cg::"+cg);
		System.out.println("(List<ChannelGroup>) cgs.searchAll(cg)"+cgs.searchAll(cg).size());
		map.put("cglist", (List<ChannelGroup>) cgs.searchAll(cg));
		
		return map;
	}
}
