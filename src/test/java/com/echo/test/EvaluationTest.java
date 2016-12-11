package com.echo.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.echo.domain.po.Evaluation;
import com.echo.service.evaluationservice.EvaluationServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration(value = "WebContent")
@ContextHierarchy({
        @ContextConfiguration(name = "parent", locations = "classpath:applicationContext.xml"),
        @ContextConfiguration(name = "child", locations = "classpath:springmvc.xml")
})
public class EvaluationTest {
	
	@Autowired
	private EvaluationServiceImpl impl;
	
	@Test
	public void testAdd(){
		Evaluation evaluation = new Evaluation();
		evaluation.setHotelID(1);
		evaluation.setCustomerID(2);
		evaluation.setCustomerName("CustomerName");
		evaluation.setMark(5);
		evaluation.setMerit("merit");
		evaluation.setDemerit("demerit");
		evaluation.setComment("comment");
		evaluation.setRoomTypeName("roomtypeName");
		impl.generateEva(evaluation);
	}

}
