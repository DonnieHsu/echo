package com.echo.service.hotelpromotionservice;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.echo.domain.po.PromotionDate;

public class SpecificDatePromotionStrategy implements HotelPromotionStrategy{
	
	@Autowired
	private HotelPromotionServiceImpl hotelPromotionServiceImpl;

	@Override
	public double getPrice(HotelPriceHandleContext ctx)  {
		List<PromotionDate> dates = hotelPromotionServiceImpl.getHotelPromotionDateList(ctx.getHotelID());
		if(dates == null){
			return ctx.getOriginalPrice();
		}
		
		Date current = new Date();
		double discount = 1;
		
		for(PromotionDate pd : dates){
			try {
				if( getDiff(current,pd.getStartDate()) >= 0 && getDiff(pd.getEndDate(),current) >= 0){
					discount = pd.getDiscount();
					break;
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		
		return ctx.getOriginalPrice() * discount;
	}
	
	
	private static long getDiff(Date date1,Date date2) throws ParseException{
		  long quot=0;
		  quot=date1.getTime()-date2.getTime();
		  quot=quot/1000/60/60/24;
		  return quot;
	  }

}
