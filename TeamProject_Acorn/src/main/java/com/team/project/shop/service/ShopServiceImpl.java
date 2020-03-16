//package com.team.project.shop.service;
//
//import java.util.List;
//import java.util.Random;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.team.project.exception.NoDeliveryException;
//import com.team.project.shop.dao.OrderDao;
//import com.team.project.shop.dao.ShopDao;
//import com.team.project.shop.dto.OrderDto;
//import com.team.project.shop.dto.ShopDto;
//
//@Service
//public class ShopServiceImpl implements ShopService {
//	// 의존 객체
//	@Autowired
//	private ShopDao shopDao;
////	@Autowired
////	private OrderDao orderDao;
//	
//	@Override
//	public void getList(ModelAndView mView) {
//		List<ShopDto> list=shopDao.getList();
//		mView.addObject("list", list);
//	}
//
//	// 상품 구입처리를 하는 비즈니스 로직 (묶음으로 관리)
//	@Transactional
//	@Override
//	public void buy(HttpServletRequest request, ModelAndView mView) {
//		String id=(String)request.getSession().getAttribute("id");
//		int num=Integer.parseInt(request.getParameter("num"));
//		int price=shopDao.getPrice(num);
//		ShopDto dto=new ShopDto();
//		dto.setId(id);
//		dto.setPrice(price);
//		dto.setNum(num);
//		shopDao.minusMoney(dto);
//		shopDao.plusPoint(dto);
//		shopDao.minusCount(num);
//		OrderDto dto2=new OrderDto();
//		dto2.setId(id);
//		dto2.setCode(num);
//		dto2.setAddr("서울특별시 강남구 테헤란로 124 삼원타워 5층");
////		orderDao.addOrder(dto2);
//	}
//
//}
