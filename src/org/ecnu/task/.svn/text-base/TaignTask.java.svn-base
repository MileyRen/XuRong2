package org.ecnu.task;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.ecnu.oracle.service.OpTempService;
import org.ecnu.service.NodeInfoService;

import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component("TaignTask")
public class TaignTask extends TimerTask {
	
//	@Resource(name="OpTempService")
//	private OpTempService opTempService;
	
//	@Qualifier("LocationService")
//	@Autowired
//	private LocationService locationService;
//	
//	private LocationInfo location;
//	
private ServletContext context = null;
private WebApplicationContext wac = null;
	public TaignTask(){}
	
	
	
	SYNControl synControl;
	
	public TaignTask(ServletContext context) {
		
		synControl = new SYNControl();
		
		this.context= context;
		wac = (WebApplicationContext)context.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
	}
	
	@Override
	public void run() {	
		
		System.out.println("run 起来！");
		OpTempService opTempService = (OpTempService) wac.getBean("OpTempService");
		//synControl.nodeInfoService=(NodeInfoService) wac.getBean("NodeInfoService");
		
		String tableName;
		String id;
		char op;
		int count=0;
		int[] results;
		List<BigDecimal> responseIds = new ArrayList<BigDecimal>();
		
		List<Object[]> records= opTempService.get();
		System.out.println("records.size():"+records.size());
		if(records.size()==0)
			return;
		
		try {
			synControl.initial();
			for(int i=0;i<records.size();i++) {
				Object[] record = records.get(i);
				tableName = (String) record[1];
				id = (String) record[2];
				op = (Character) record[3];
				
				if(!tableName.equals("RPT_TXN_DTL")) continue;	
				
				if(synControl.execute(tableName, id, op));
					responseIds.add((BigDecimal)record[0]);
				
				if(responseIds.size()>30) 
					opTempService.response(responseIds);
						
			}
			
			if(responseIds.size()>0)
				opTempService.response(responseIds);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("over!");
	}
		
//	public Boolean execute2(String tableName,String id,char op) {			
//		switch(op) {
//		case 'I':return executeInsert(tableName,id);
//			     
//		case 'U':return executeUpdate(tableName,id);
//	     		 
//		case 'D':return executeDelete(tableName,id);
//	    }
//		return false;
//	}	
//
//	public Boolean executeInsert(String tableName,String id) {
//		AbstractService is = (AbstractService) wac.getBean(tableName);
//		try {
//			is.insert(convert(tableName,id));
//		}catch(DataAccessException e) {
//			return false;
//		}
//		
//		return true;	
//	}
//	
//	private Boolean executeUpdate(String tableName, String id) {
//		AbstractService is = (AbstractService) wac.getBean(tableName);
//		try {
//			is.update(convert(tableName,id));
//		}catch(DataAccessException e) {
//			return false;
//		}
//		
//		return true;
//}
//
//	private Boolean executeDelete(String tableName, String id) {
//		AbstractService is = (AbstractService) wac.getBean(tableName);
//		try {
//			is.insert(convert(tableName,id));
//		}catch(DataAccessException e) {
//			return false;
//		}
//		
//		return true;			
//	}
//		
//	public Object convert(String tableName,String values) {
//	
//		if(tableName.equals("NODE_INFO"))
//			return converNode(values);
//		
//		if(tableName.equals("P_GOODS_INFO"))
//			return converGood(values);
//		
//		if(tableName.equals("RPT_TXN_DTL"))
//			return converTXN(values);
//	} 
//	
//	public Object converNode(String values) {
//		String[] oldNode = values.split("_");
//		org.ecnu.orm.NodeInfo newNode = new org.ecnu.orm.NodeInfo();
//		
//		if(location==null)
//			location=(LocationInfo) locationService.read(33);
//			
//		newNode.setNodeId(oldNode[0]);
//		newNode.setNodeName(oldNode[0]);
//		newNode.setNodeStatus(oldNode[0]);
//		newNode.setMacAddr(oldNode[0]);
//		newNode.setMachineType(oldNode[0]);
//		newNode.setSimNo(null);
//		newNode.setMonopoly(null);
//		newNode.setLocationInfo(location);
//		
//		return newNode;		
//	}
//	
	
	
//	public List<Integer> insert(String tableName,List<Object> objs,List<Integer> ids) {
//		for(int i=0;i<objs.size();i++) {
//			try {
//				map.get(tableName).inerts(objs.get(i));
//			}catch(DataAccessException e) {
//				ids.remove(i);
//				continue;
//			}
//		}
//		return ids;
//	}
//	public List<Integer> update(String tableName,List<Object> objs,List<Integer> ids) {
//		for(int i=0;i<objs.size();i++) {
//			try {
//				map.get(tableName).updates(objs.get(i));
//			}catch(DataAccessException e) {
//				ids.remove(i);
//				continue;
//			}
//		}
//		return ids;
//	}
//	
//	public List<Integer> delete(String tableName,List<Integer> ids) {
//		map.get(tableName).deletes(ids);
//		return ids;
//	}
	
	//public void execute(List list) {
//		List<Integer> ids = new ArrayList<Integer>();
//		String tableName = null;
//		Iterator<String> iter=map.keySet().iterator();
//		List records = null;
//		List<Integer> response = null;
//		
//		while(iter.hasNext()) {
//			tableName = iter.next();
//			
//			for(int i=1;i<=3;i++){
//				for(int j=0;j<list.size();j++) {
//					if(list.get(j).getTableName().equals(tableName)&&list.get(j).getOp()==1)
//						ids.add(list.get(j).getId());
//				}
//				
//				switch(i) {
//				case U: records = getRecords(tableName,ids);				
//						response = insert(tableName,records,ids);
//						response(tableName,response);
//						break;
//				case D: records = getRecords(tableName,ids);						
//						response = update(tableName,records,ids);
//						response(tableName,response);
//						break;
//				case C: response = delete(tableName,ids);
//						response(tableName,response);
//						break;
//				}
//				list.clear();
//			}
//		}
//	}
//	
}
