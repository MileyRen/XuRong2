package test;

public class StringSplitTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String str ="24罐/箱";
		System.out.println(str.split("/")[0].charAt(str.split("/")[0].length()-1));
	}

}
