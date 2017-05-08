package org.ecnu.util;

import java.lang.reflect.Array;

public class MD5Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MD5 m = new MD5();
        if (Array.getLength(args) == 0) {
            System.out.println("MD5 Test suite:");
        	System.out.println("MD5(\"\"):"+m.getMD5ofStr(""));
        	System.out.println("MD5(\"a\"):"+m.getMD5ofStr("a"));
        	System.out.println("MD5(\"abc\"):"+m.getMD5ofStr("abc"));
        	System.out.println("MD5(\"message digest\"):"+m.getMD5ofStr("message digest"));
        	System.out.println("MD5(\"abcdefghijklmnopqrstuvwxyz\"):"+
                m.getMD5ofStr("abcdefghijklmnopqrstuvwxyz"));
        	System.out.println("MD5(\"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\"):"+
             	m.getMD5ofStr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"));
        	System.out.println("MD5(\"0112345678901234512345678W40620121011181246\"):"+m.getMD5ofStr("0112345678901234512345678W40620121011181246"));
        }
        else System.out.println("MD5(" + args[0] + ")=" + m.getMD5ofStr(args[0]));
    }
}

