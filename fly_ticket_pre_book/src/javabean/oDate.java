package javabean;

import java.util.Calendar;

/********************
*@author created by xiaohutuxian
*@date  2019年6月14日---上午10:34:12
*@IDE	eclipse
*@jdk	1.8.0_161
*********************/
public class oDate {
	public String get_date() {
		String date=null;
		Calendar cal=Calendar.getInstance(); 
		int y=cal.get(Calendar.YEAR);
		int m=cal.get(Calendar.MONTH)+1; 
		int d=cal.get(Calendar.DATE);
		date=y+"-"+m+"-"+d;
		return date;
	}
	 
}
