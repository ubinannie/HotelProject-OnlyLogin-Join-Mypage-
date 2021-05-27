package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.Member_Dao;

public class IdCheckAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// DB연동해서 아이디가 중복하는지 확인 cnt로 값을 돌려주게 dao에서 처리해놨음
		
		Member_Dao dao = new Member_Dao();
		String id=req.getParameter("personName");
		
		String viewPage = null;
		
		// 아이디 중복 확인 결과값은 cnt로 받아오게 dao에서 처리해놨음
		int cnt=dao.duplecateID(id);	
		
		// cnt 가 0이면 사용가능한 아이디 
		if(cnt == 0) {
			
			HttpSession session = req.getSession();
			
			session.setAttribute("id", id);
			
			// cnt 결과 값 저장하기
			session.setAttribute("cnt", cnt);
			
			// 아이디 중복 확인 (성공 시)
			viewPage = "/MiniHotel/IDCheck.jsp";
			
		}else {
			// 아이디 중복 확인 (실패 시)
			HttpSession session = req.getSession();
			
			// cnt 결과 값 저장하기
			session.setAttribute("cnt", cnt);

			viewPage = "/MiniHotel/IDCheck.jsp";
			
		}
		return viewPage;
	}
}
