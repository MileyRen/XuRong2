package test;

import org.junit.Test;
import static org.junit.Assert.*;

public class SayHelloTest {
	
	@Test
	public void helloTest(){

		assertEquals(new SayHello().hello(), "hello");

	}
}
