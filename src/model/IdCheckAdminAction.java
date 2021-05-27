package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.AdminDAO;

public class IdCheckAdminAction implements Action{
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		// DB연동해서 아이디가 중복하는지 확인
		// cnt값으로 돌려주게 dao에서 처리해놨음
		AdminDAO dao = new AdminDAO();
		String id = req.getParameter("personName");
		
		String viewPage = null;
		
		// 아이디 중복 확인 결과값을 cnt로 받아오게 dao에서 처리
		int cnt = dao.duplecateID(id);
		
		// cnt 가 0 -> 사용 가능한 아이디
		if(cnt == 0) {
			HttpSession session = req.getSession();
			
			session.setAttribute("id", id);
			// cnt값을 밑에 주소로 보내주기 위해서 session에 담기
			session.setAttribute("cnt", cnt);
			
			viewPage = "/MiniHotel/IDCheck02.jsp";
			
		// 아이디 중복 확인 실패 시 
		}else {
			HttpSession session = req.getSession();

			session.setAttribute("cnt", cnt);
			
			viewPage = "/MiniHotel/IDCheck02.jsp";
		}
		return viewPage;
	}

}
