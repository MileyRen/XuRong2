package org.ecnu.task;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ecnu.orm.NodeInfo;
import org.ecnu.service.NodeInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class SYNControl {	
	
	public NodeInfoService nodeInfoService;
	
//	private String databaseName;
//	private String tableName;
	private String uri;
	private String user;
	private String password;
	private static Statement state;
	
	private List<String> nodeList;
	private List<String> goodsList;
	private List<String> txnList;

	public SYNControl() {
		uri = "jdbc:mysql://222.204.232.78:3306/xurong2?characterEncoding=UTF-8";
		user = "root";
		password = "asd123";		
	}
	 public Connection getConnect() throws SQLException {
		 
		 return DriverManager.getConnection(uri, user, password);
	 }
	
	 public void initial() throws SQLException {
		 state = getConnect().createStatement();
	}
	 
	 public void addBatch(String tableName, String values,char op) throws SQLException {
		 state.addBatch(createQuery(tableName,values,op));
		 System.out.println(state);
	 }
	 
	 public Boolean execute(String tableName, String values,char op) throws SQLException{
//		 try {
//			return state.executeBatch();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		 return null;
		String[] value = values.split("_");
		String[] IDs = value[4].split(",");
		String node_ID = IDs[0];
		String channel_ID = IDs[1];
		String out_Num = value[7];
		String lastTime = convertTime(value[9]);
		String sql = "UPDATE channel_info set CURRENT_NUMBER = CURRENT_NUMBER - "+out_Num+" , LAST_TIME = '"+lastTime+"' WHERE NODE_ID = '"+node_ID+"' AND CHANNEL_ID = '"+channel_ID+"'";
		return state.execute(sql);
		 
	 }
	
	String createQuery(String tableName, String values,char op) {
//		String sql = null;
//		String[] value = values.split("_");
//		value = convert(value,tableName);
//		int i;
//		
//		switch(op) {
//		case 'I': sql = "INSERT INTO "+tableName+" VALUES (";
//				  for(i=0;i<value.length-1;i++) {
//					  if(value[i].equals("NULL"))
//						  sql+=value[i]+",";
//					  else 
//					  	  sql+="'"+value[i]+"',";
//				  }
//				  if(!value[i].equals("NULL"))
//					  sql+="'"+value[i]+"')";
//				  else
//					  sql+=value[i]+")";
//				  break;
//				  
//		case 'U': sql = "UPDATE "+tableName+" SET ";
//				  List<String> list = getMap().get(tableName);
//				  for(i=0;i<value.length-1;i++) {
//					  if(value[i].equals("NULL"))
//						  sql+=list.get(i)+"="+value[i]+",";
//					  else 
//					  	  sql+=list.get(i)+"='"+value[i]+"',";
//				  }
//				  if(!value[i].equals("NULL"))
//					  sql+=list.get(i)+"='"+value[i]+"'";
//				  else
//					  sql+=list.get(i)+"="+value[i];
//				  sql+=" WHERE "+list.get(0)+"='"+value[0]+"'";
//				  break;
//				  
//		case 'D': sql = "DELETE "+tableName+" WHERE "+getMap().get(tableName).get(0)+"='"+value[0]+"'";
//		break;
//		}
//		System.out.println(sql);
//		return sql;
		String sql = null;
		if(!tableName.equals("RPT_TXN_DTL"))
			return "UPDATE RPT_TXN_DTL set aa=a";
		String[] value = values.split("_");
		String[] IDs = value[4].split(",");
		String node_ID = IDs[0];
		String channel_ID = IDs[1];
		String out_Num = value[7];
		String lastTime = convertTime(value[9]);
		
		sql = "UPDATE channel_info set CURRENT_NUMBER = CURRENT_NUMBER - "+out_Num+" , LAST_TIME = '"+lastTime+"' WHERE NODE_ID = '"+node_ID+"' AND CHANNEL_ID = '"+channel_ID+"'";
		return sql;
	}	
	
//	public static void main(String[] args) throws SQLException {
//		SYNControl s = new SYNControl();
//		s.initial();
//		//s.addBatch("NODE_INFO", "many001_many001_1_many2023_many2023_many2023_NULL_1",'U');
//		//s.addBatch("NODE_INFO","many001_many001_1_many2023_many2023_many2023_NULL_1" , 'D');
//		s.addBatch("NODE_INFO", "KJHA1535_many001_1_many2023_many2023_many2023_NULL_1",'U');
//		s.addBatch("NODE_INFO", "many001_many001_1_many2023_many2023_many2023_NULL_1",'U');
//		s.addBatch("NODE_INFO", "KUIK1205_many001_1_many2023_many2023_many2023_NULL_1",'U');
//		s.execute();
//	}
	public Map<String,List<String>> getMap() {
		
		if(nodeList==null){
			nodeList = new ArrayList<String>();
			goodsList = new ArrayList<String>();
			txnList = new ArrayList<String>();
			
			nodeList.add("NODE_ID");
			nodeList.add("NODE_NAME");
			nodeList.add("NODE_STATUS");
			nodeList.add("MAC_ADDR");
			nodeList.add("SIM_NO");
			nodeList.add("MACHINE_TYPE");
			nodeList.add("LOCATION_ID");
			nodeList.add("MONOPOLY");
			
			goodsList.add("WARE_ID");
			goodsList.add("WARE_NAME");
			goodsList.add("WARE_DESC");
			goodsList.add("BRAND_ID");
			goodsList.add("WHOLE_STORAGE");
			goodsList.add("LAST_TIME");
			goodsList.add("WARE_BASE_PRICE");
			goodsList.add("WARE_TYPE");
			
			txnList.add("WORK_DATE");
			txnList.add("BATCH_NO");
			txnList.add("LOCATION_ID");
			txnList.add("TXN_EVENT_CODE");
			txnList.add("NChann");
			txnList.add("WARE_ID");
			txnList.add("OUT_NUM");
			txnList.add("ADVER_CLICK");
			txnList.add("AMOUNT");
			txnList.add("LAST_TIME");
			txnList.add("INSERT_AMOUNT");
			txnList.add("CHANGE_AMOUNT");
			txnList.add("BELONG_TO");
		}
		Map<String,List<String>> map = new HashMap<String, List<String>>();
		map.put("NODE_INFO", nodeList);
		map.put("P_GOODS_INFO", goodsList);
		map.put("TXN_DTL", txnList);
		
		return map;
	}
	
	
	public String[] convert(String[] values,String tableName) {
		
		if(tableName.equals("P_GOODS_INFO"))
			values[5] = convertTime(values[5]);
		
		if(tableName.equals("TXN_DTL")) {
			values[9] = convertTime(values[9]);
			
			NodeInfo ni = new NodeInfo();
			ni.setNodeId(values[4].split(",")[0]);
			ni = (NodeInfo) nodeInfoService.searchByLike(ni, 0).get(0);
			
			values[4] = values[4].replace(',', '_');
		}
		return values;
		
	}
	
	public String convertTime(String str) {
		String s = str.substring(0,4);
		s += "/";
		s += str.substring(4, 6);
		s += "/";
		s += str.substring(6, 8);
		s += " ";
		s += str.substring(8, 10);
		s += ":";
		s += str.substring(10, 12);
		s += ":";
		s += str.substring(12, 14);
		return s;
		//return str.substring(0,4)+"/"+str.substring(4,2)+"/"+str.substring(6,2)+" "+str.substring(8,2)+":"+str.substring(10,2)+":"+str.substring(12,2);
	}
}
