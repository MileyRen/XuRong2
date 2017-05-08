package org.ecnu.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.ecnu.orm.Role;

public class ClassUtil {

	
	/**
	 * 返回所有值非空的属性的属性名
	 * @param obj 实例
	 * @return 返回所有值非空的属性的属性名的集合
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static List<String> getAttributes(Object obj) throws IllegalArgumentException, IllegalAccessException
	{
		
		List<String> rtn=new ArrayList<String>();
		Class<?> c = obj.getClass();  //得到该实例的Class
		Field[] f=c.getDeclaredFields();//获得类的所有属性，即包括public、private和proteced，但是不包括父类。 
		
		for (Field field : f) { 
			field.setAccessible(true);//不设置为true，无法获取私有属性
			//! field.get(obj).toString().equals("0") &&
			if(field.get(obj)!=null && field.get(obj)!=""&& !field.get(obj).toString().contains("[")){
				System.out.println("field.get(obj):"+field.get(obj));
				if(field.get(obj).toString().contains("@")) {//成员变量引用另一个类，属性值含@
					rtn.addAll(getAttributes(field.get(obj)));//递归取得从表映射类的所有值非空的属性
					continue;//跳过rtn.add(field.getName());
					}
				rtn.add(field.getName());//不为空且不为外键，直接加入
			}
		}
		return rtn;
	}
	
	//返回所有非空字段的值
	
	/**
	 * 所有非空的属性值
	 * @param obj 实例
	 * @return 所有非空的属性值的集合
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static List<Object> getValues(Object obj) throws IllegalArgumentException, IllegalAccessException
	{
		List<Object> rtn=new ArrayList<Object>();
		Class<?> c = obj.getClass();  
		Field[] f=c.getDeclaredFields();
		
		for (Field field : f) { 
			field.setAccessible(true); 
			//! field.get(obj).toString().equals("0") &&
			//if(field.get(obj).getClass().toString().contains("String"))//查询数量为0时的情况需特殊考虑
			if(field.get(obj)!=null && field.get(obj)!=""&& !field.get(obj).toString().contains("[") ){
				if(field.get(obj).toString().contains("@")) {
					rtn.addAll(getValues(field.get(obj)));
					continue;
				}
				rtn.add( field.get(obj));
			}
		}
		
		return rtn;
	}
	

//	public static void copyUser2(Users u,UserCommand uc) {
//		//u.setUsrId(uc.getUsrId());
//		u.setUsrName(uc.getUsrName());
//		u.setPassword(uc.getPassword());
//		u.setEmployeename(uc.getEmployeename());
//		u.setUserrole(uc.getUserrole());
//		u.setNoderole(uc.getNoderole());
//		u.setNodeerrrole(uc.getNodeerrrole());
//		u.setProrole(uc.getProrole());
//		u.setProchannelrole(uc.getProchannelrole());
//		u.setTransactionrole(uc.getTransactionrole());
//		u.setReportrole(uc.getReportrole());
//	}
//	
//	public static void copyUser(Users u,UserCommand uc) {
//		//u.setUsrId(uc.getUsrId());
//		u.setUsrName(uc.getUsrName());
//		u.setPassword(uc.getPassword());
//		u.setEmployeename(uc.getEmployeename());
//		u.setUserrole(getRole(uc.getUserrole()));
//		u.setNoderole(getRole(uc.getNoderole()));
//		u.setNodeerrrole(getRole(uc.getNodeerrrole()));
//		u.setProrole(getRole(uc.getProrole()));
//		u.setProchannelrole(getRole(uc.getProchannelrole()));
//		u.setTransactionrole(getRole(uc.getTransactionrole()));
//		u.setReportrole(getRole(uc.getReportrole()));
//	}
	
	/**
	 * 转化由checkbox得到的字符串为权限字符串
	 * @param checkRole 由checkbox得到的字符串
	 * @return 转化得到权限字符串
	 */
	private static String getRole(String checkRole){
		StringBuffer s = new StringBuffer("00000");
		if(checkRole != null && checkRole != ""){
			String[] str = checkRole.split(",");
			//if(str.length<=1) return checkRole;
			for(int i=0; i<str.length; i++)
			{
				s.setCharAt(Integer.parseInt(str[i]), '1');
			}
		}
		return s.toString();
	}
	
	/**
	 * 给User对象的各个操作权限赋值
	 * @param u User对象
	 */
	public static void convertRole(Role r)
	{
		r.setUserRole(getRole(r.getUserRole()));
		r.setRoleRole(getRole(r.getRoleRole()));
		r.setChannelRole(getRole(r.getChannelRole()));
		r.setImportRole(getRole(r.getImportRole()));
		r.setNodeRole(getRole(r.getNodeRole()));
		r.setMapRole(getRole(r.getMapRole()));
		r.setWareRole(getRole(r.getWareRole()));
		r.setOptempRole(getRole(r.getOptempRole()));
		r.setDepotRole(getRole(r.getDepotRole()));
		r.setMoneyRole(getRole(r.getMoneyRole()));
		r.setProfitRole(getRole(r.getProfitRole()));
	}
	
	/**
	 * 
	 * @param strCheck
	 * @return
	 */
	public static List<Integer> arrayToList(String[] strCheck){
		List<Integer> ids=new ArrayList<Integer>();
		//int len=request.getParameterValues("check").length;
		for(int i=0; i<strCheck.length; i++)
		{
			//System.out.println("strchk: "+i+" "+strCheck[i]);
			//System.out.println("----111 "+Integer.parseInt(strCheck[i]));
			ids.add(Integer.parseInt(strCheck[i]));
		}
		return ids;
	}

	public static List<String> arrayToStringList(String[] strCheck){
		List<String> ids=new ArrayList<String>();
		//int len=request.getParameterValues("check").length;
		for(int i=0; i<strCheck.length; i++)
		{
			//System.out.println("strchk: "+i+" "+strCheck[i]);
			//System.out.println("----111 "+Integer.parseInt(strCheck[i]));
			ids.add(strCheck[i]);
			//.add(Integer.parseInt(strCheck[i]));
		}
		return ids;
	}
	
	 public static void displayObjectList(List list)
    {
        Iterator iter = list.iterator();
        if (!iter.hasNext())
        {
            System.out.println("No objects to display.");
            return;
        }
        while (iter.hasNext())
        {
            Object obj = iter.next();
            
            System.out.println(obj);
        }
    }
	    
	    public static void displayObjectsList(List list)//displayFaultList
	    {
	        Iterator iter = list.iterator();
	        if (!iter.hasNext())
	        {
	            System.out.println("No objects to display.");
	            return;
	        }
	        while (iter.hasNext())
	        {
	            System.out.println("New object");
	            Object[] obj = (Object[]) iter.next();
	            for (int i=0;i<obj.length;i++)
	            {
	                System.out.println(obj[i]);
	            }      
	        }
	    }
	    
//	    public static void displayFaultList(List<NodeFault> list)//displayFaultList
//	    {
//	        Iterator iter = list.iterator();
//	        if (!iter.hasNext())
//	        {
//	            System.out.println("No objects to display.");
//	            return;
//	        }
//	        while (iter.hasNext())
//	        {
//	            System.out.println("New NodeFault object");
//	            NodeFault nf = new NodeFault();
//	            nf = (NodeFault) iter.next();
//	            System.out.println("nodeFault.faultId by nf: "+nf.getFaultId());
//	            System.out.println("nodeFault.nodeName by nf: "+nf.getNodeInfo().getNodeName());
//     
////	            for (int i=0;i<obj.length;i++)
////	            {
////	            	NodeFault nf = new NodeFault();
////	            	nf.getNodeInfo().getNodeId()
////	                //System.out.println(obj[i]);
////	            }
//	        }
//	    }
}
//public void copyObject(Object oSource,Object oTarget) {
//List<String>  list = null;
//List<String> list2 = null;
//System.out.println("----");	
////java.lang.reflect.Method[] m = oSource.getClass().getMethods();
////			for(java.lang.reflect.Method mm:m) {
////				list.add(mm.getName());
////				System.out.println(list.get(0));
//try {
//	list2 = getAttributes(oTarget);
//	
//	for(int i=0 ; i<list2.size(); i++) {
//		try {
//			System.out.println("----"+list2.get(i));
//		
//			//oSource.getClass().getMethod(list.get(i),Object.class).invoke(oSource, oTarget.getClass().getDeclaredField(list2.get(i)).get(oTarget));
//			oSource.getClass().getDeclaredField(list2.get(i)).setAccessible(true);
//			oTarget.getClass().getDeclaredField(list2.get(i)).setAccessible(true);
//			oSource.getClass().getDeclaredField(list2.get(i)).set(oSource,oTarget.getClass().getDeclaredField(list2.get(i)).get(oTarget));
//		} catch (SecurityException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NoSuchFieldException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//} catch (IllegalArgumentException e) {
//	// TODO Auto-generated catch block
//	e.printStackTrace();
//} catch (IllegalAccessException e) {
//	// TODO Auto-generated catch block
//	e.printStackTrace();
//}		
//}
//
//public void cleanObject(Object obj) {
//
//System.out.println("----");
//try {
//	List<String> list = getAttributes(obj);
//	for(int i=0 ; i<list.size(); i++) {
//		try {
//			obj.getClass().getDeclaredField(list.get(i)).setAccessible(true);
//			obj.getClass().getDeclaredField(list.get(i)).set(obj,null);
//		} catch (SecurityException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (NoSuchFieldException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//} catch (IllegalArgumentException e) {
//	// TODO Auto-generated catch block
//	e.printStackTrace();
//} catch (IllegalAccessException e) {
//	// TODO Auto-generated catch block
//	e.printStackTrace();
//}		
//}