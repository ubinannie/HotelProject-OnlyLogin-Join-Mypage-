package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.Member_Dao;
import vo.Member_Vo;

public class LoginAction implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// 로그인 처리해주는 로직
		
		// 사용자가 친 정보를 가져와야함
		// 나는 아이디랑 패스워드만 확인하는 로직을 구성했으니 아이디랑 비밀번호 가져오기
		// jsp의  name값 확인
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		String viewPage = null;
		
		int result = 0;
		
		Member_Dao dao = new Member_Dao();
		// login : dao생성자 -> id랑 pw값으로 회원 유무 확인하기
		result = dao.login(id, pw);
		
		// dao에서 로그인 성공했을 때 1값을 주게 처리해놨음
		if(result == 1) {
			
			// getData : dao생성자 -> id값으로 회원정보 불러오기
			Member_Vo vo = dao.getData(id);
			
			HttpSession session = req.getSession();
			
			// vo에 값 저장해놓기 (id값으로 10개 정보)
			session.setAttribute("member", vo);
			// result 값 저장해놓기
			session.setAttribute("result", result);
			
			// 로그인 성공시
			viewPage = "/MiniHotel/registerOk.jsp";
	
		}else{
			// 로그인 실패시
			Member_Vo vo = dao.getData(id);
			
			HttpSession session = req.getSession();
			
			// vo에 값 저장해놓기 (id값으로 10개 정보)
			session.setAttribute("member", vo);
			// result 값 저장해놓기
			session.setAttribute("result", result);

			viewPage = "/MiniHotel/loginOk.jsp";
			// alert('비밀번호가 틀립니다.');
		}
		
		return viewPage;
	}
	
	
}
