package com.echo.test.dao;

import static org.hamcrest.Matchers.greaterThan;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.echo.dao.roomdao.RoomDAOImpl;
import com.echo.domain.po.Room;
import com.echo.domain.po.RoomCheckItem;
import com.echo.domain.po.RoomType;
import com.echo.domain.type.RoomStatusType;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration(value = "src/main/webapp")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class RoomTest extends AbstractTransactionalJUnit4SpringContextTests{

	@Autowired
	private RoomDAOImpl roomDAOImpl;
	
	@Test
	public void testAddRoomType(){
		RoomType roomType = new RoomType();
		roomType.setTypeID(11);
		roomType.setTypeName("标准双人间");
		roomType.setTypeDesc("");
		assertTrue(roomDAOImpl.add(roomType));
	}
	
	@Test
	public void testGetAllRoomTypes(){
		List<RoomType> results = roomDAOImpl.getAllType(1);
		assertNotNull(results);
	}
	
	@Test
	public void testDeleteRoomTypes(){
//		assertFalse(roomDAOImpl.deleteType(3));
	}
	
	@Test
	public void testUpdateRoomType(){
		RoomType roomType = new RoomType();
		roomType.setTypeID(1);
		roomType.setTypeName("标准双人间");
		roomType.setTypeDesc("test3");
		assertTrue(roomDAOImpl.update(roomType));
	}
	
	@Test
	public void testAddRoom(){
		Room room = new Room(1, 888, (byte)2, "普通类", 888.0, (byte)1);
		assertTrue(roomDAOImpl.add(room));
	}
	
	@Test
	public void testDeleteRoom(){
		assertTrue(roomDAOImpl.delete(20));
	}
	
	@Test
	public void testUpdateRoom(){
		Room room = new Room();
		room.setId(25);
		room.setHotelID(1);
		room.setRoomNumber(803);
		room.setStatus((byte)1);
		room.setTypeID((byte)2);
		room.setTypeName("豪华房");
		room.setPrice(999.0);
		assertTrue(roomDAOImpl.update(room));
	}
	
	@Test
	public void testGetRoom(){
		assertNotNull(roomDAOImpl.get(1));
	}
	
	@Test
	public void testGetAllRooms(){
		assertNotNull(roomDAOImpl.getAll(1));
	}
	
	@Test
	public void testGetRoomsByStatus(){
		assertThat(roomDAOImpl.getRoomsByStatus(1, RoomStatusType.FREE).size(),greaterThan(0));
	}
	
	@Test
	public void testGetRoomsByPrice(){
		assertNotNull(roomDAOImpl.getRoomsByPrice(1, 300,900));
		List<Object[]> res = roomDAOImpl.getRoomsByPrice(1, 300,900);
		for(Object[] objArray :res){
			System.out.println(objArray[0]+"-"+objArray[1]+"-"+objArray[2]+"-"+objArray[3]);
		}
	}
	
	@Test
	public void testGetMin(){
		assertThat(roomDAOImpl.getMinPrice(1),greaterThan(0.0));
	}
	
	@Test
	public void testGetNumByRoomTypeID(){
		assertThat(roomDAOImpl.getNumByRoomTypeID(3),greaterThan(0));
	}
	
	@Test
	public void testAddRoomCheckItem(){
		RoomCheckItem roomCheckItem = new RoomCheckItem();
		roomCheckItem.setHotelID(123);
		roomCheckItem.setOrderID(123);
		roomCheckItem.setUserID(123);
		roomCheckItem.setRoomNumber(123);
		assertTrue(roomDAOImpl.add(roomCheckItem));
	}
	
 
}
