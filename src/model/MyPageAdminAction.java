package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.AdminDAO;
import vo.AdminVO;

public class MyPageAdminAction implements Action{
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// 회원정보 수정 할 수 있게 처리해주는 곳
		
		// vo에 들어있는 id값을 가져와야함
		HttpSession session = req.getSession();
		
		AdminVO admin = (AdminVO)session.getAttribute("admin");
		String id = admin.getAd_id();
		
		// 사용자가 친 (수정할 때 친 정보)를 가져와야함 
		// 나는 비밀번호 / 핸드폰번호 / 이름 수정 할 수 있게 해놨음
		String pw = req.getParameter("pw");
		
		String tel = "";
		String mp1 = req.getParameter("mp1");
		String mp2 = req.getParameter("mp2");
		
		tel = "010-"+mp1+"-"+mp2;
		
		String name = req.getParameter("name");
		
		String viewPage = null;
		
		int result = 0;
		
		// 정보 수정 dao 불러오기
		AdminDAO admindao = new AdminDAO();
		AdminVO vo = new AdminVO();
		
		vo.setAd_id(id);
		vo.setAd_password(pw);
		vo.setAd_name(name);
		vo.setAd_tel(tel);
		
		// 수정 업데이트를 했을 때
		result = admindao.updateData(vo);
		
		// 회원 수정을 성공했다면
		if(result == 1) {
			
			// getData 생성자를 통해 id값으로 관리자 정보들을 가져오기
			vo = admindao.getData(id);
			
			session = req.getSession();
			
			// 관리자 정보를 저장해서 넘겨주기위한 곳
			session.setAttribute("admin", vo);
			
			// result 값을 저장해서 넘겨주기 위한 곳
			session.setAttribute("result", result);
			
			// 성공하면 가주는 페이지
			viewPage = "/MiniHotel/mypageOk02.jsp";
		
		// 회원 정보 수정에 실패 했을 경우
		}else {
			
			vo = admindao.getData(id);
			
			session = req.getSession();
			
			session.setAttribute("admin", vo);
			
			session.setAttribute("result", result);
			
			viewPage = "/MiniHotel/mypageOk02.jsp";
		}
		
		System.out.println(result);
		return viewPage;
	}

}
