package org.ecnu.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.ecnu.oracle.orm.GroupInfo;
import org.ecnu.oracle.orm.GroupInfoDtl;
import org.ecnu.oracle.service.OGroupInfoDtlService;
import org.ecnu.oracle.service.OGroupInfoService;
import org.ecnu.orm.ChannelHis;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.Money;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.NodeMapping;
import org.ecnu.orm.Profit;
import org.ecnu.orm.Users;
import org.ecnu.orm.WareInfo;
import org.ecnu.service.ChannelHisService;
import org.ecnu.service.ChannelInfoService;
import org.ecnu.service.NodeInfoService;
import org.ecnu.service.NodeMappingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller("channelInfoController")
public class ChannelInfoController {
	@Autowired
	private ChannelInfoService cis;
	
	@Autowired
	private ChannelHisService chs;
	
	@Autowired
	private OGroupInfoService ogis;
	
	@Autowired
	private NodeMappingService nms;
	
	@Autowired
	private NodeInfoService nis;
	
	@RequestMapping("/to_channel_page_3")
	public String channelPage()
	{
		return "ChannelInfoSearch";
	}
	
	@RequestMapping("/do_channel_search_3")
	public ModelAndView channelSearch(@RequestParam("PageNo") int pageNo, ChannelInfo ci, @RequestParam("mintime") String mint, @RequestParam("maxtime") String maxt) throws IllegalArgumentException, IllegalAccessException{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelInfoSearch");
//		System.out.println("ci.getNodeInfo().getNodeName():"+ci.getNodeInfo().getNodeName());
		
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
//		System.out.println(ltime.toString()+"++Time++"+rtime.toString());
		mav.addObject("cilist", cis.searchByLike(ci, ltime, rtime, pageNo));
		long rows = cis.countRowsByLike(ci, ltime, rtime);
		mav.addObject("length", ((rows%10 )!=0 )?(rows/10+1):(rows/10));
		mav.addObject("PageNo", pageNo);
		mav.addObject("p", ci);
		mav.addObject("ltime",mint);
		mav.addObject("rtime",maxt);
		return mav;
	}
	
	@RequestMapping("/do_channel_view_3")
	public ModelAndView channelView(@RequestParam("id")long id){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelInfoView");

		ChannelInfo ci = new ChannelInfo();
		ci.setId(id);
		mav.addObject("channel", cis.search(ci, 0).get(0));
		return mav;
	}
	
	@RequestMapping("/to_channel_edit_0")
	public ModelAndView tochannelEdit(@RequestParam("id")long id){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("ChannelInfoEdit");

		ChannelInfo ci = new ChannelInfo();
		ci.setId(id);
		mav.addObject("channel", cis.search(ci, 0).get(0));
		return mav;
	}
	
	@RequestMapping("/to_channel_edit2_0")
	public ModelAndView producttochannelEdit(@RequestParam("id")long id,  @RequestParam("wareId")String wid, @RequestParam("wareName")String wname){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("EditChannel");

		ChannelInfo ci = new ChannelInfo();
		ci.setId(id);
		mav.addObject("channel", cis.search(ci, 0).get(0));
		
		try {
			new String(wname.getBytes("ISO-8859-1"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		WareInfo wi = new WareInfo();
//		wi.setWareId(wid);
//		wi.setWareName(newname);
//		ci.setWareInfo(wi);
		mav.addObject("pinfo", ci);
		
		return mav;
	}
	
	@RequestMapping("/to_prochannel_updateinc_0")
	public String stockPage3()
	{
		return "UpdateStockI";
	}
	
	@RequestMapping("/do_prochannel_updatebyincr_0")
	public String stockUpdateByIncrement(@RequestParam("id") List<String> ids, @RequestParam("incrementNumber") List<Integer> incs, @RequestParam("wareName")List<String> wnames, @RequestParam("nodeInfo.nodeId")List<String> nodeIds){//@RequestParam("nodename") String nName,@RequestParam("channelid") List<String> ids,@RequestParam("incrementStock") List<Integer> incr){

		for(int i =0; i<ids.size(); i++){
			if(incs.get(i).equals("0")||incs.get(i)==0){
				ids.remove(i);
				incs.remove(i);
				wnames.remove(i);
			}
		}
		
		if(ids.size()==0)return "UpdateStockI";
		
		String nodeGroupName=null;
//		GroupInfoDtl gid = new GroupInfoDtl();	
//		gid = ogids.getGroupIdByNodeId(nodeIds.get(0));//存在联合主键问题，使用HibernateCallback,没做
//		GroupInfo gi = new GroupInfo();
//		gi.setGroupId(gid.getId().getGroupId());
//		nodeGroupName = ogis.searchPvGi(gi).get(0).getGroupName();
		nodeGroupName=ogis.searchNGNameByNodeId(nodeIds.get(0));//连表查询，使用HibernateCallback,返回list后分拆成功
		for(int i =0; i<ids.size(); i++){
			ChannelInfo ci = new ChannelInfo();
			ChannelHis ch = new ChannelHis();
			ChannelInfo ci2 = new ChannelInfo();
			ci2.setId(Long.parseLong(ids.get(i)));
			ci = (ChannelInfo) cis.search(ci2, 0).get(0);
			
			ch.setChannelId(ci.getChannelId());
			ch.setNodeGroupName(nodeGroupName);
			ch.setCurrentNumber(ci.getCurrentNumber());
			ch.setIncrementNumber(ci.getIncrementNumber());
			ch.setLastTime(ci.getLastTime());
			ch.setNodeId(ci.getNodeInfo().getNodeId());
//			ch.setWareId(ci.getWareInfo().getWareId());
			ch.setWareId(ci.getWareId());
			ch.setWareName(ci.getWareName());
			ch.setNormalStock(ci.getNormalStock());
			
			chs.insert(ch);
		}

		if(cis.updatebyincr(ids,incs,wnames) == ids.size())
		{
			return "UpdateStockI";
		}
		return "Error";
	}
	
	@RequestMapping("/do_prochannel_i_0")
	public ModelAndView channelAllSearchI(ChannelInfo pci, ServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("UpdateStockI");
		mav.addObject("snodename",pci.getNodeInfo().getNodeName());
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		if(user.getRole().getRoleName()=="运维人员"){
			NodeMapping nmp = new NodeMapping();
			nmp.setUserId(user.getUserId());
			nmp.setNodeId(pci.getNodeInfo().getNodeId());
			if(!nms.nodeMapIsExist(nmp)){
				mav.addObject("mapinfo", "你无权编辑该售货机");
			}
		}
		else mav.addObject("listci", cis.searchall(pci));
		return mav;
	}
	
	/**
	 * 编辑额定库存量
	 * @return
	 */
	@RequestMapping("/to_prochannel_editnormalstock_0")
	public String toeditnormalstock(){
		return "NormalStockEdit";
	}
	
	/**
	 * 通过铭牌号查找货道号
	 * @param pci 接收售货机铭牌号的对象类
	 * @return 所填售货机的全部货道
	 */
	@RequestMapping("/do_prochannel_searchallforeditnormalstock_0")
	public ModelAndView channelAllSearch(ChannelInfo pci, ServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("NormalStockEdit");
		mav.addObject("snodename",pci.getNodeInfo().getNodeName());
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		if(user.getRole().getRoleName()=="运维人员"){
			NodeMapping nmp = new NodeMapping();
			nmp.setUserId(user.getUserId());
			nmp.setNodeId(pci.getNodeInfo().getNodeId());
			if(!nms.nodeMapIsExist(nmp)){
				mav.addObject("mapinfo", "你无权编辑该售货机");
			}
		}
		else mav.addObject("pclist", cis.searchall(pci));
		return mav;
	}
	
	/**
	 * 更新每个货道的额定存货量
	 * @param ids 货道集合
	 * @param nors 额定量集合
	 * @return 进入编辑售货机的额定存货量页面
	 */
	@RequestMapping("/do_prochannel_editnormalstock_0")
	public String doeditnormalstock(@RequestParam("id") List<String> ids, @RequestParam("normalStock") List<Integer> nors){
		for(int i=0; i<ids.size(); i++){
//			System.out.println(ids.get(i)+"++++++++"+nors.get(i));
			if(nors.get(i).equals("0")){
				ids.remove(i);
				nors.remove(i);
			}
		}
		if(ids.size()!=0){
			cis.editNormalStock(ids, nors);
			}
		return "NormalStockEdit";
	}
	/*******controller for flex start*********/
	/**
	 * search all channelInfo in update by IncrementNumber for flex
	 * nodeName: 售货机铭牌号
	 * 返回JSON格式的数据；
	 * 包含
	 */
	@RequestMapping("/do_prochannel_fasc_0")
	@ResponseBody
	public String fchannelAllSearchC(@RequestParam("nodeName") String nodeName) throws UnsupportedEncodingException{
		
		ChannelInfo pci=new ChannelInfo();
		NodeInfo ni=new NodeInfo();
		ni.setNodeName(nodeName);
		pci.setNodeInfo(ni);
		String rtn="[";
		@SuppressWarnings("unchecked")
		List<ChannelInfo> plist=(List<ChannelInfo>) cis.search(pci, 0);
		
		int i;
		System.out.println(plist.size());
		for(i=0; i<plist.size()-1; i++)
		{
			ChannelInfo p=plist.get(i);
			String id=p.getChannelId();
			String cStock=String.valueOf(p.getCurrentNumber());
			String iStock=String.valueOf(p.getIncrementNumber());
			rtn=rtn+"{\"CSTOCK\":\""+cStock+"\",\"ISTOCK\":\""+iStock+"\",\"WNAME\":\""+p.getWareName()+"\",\"CID\":\""+id+"\"}";
			rtn+=",";
		}
		
		ChannelInfo p=plist.get(i);
		String id=p.getChannelId();
		String cStock=String.valueOf(p.getCurrentNumber());
		String iStock=String.valueOf(p.getIncrementNumber());
		rtn=rtn+"{\"CSTOCK\":\""+cStock+"\",\"ISTOCK\":\""+iStock+"\",\"WNAME\":\""+p.getWareName()+"\",\"CID\":\""+id+"\"}";;
		rtn+="]";
		return new String(rtn.getBytes("utf-8"),"iso-8859-1");
	}

	@RequestMapping("/do_prochannel_fuc_0")
	@ResponseBody
	public String fstockUpdateByCurrent(@RequestParam("id") List<String> ids, @RequestParam("currentStock") List<Integer> currs,@RequestParam("wareNames") List<String> wNames){
		//int i = cis.updatebycurr(ids, currs,wNames);
		//if( i == ids.size())
			return "Success";
		//return "Error";
	}

	@RequestMapping("/do_prochannel_fui_0")
	@ResponseBody
	public String fstockUpdateByIncremental(@RequestParam("ids") List<String> ids, @RequestParam("istocks") List<Integer> istocks,@RequestParam("wareNames") List<String> wNames){
		int i = cis.updatebyincr(ids, istocks, wNames);
		if( i == ids.size())
			return "Success";
		return "Error";
	}
	/*******controller for flex end*********/
	
	@RequestMapping("/do_mychannel_Isearch_0")
	public ModelAndView mychannelAllSearchI(@RequestParam("nid") String nodeid){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("MyNodeChannel");
//		ChannelInfo pci = new ChannelInfo();
//		NodeInfo ni = new NodeInfo();
//		NodeInfo ni2 = new NodeInfo();
//		ni2.setNodeId(nodeid);
//		ni = (NodeInfo) nis.search(ni2, 0).get(0);
//		pci.setNodeInfo(ni);
		List <ChannelInfo> cilist = new ArrayList<ChannelInfo>();
		cilist = cis.searchAllByNodeId(nodeid);
		mav.addObject("listci", cilist);
		return mav;
	}
	
	@RequestMapping("/do_channel_editIssp_1")
	public String channelIsSp(@RequestParam("check") List<Long> mycheck)
	{
//		userService.deleteMoreByHql(mycheck);
		for(int i=0; i<mycheck.size(); i++){
			cis.changeIsSpecial(mycheck.get(i));
		}
		return "ChannelInfoSearch";
	}
	
	//use JSON
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/do_channel_find_3", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> profitfind(@RequestBody Map<String, String> model)
	{
		Map<String, Object> map = new HashMap<String, Object>(1);
		
		NodeInfo ni = new NodeInfo();
		ni.setNodeId(model.get("nodeId"));
		NodeInfo ni2 = (NodeInfo) nis.search(ni, 0).get(0);
		ChannelInfo ci = new ChannelInfo();
		ci.setNodeInfo(ni2);
		
		List<ChannelInfo> cilist = new ArrayList<ChannelInfo>();
		cilist = cis.searchall(ci);
		for(int i=0; i<cilist.size(); i++){
			System.out.println(cilist.get(i).getNodeInfo().getNodeId()+"+++"+cilist.get(i).getWareName());
		}
		if(cilist.size()!=0){
			map.put("cilist", cilist);
		}else{
			map.put("success", "false");
		}
		
		return map;
	}
}
