package kr.ac.kopo.polycms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		

		if(!"admin".equals(session.getAttribute("admin"))&& !"admin".equals(session.getAttribute("user"))) {
			response.sendRedirect("login");
			return false;
		}
		
		return true;
	}
	
}
