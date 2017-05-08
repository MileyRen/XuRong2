package test;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetMonthTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("MM");
		Date now = new Date();
		int iyear, imonth;
		String lastTime = sdf.format(now);
		if(now.getMonth()==12){
			iyear = now.getYear()+1901;
			imonth = 1;
		}else {
			iyear = now.getYear()+1900;
			imonth = now.getMonth()+1;
		}
		System.out.println("iyear:"+iyear);
		System.out.println("imonth:"+imonth);
		System.out.println("now.getYear():"+now.getYear());
		System.out.println("sdf1.format(now):"+sdf1.format(now));
		System.out.println("sdf2.format(now):"+sdf2.format(now));
		
		SimpleDateFormat df=new SimpleDateFormat("yyyyMM"); //制定日期格式
		Calendar c=Calendar.getInstance();
		Date date=new Date();
		c.setTime(date);
		c.add(Calendar.MONTH,1); //将当前日期加一个月
		String validityDate=df.format(c.getTime());
		System.out.println(validityDate);
		System.out.println(validityDate.substring(0, 4));
		System.out.println(validityDate.substring(4, 6));
	}

}
