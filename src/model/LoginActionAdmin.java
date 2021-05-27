package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.AdminDAO;
import vo.AdminVO;

public class LoginActionAdmin implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// 로그인 처리해주는 로직 (관리자)
		
		// 사용자가 친 정보를 가져와야함 (아이디 + 비밀번호)
		String id = req.getParameter("ad_id");
		String pw = req.getParameter("ad_password");
		
		String viewPage = null;
		
		int result = 0;
		
		AdminDAO dao = new AdminDAO();
		
		// login : dao생성자 -> id랑 pw값으로 회원 유무 확인하기
		result = dao.login(id, pw);
		
		// dao에서 로그인 성공했을 때 1값을 돌려주게 처리해놨음
		if(result == 1) {
			
			// getData : dao생성자 -> id값으로 회원정보 불러오기
			AdminVO vo = dao.getData(id);
			
			HttpSession session = req.getSession();
			
			// vo 값에 id로 회원 정보들 얻어오기
			session.setAttribute("admin", vo);
			
			// result 값 저장해놓기
			session.setAttribute("result", result);
			
			// 로그인 성공 시 돌아가는 파일 이름
			viewPage = "/MiniHotel/registerOk02.jsp";
			
		}else {
			// 로그인 실패시
			AdminVO vo = dao.getData(id);
			
			HttpSession session = req.getSession();
			
			// vo 값에 id로 회원 정보들 얻어오기
			session.setAttribute("admin", vo);
			
			// result 값 저장해놓기
			session.setAttribute("result", result);
			
			// 로그인 성공 시 돌아가는 파일 이름
			viewPage = "/MiniHotel/registerOk02.jsp";
			
		}
		return viewPage;
		
	}
	
}
