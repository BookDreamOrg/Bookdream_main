package com.spring.bookdream.visit;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.spring.bookdream.dao.VisitDAO;
import com.spring.bookdream.vo.VisitVO;

public class VisitSessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
		VisitDAO visitDAO = (VisitDAO)wac.getBean("visitDAO");
		VisitVO visitVO = new VisitVO();
		visitDAO.insertVisitor(visitVO);
	}


	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
	}

}
