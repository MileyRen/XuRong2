package org.ecnu.task;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import org.ecnu.dao.ChannelInfoDao;
import org.ecnu.dao.MyStockDao;
import org.ecnu.dao.NodeGroupInfoDao;
import org.ecnu.dao.NodeInfoDao;
import org.ecnu.dao.NodeMappingDao;
import org.ecnu.dao.ProfitDao;
import org.ecnu.oracle.dao.OGroupInfoDtlDao;
import org.ecnu.oracle.dao.OPWareInfoDao;
import org.ecnu.oracle.dao.OpTempDao;
import org.ecnu.oracle.orm.OpTemp;
import org.ecnu.oracle.orm.PWareInfo;
import org.ecnu.oracle.orm.ParamVersion;
import org.ecnu.oracle.service.OGroupInfoDtlService;
import org.ecnu.oracle.service.OPWareInfoService;
import org.ecnu.oracle.service.OpTempService;
import org.ecnu.orm.ChannelInfo;
import org.ecnu.orm.NodeGroupInfo;
import org.ecnu.orm.NodeInfo;
import org.ecnu.orm.NodeMapping;
import org.ecnu.service.ChannelInfoService;
import org.ecnu.service.MyStockService;
import org.ecnu.service.NodeGroupInfoService;
import org.ecnu.service.NodeInfoService;
import org.ecnu.service.NodeMappingService;
import org.springframework.web.context.WebApplicationContext;

public class XuRong2Task extends TimerTask {
	private ServletContext sc;
	private WebApplicationContext wac = null;
	private ChannelInfoService cis;
	private OpTempService opts;
	private OpTempDao optd;
	private ChannelInfoDao cid;
	private NodeInfoService nis;
	private NodeInfoDao nid;
	private NodeGroupInfoService ngis;
	private NodeGroupInfoDao ngid;
	private NodeMappingService nms;
	private NodeMappingDao nmd;
	private MyStockService mss;
	private MyStockDao msd;
	private ProfitDao pd;
	
	private OPWareInfoService opwis;
	private OPWareInfoDao opwid;
	private OGroupInfoDtlService ogids;
	private OGroupInfoDtlDao ogidd;
	
	public XuRong2Task() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public XuRong2Task(ServletContext context) {
		super();
		// TODO Auto-generated constructor stub
		this.sc= context;
		wac = (WebApplicationContext)context.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
	}
	
	@SuppressWarnings("finally")
	@Override
	public void run() {
		// TODO Auto-generated method stub
		opts = (OpTempService) wac.getBean("OpTempService");
		optd = (OpTempDao) wac.getBean("opTempDao");
		cis = (ChannelInfoService) wac.getBean("ChannelInfoService");
		cid = (ChannelInfoDao) wac.getBean("channelInfoDao");
		nis = (NodeInfoService) wac.getBean("NodeInfoService");
		nid = (NodeInfoDao) wac.getBean("nodeInfoDao");
		ngis = (NodeGroupInfoService) wac.getBean("NodeGroupInfoService");
		ngid = (NodeGroupInfoDao) wac.getBean("nodeGroupInfoDao");
		nms=(NodeMappingService) wac.getBean("NodeMappingService");
		nmd=(NodeMappingDao) wac.getBean("nodeMappingDao");
		mss=(MyStockService) wac.getBean("MyStockService");
		msd=(MyStockDao) wac.getBean("myStockDao");
		pd=(ProfitDao) wac.getBean("profitDao");
		 
		opwis = (OPWareInfoService) wac.getBean("OPWareInfoService");
		opwid = (OPWareInfoDao) wac.getBean("oPWareInfoDao");
		ogids = (OGroupInfoDtlService) wac.getBean("OGroupInfoDtlService");
		ogidd = (OGroupInfoDtlDao) wac.getBean("oGroupInfoDtlDao");

		System.out.println("run start!");
		
		List<OpTemp> otlist = new ArrayList<OpTemp>();
		otlist=optd.getAllResult();//(List<OpTemp>) 
		System.out.println("otlist.size():"+otlist.size());
		if(otlist.size()==0)return;
		
		BigDecimal id;
		String tableName;
		String recordId;
		char op;
		
		for(int i=0; i<otlist.size(); i++ ){
			id=(BigDecimal)otlist.get(i).getId();
			tableName=otlist.get(i).getTableName();
			recordId=otlist.get(i).getRecordId();
			op=otlist.get(i).getOp();
			System.out.println(id+"+++"+tableName+"+++"+op+"+++"+recordId);
		try{
			if(tableName.equals("TXNDTL_CASH")){
				System.out.println("TXNDTL_CASH");
				updateCash(recordId);
			}else if(tableName.equals("TXNDTL_CARD")){
				System.out.println("TXNDTL_CARD");
				updateCard(recordId);
			}else if(tableName.equals("RPT_TXN_DTL")){
				System.out.println("RPT_TXN_DTL");
				updateStock(recordId);
			}else if(tableName.equals("PARAM_VERSION")){//PARAM_VERSION可能只是新建好但没有匹配机器下发，具体方案待定
				System.out.println("PARAM_VERSION");
				updateParam(recordId, op);
			}else if(tableName.equals("NODE_INFO")){
				System.out.println("NODE_INFO");
				updateNode(recordId, op);
			}else if(tableName.equals("GROUP_INFO")){
				System.out.println("GROUP_INFO");
				updateGROUP(recordId, op);
			}else if(tableName.equals("P_WARE_INFO")){
				System.out.println("P_WARE_INFO");
			}else{
				System.out.println("other");
				//opts.delete(otlist.get(i));
			}
		}
		catch (Exception e)
	        {
	            throw e;
	        }
	     finally
	        {
	    	 opts.delete(otlist.get(i));
			 System.out.println(i+"::delete otlist::"+otlist.get(i));
	            continue;
	        }
		}
		System.out.println("run over!");
	}
	
	private void updateParam(String recordId, char op) {
		// TODO Auto-generated method stub
		System.out.println("updateParam::"+recordId+"::OP::"+op);
		ParamVersion pv = new ParamVersion();
		String[] value = recordId.split("_");
		String nodeId = value[0];
		Long curVersionNo = Long.valueOf(value[1]);
		List<PWareInfo> pwilist = new ArrayList<PWareInfo>();
		pwilist = opwis.searchAllPWareInfoByCurVersionNo(curVersionNo);
		if(op=='I'||op=='U'){
			if(nodeId.substring(0, 2).equals("80")){//售货机组的情况
				List<String> nilist = new ArrayList<String>();
				nilist = ogidd.searchAllNodeIdByGroupId(nodeId);
				for(int i=0; i<nilist.size(); i++){
					cid.deleteMoreByNodeId(nilist.get(i));
					NodeInfo ni = (NodeInfo) nis.read(nilist.get(i));
					ChannelInfo ci = new ChannelInfo();
					
					ci.setNodeInfo(ni);
					for(int j=0; j<pwilist.size(); j++){
						ci.setChannelId(pwilist.get(j).getId().getPassNo());
						ci.setWareId(pwilist.get(j).getPGoodsInfo().getWareId());
						ci.setWareName(pwilist.get(j).getPGoodsInfo().getWareName());
						
						if(!cis.channelIsExist(nodeId, pwilist.get(i).getId().getPassNo())){
							cis.insert(ci);
						}
//						cid.create(ci);
					}
				}
			}
			else{//单台售货机
				cid.deleteMoreByNodeId(nodeId);
				NodeInfo ni = (NodeInfo) nis.read(nodeId);
				ChannelInfo ci = new ChannelInfo();
				
				ci.setNodeInfo(ni);
				for(int i=0; i<pwilist.size(); i++){
					ci.setChannelId(pwilist.get(i).getId().getPassNo());
					ci.setWareId(pwilist.get(i).getPGoodsInfo().getWareId());
					ci.setWareName(pwilist.get(i).getPGoodsInfo().getWareName());
					
					if(!cis.channelIsExist(nodeId, pwilist.get(i).getId().getPassNo())){
						cis.insert(ci);
					}//cid.create(ci);
				}
			}
		}else{//删除paramversion项，也可以不作处理
			if(nodeId.substring(0, 2).equals("80")){
				List<String> nilist = new ArrayList<String>();
				nilist = ogidd.searchAllNodeIdByGroupId(nodeId);
				for(int i=0; i<nilist.size(); i++){
					cid.deleteMoreByNodeId(nilist.get(i));
				}
			}else{
				cid.deleteMoreByNodeId(nodeId);
			}
		}
	}

	private void updateGROUP(String recordId, char op) {
		// TODO Auto-generated method stub
		System.out.println("updateGROUP::"+recordId+"::OP::"+op);
		NodeGroupInfo ngi = converttoGroupInfo(recordId);
		if(op=='I')ngid.create(ngi);
		else if(op=='U')ngid.update(ngi);
		else ngid.delete(ngi);
	}

	private NodeGroupInfo converttoGroupInfo(String recordId) {
		// TODO Auto-generated method stub
		NodeGroupInfo ngi = new NodeGroupInfo();
		String[] value = recordId.split("_");
		ngi.setNodeGroupId(value[0]);
		ngi.setNodeGroupName(value[1]);
		ngi.setNodeGroupType(value[2]);
		ngi.setNodeGroupDesc(value[3]);
		return ngi;
	}

	private void updateNode(String recordId, char op) {
		// TODO Auto-generated method stub
		System.out.println("updateNode::"+recordId+"::OP::"+op);
		NodeInfo ni = converttoNodeInfo(recordId);
		if(op=='I'){
			if(!nis.nodeIsExist(ni.getNodeId())){//nodeId在nodeInfo表中不存在时插入
				nis.insert(ni);
			}
		}//nid.create(ni);
		else if(op=='U'){
			//可能只是在线状态改变，暂不作处理
		}//nid.update(ni);
		else nid.delete(ni);
	}

	private NodeInfo converttoNodeInfo(String recordId) {
		// TODO Auto-generated method stub
		NodeInfo ni = new NodeInfo();
//		NodeGroupInfo ngi = new NodeGroupInfo();
		String[] value = recordId.split("_");
		ni.setNodeId(value[0]);
//		ngi = (NodeGroupInfo) ngis.read(value[1]);
//		ni.setNodeGroupInfo(ngi);
		ni.setNodeName(value[2]);
		ni.setNodeStatus(value[4]);
		ni.setMacAddr(value[5]);
		ni.setMachineType(value[7]);
		ni.setNodeAddr(value[9]);
		return ni;
	}

	private int updateStock(String recordId){
		System.out.println("updateStock::"+recordId);
		String[] value = recordId.split("_");
		String nodeId = value[0];
		String channelId = value[1];
		int outNum = Integer.parseInt(value[7]);
		return cid.updateCurrentNumber("Channel_Info", nodeId, channelId, outNum);
//		return cis.updateStock(nodeId, channelId, outNum);
	}
	//:new.LAST_TIME||'_'||:new.POS_ID||'_'||:new.PASS_NO||'_'||:new.TXN_AMOUNT||'_'||
	//:new.OUT_NUM||'_'||:new.BATCH_NO||'_'||:new.SEQ_NO
	private int updateCash(String recordId){
		System.out.println("updateCash::"+recordId);
		String[] value = recordId.split("_");
		String nodeId = value[1];
		String channelId = value[2];
		int outNum = Integer.parseInt(value[4]);//出货数量
		int aMount = Integer.parseInt(value[3]);//交易金额
		cid.updateCurrentNumber("Channel_Info", nodeId, channelId, outNum);//更新货道库存
		
		NodeMapping nmp = new NodeMapping();
		nmp.setNodeId(nodeId);
		if(nms.nodeMapIsExist(nmp)){
			NodeMapping nmp2 = (NodeMapping) nms.search(nmp, 0).get(0);
			String eName = nmp2.getEmployeeName();
			ChannelInfo ci = cid.getResultByNodeIdChannelId(nodeId, channelId);
			String wareName = ci.getWareName();
			msd.updateCurrentWareNum(eName, wareName, outNum);//更新我的存货信息
			pd.updateTurnOverCash(eName, aMount);//更新利润中现金销售额
		}
		return 1;
	}
	
	private int updateCard(String recordId){
		System.out.println("updateCard::"+recordId);
		String[] value = recordId.split("_");
		String nodeId = value[1];
		String channelId = value[2];
		int outNum = Integer.parseInt(value[4]);//出货数量
		int aMount = Integer.parseInt(value[3]);//交易金额
		cid.updateCurrentNumber("Channel_Info", nodeId, channelId, outNum);//更新货道库存
		
		NodeMapping nmp = new NodeMapping();
		nmp.setNodeId(nodeId);
		if(nms.nodeMapIsExist(nmp)){
			NodeMapping nmp2 = (NodeMapping) nms.search(nmp, 0).get(0);
			String eName = nmp2.getEmployeeName();
			ChannelInfo ci = cid.getResultByNodeIdChannelId(nodeId, channelId);
			String wareName = ci.getWareName();
			msd.updateCurrentWareNum(eName, wareName, outNum);//更新我的存货信息
			pd.updateTurnOverCard(eName, aMount);//更新利润中刷卡销售额
		}
		return 1;
	}
}
