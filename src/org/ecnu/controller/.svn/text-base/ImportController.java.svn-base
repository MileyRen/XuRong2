package org.ecnu.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.ecnu.oracle.orm.GroupInfo;
import org.ecnu.oracle.orm.GroupInfoDtl;
import org.ecnu.oracle.orm.ONodeInfo;
import org.ecnu.oracle.orm.PWareInfo;
import org.ecnu.oracle.orm.ParamVersion;
import org.ecnu.oracle.orm.ParamVersionId;
import org.ecnu.oracle.service.OGroupInfoDtlService;
import org.ecnu.oracle.service.OGroupInfoService;
import org.ecnu.oracle.service.ONodeInfoService;
import org.ecnu.oracle.service.OPWareInfoService;
import org.ecnu.oracle.service.OParamVersionService;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.ImportInfo;
import org.ecnu.orm.NodeGroupInfo;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.NodeMapping;
import org.ecnu.orm.Users;
import org.ecnu.service.ChannelInfoService;
import org.ecnu.service.ImportInfoService;
import org.ecnu.service.NodeGroupInfoService;
import org.ecnu.service.NodeInfoService;
import org.ecnu.service.WareInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller("importController")
public class ImportController {
	
	@Autowired
	private ImportInfoService iis;
	
	@Autowired
	private NodeGroupInfoService ngis;
	
	@Autowired
	private NodeInfoService nis;
	
	@Autowired
	private WareInfoService wis;
	
	@Autowired
	private ChannelInfoService cis;
	
	@Autowired
	private OParamVersionService opvs;

	@Autowired
	private OGroupInfoDtlService ogids;
	
	@Autowired
	private OGroupInfoService ogis;
	
	@Autowired
	private OPWareInfoService opwis;
	
	@Autowired
	private ONodeInfoService onis;
	
	
	@RequestMapping("/to_import_page_3")
	public ModelAndView toImportPage(ServletRequest request){
		ModelAndView mav = new ModelAndView();
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		mav.setViewName("InfoImport");
		System.out.println("user.getRole().getRoleName():"+user.getRole().getRoleName());
		if(user.getRole().getRoleName().equals("Administrator")||user.getRole().getRoleName().equals("系统管理员")){
			System.out.println("I am Administrator");
			mav.addObject("ilist", iis.getAllResult());
		}
		return mav;
	}
	
	@RequestMapping("/do_import_info_4")
	public ModelAndView doInfoImport(@RequestParam("tlbname") String tname, @RequestParam("id") long id, ServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("InfoImport");
		ImportInfo ii = new ImportInfo();
		ii.setId(id);
		ii.setTableName(tname);
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		Users user=(Users) httpRequest.getSession().getAttribute("userinfo");
		ii.setOperater(user.getUserName());//从session中获得用户
		Date now = new Date();
		ii.setLastTime(now);
//		iis.update(ii);
		if(tname.equals("GROUP_INFO")){
			importGroupInfo();
			iis.update(ii);
		}
		else if(tname.equals("NODE_INFO")){
			importNodeInfo();
			iis.update(ii);
		}
		else if(tname.equals("CHANNEL_INFO")){
			importChannelInfo2();
			iis.update(ii);
		}else if(tname.equals("ALL")){
			ii.setTableName("GROUP_INFO");
			importGroupInfo();
			iis.update(ii);
			ii.setTableName("NODE_INFO");
			importNodeInfo();
			iis.update(ii);
			ii.setTableName("CHANNEL_INFO");
			importChannelInfo2();
			iis.update(ii);
		}
		
		mav.addObject("ilist", iis.getAllResult());
		return mav;
	}
	
	private void importGroupInfo() {
		System.out.println("importGroupInfo");
		List<GroupInfo> ogilist = new ArrayList<GroupInfo>();
		ogilist = ogis.searchAllGroup();
		for(int i=0; i<ogilist.size(); i++){
			NodeGroupInfo ngi = new NodeGroupInfo();
			ngi.setNodeGroupId(ogilist.get(i).getGroupId());
			ngi.setNodeGroupName(ogilist.get(i).getGroupName());
			ngi.setNodeGroupDesc(ogilist.get(i).getGroupDesc());
			ngi.setNodeGroupType(ogilist.get(i).getGroupType());
			if(!ngis.groupIsExist(ogilist.get(i).getGroupId())){
				ngis.insert(ngi);
			}
		}
	}
	
	private void importNodeInfo() {//导入oracle中NodeInfo表到mysql
		// TODO Auto-generated method stub
		System.out.println("importNodeInfo");
		List<ONodeInfo> onilist = new ArrayList<ONodeInfo>();
		onilist = onis.searchAllNode();
		System.out.println("o nodeinfo size"+onilist.size());
		NodeInfo ni = new NodeInfo();
		ni.setIsAssign("1");
		for(int i=0; i<onilist.size(); i++){
//			插入组
			NodeGroupInfo ngi = new NodeGroupInfo();
//			if(!onilist.get(i).getParentNode().toString().subSequence(0, 2).equals("8A")
//					||!onilist.get(i).getParentNode().toString().subSequence(0, 2).equals("8B")){
//				ngi.setNodeGroupId(onilist.get(i).getParentNode());
//				//ngi.setNodeGroupName(ogis.searchNGNameByNodeId(onilist.get(i).getParentNode()));
//				ngis.insert(ngi);
//				ni.setNodeGroupInfo(ngi);
//			}
			ngi=(NodeGroupInfo) ngis.read(onilist.get(i).getParentNode());
			ni.setNodeGroupInfo(ngi);
			ni.setMacAddr(onilist.get(i).getMacAddr());
			ni.setMachineType(onilist.get(i).getMachineType());
			ni.setNodeAddr(onilist.get(i).getNodeAddr());
			ni.setNodeId(onilist.get(i).getNodeId());
			ni.setNodeName(onilist.get(i).getNodeName());
			
			if(!nis.nodeIsExist(onilist.get(i).getNodeId())){
				//nodeId在nodeInfo表中不存在时插入
				nis.insert(ni);
			}
		}
	}

	private void importChannelInfo2() {//从paramversion中读nodeId
		
		List<ParamVersion> paramversions = new ArrayList<ParamVersion>();
		paramversions = opvs.searchAll();
		System.out.println("paramversions.size():"+paramversions.size());
		for(int i=0; i<paramversions.size(); i++){
			ParamVersion pv = new ParamVersion();
			pv = paramversions.get(i);

			if(pv.getId().getParamTag().equals("0306")){
//				System.out.println("0306");
//				System.out.println("pv.getId().getNodeId().substring(0, 2)"+pv.getId().getNodeId().substring(0, 2));
				if(!pv.getId().getNodeId().substring(0, 2).equals("80")){
					//单点售货机情况
					if(nis.nodeIsExist(pv.getId().getNodeId())){//在mysql node_info表中已存在
						NodeInfo ni2 = new NodeInfo();
						ni2.setNodeId(pv.getId().getNodeId());
							NodeInfo ni = (NodeInfo) nis.search(ni2, 0).get(0);
							importChannByNode(ni, ni.getNodeId());
					}else continue;//也可以做node插入操作
				}else{
					//售货机组
					String gtempid = pv.getId().getNodeId();
					
					//在group_info_dtl表中查询groupId的所有记录
					List<String> nodeids = new ArrayList<String>();
//					System.out.println("start search all nodeId");
					nodeids = ogids.getAllNodeIdByGroupId(gtempid);
//					System.out.println("nodeids.size():"+nodeids.size());
					NodeInfo ni = new NodeInfo();
					NodeInfo ni2 = new NodeInfo();
					for(int j=0; j<nodeids.size(); j++){
						ni2.setNodeId(nodeids.get(j));
						if(!nis.search(ni2, 0).isEmpty()){
							ni = (NodeInfo) nis.search(ni2, 0).get(0);
							ni.setNodeId(gtempid);//设置nodeId为组Id
							importChannByNode(ni, nodeids.get(j));
						}
					}
				}
			}
		}
	}
	
	
	private void importChannByNode(NodeInfo ni, String nodeId) {//ni的nodeId为paramversion中的Id(可能是组Id)nodeId为真实的单点售货机Id
		// TODO Auto-generated method stub
		System.out.println("importChannByNode");
		System.out.println("ni.getNodeId()::"+ni.getNodeId());
		String paramTag = "0306";
		ParamVersionId id = new ParamVersionId();
		id.setNodeId(ni.getNodeId());//用组Id搜索paramversion信息
		id.setParamTag(paramTag);
		
		ParamVersion pv = new ParamVersion();
		pv = (ParamVersion) opvs.read(id);//测试可以如此用法，联合主键查询--完
		
		long curVersionNo = pv.getCurVersionNo();
		List<PWareInfo> pWareInfos = new ArrayList<PWareInfo>();
		pWareInfos = opwis.searchAllPWareInfoByCurVersionNo(curVersionNo);//从oracle中的P_WARE_INFO表获得该nodeId的P_WARE_INFO(channelInfo)信息：PASS_NO，WARE_ID
//		System.out.println("pWareInfos.size():"+pWareInfos.size());
		System.out.println("curVersionNo:"+curVersionNo);
		Date now = new Date();
//		SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		ni.setNodeId(nodeId);//将nodeId设置为真实值
		for(int k=0; k<pWareInfos.size(); k++){
			PWareInfo pwi = new PWareInfo();
			pwi = pWareInfos.get(k);
			ChannelInfo ci = new ChannelInfo();
			ci.setChannelId(pwi.getId().getPassNo());
			ci.setWareId(pwi.getPGoodsInfo().getWareId());
			ci.setWareName(pwi.getPGoodsInfo().getWareName());
			ci.setLastTime(now);
			ci.setNodeInfo(ni);
			ci.setCurrentNumber(0);
			ci.setNormalStock(0);
			ci.setIncrementNumber(0);
			
			if(!cis.channelIsExist(nodeId, pwi.getId().getPassNo())){
				cis.insert(ci);
			}
		}
	}

	@RequestMapping("/do_info_import_4")
	public ModelAndView infoImport(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("InfoImport");
		List<ParamVersion> paramversions = new ArrayList<ParamVersion>();
		paramversions = opvs.searchAll();
		for(int i=0; i<paramversions.size(); i++){
			ParamVersion pv = new ParamVersion();
			pv = paramversions.get(i);
			if(pv.getId().getParamTag()=="0306"){
				if(pv.getId().getNodeId().substring(0, 2)=="80"){//售货机组
//					//在GROUP_INFO_DTL中，把该组下的设备编号全查出来
//					List<GroupInfoDtl> groupInfoDtls = new ArrayList<GroupInfoDtl>();
//					groupInfoDtls = ogids.searchAll();
//					for(int j=0; j<groupInfoDtls.size(); j++){
//						GroupInfoDtl gid = new GroupInfoDtl();
//						gid = groupInfoDtls.get(j);
//						gid.getId().getNodeId();
//					}
					String groupId = pv.getId().getNodeId();
					List<GroupInfoDtl> gids = new ArrayList<GroupInfoDtl>();
//					gids = ogids.getAllNodeInfo(groupId);
				}
				else{//单点售货机
					NodeInfo ni = new NodeInfo();
					ni.setNodeId(pv.getId().getNodeId());
					ONodeInfo oni = new ONodeInfo();
					oni = (ONodeInfo) onis.read(pv.getId().getNodeId());
					ni.setNodeName(oni.getNodeName());
					NodeGroupInfo ngi = new NodeGroupInfo();
					ngi.setNodeGroupId(oni.getParentNode());
//					ngi.setNodeGroupName(nodeGroupName)
					ngis.insert(ngi);//在mysql的node_Group_Info中插入记录
					
					ni.setNodeGroupInfo(ngi);
					nis.insert(ni);//在mysql的node_Info中插入记录
					
					String nodeId = pv.getId().getNodeId();
					long curVersionNo = pv.getCurVersionNo();
					List<PWareInfo> pWareInfos = new ArrayList<PWareInfo>();
					pWareInfos = opwis.searchAllPWareInfoByCurVersionNo(curVersionNo);//从oracle中的P_WARE_INFO表获得该nodeId的P_WARE_INFO(channelInfo)信息：PASS_NO，WARE_ID
					for(int k=0; k<pWareInfos.size(); k++){
						PWareInfo pwi = new PWareInfo();
						ChannelInfo ci = new ChannelInfo();
						ci.setChannelId(pwi.getId().getPassNo());
						ci.setWareId(pwi.getPGoodsInfo().getWareId());
						ci.setWareName(pwi.getPGoodsInfo().getWareName());
						
						ci.setNodeInfo(ni);
						
						cis.insert(ci);//在mysql的channel_Info中插入记录
					}
				}
			}
		}
		return mav;
	}
	
	/*
	 * //暂时没用
	@SuppressWarnings("unused")
	private void importChannelInfo() {
	//由nodeInfo表获得所有nodeId后查找paramversion表获得货道信息，在查询组时往上回溯有问题
		// TODO Auto-generated method stub
		System.out.println("importChannelInfo");
		List<NodeInfo> nilist = new ArrayList<NodeInfo>();
		nilist = nis.searchAllNode();
		System.out.println("nodeinfo size"+nilist.size());
		for(int i=0; i<nilist.size(); i++){
			NodeInfo ni = new NodeInfo();
			ni=nilist.get(i);
			
			//将选择的nodeId的channelInfo插入到channel_info表中
			String nodeId = ni.getNodeId();
			System.out.println(i+"++nodeId:"+nodeId);
			
			String tempId = new String();
			
			//联合主键nodeId和paramTag查询paramversion中记录信息--始
			
//			ParamVersion pv2 = new ParamVersion();
//			pv2.setId(id);
			
			if(opvs.nodeIdIsExist(nodeId, "0306")){
				//nodeId在paramVersion表中存在，即为单台机器的情况
				importChannByNode(ni, nodeId);
			}
			else if(ogids.nodeIdExist(nodeId)){
				//在groupInfoDtl表中由nodeId字段查询出groupId,将groupId赋值给nodeId
				tempId=ogids.getGroupIdByNodeId(nodeId);
				ni.setNodeId(tempId);
				if(opvs.nodeIdIsExist(tempId, "0306")){
					System.out.println("opvs:1:::"+tempId);
					importChannByNode(ni, nodeId);
				}else if(ogids.nodeIdExist(tempId)){
					//在groupInfoDtl表中由nodeId字段查询出groupId,将groupId赋值给nodeId
					tempId=ogids.getGroupIdByNodeId(tempId);
					ni.setNodeId(tempId);
					if(opvs.nodeIdIsExist(tempId, "0306")){
						System.out.println("opvs:2:::"+tempId);
						importChannByNode(ni, nodeId);
					}else if(ogids.nodeIdExist(nodeId)){
						//在groupInfoDtl表中由nodeId字段查询出groupId,将groupId赋值给nodeId
						tempId=ogids.getGroupIdByNodeId(tempId);
						ni.setNodeId(tempId);
						if(opvs.nodeIdIsExist(tempId, "0306")){
							System.out.println("opvs:3:::"+tempId);
							importChannByNode(ni, nodeId);
						}else if(ogids.nodeIdExist(tempId)){
							//在groupInfoDtl表中由nodeId字段查询出groupId,将groupId赋值给nodeId
							tempId=ogids.getGroupIdByNodeId(tempId);
							ni.setNodeId(tempId);
							if(opvs.nodeIdIsExist(nodeId, "0306")){
								System.out.println("opvs:4:::"+tempId);
								importChannByNode(ni, nodeId);
							}else if(ogids.nodeIdExist(tempId)){
								//在groupInfoDtl表中由nodeId字段查询出groupId,将groupId赋值给nodeId
								tempId=ogids.getGroupIdByNodeId(tempId);
								ni.setNodeId(tempId);
								if(opvs.nodeIdIsExist(tempId, "0306")){
									System.out.println("opvs:5:::"+tempId);
									importChannByNode(ni, nodeId);
								}
								else {
									System.out.println("other");
									continue;
								}
							}else continue;
						}else continue;
					}else continue;
				}else continue;
			}
		}
}

	@RequestMapping("/do_info_import_4")
	public ModelAndView infoImport(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("InfoImport");
		ngis.infoImport();
		nis.infoImport();
		return mav;
	}
	
	@RequestMapping("/do_groupinfo_import_4")
	public ModelAndView groupInfoImport(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("InfoImport");
		
		return mav;
	}
	
	@RequestMapping("/do_nodeinfo_import_4")
	public ModelAndView nodeInfoImport(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("InfoImport");
		
		return mav;
	}
	
	@RequestMapping("/do_wareinfo_import_4")
	public ModelAndView wareInfoImport(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("InfoImport");
		
		return mav;
	}
	*/
}
