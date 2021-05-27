package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.Member_Dao;
import vo.Member_Vo;

public class MyPageAction implements Action{
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// 회원정보 수정할 수 있게 처리해주는 곳
		
		// vo에 들어있는 id값을 가져와야함
		HttpSession session = req.getSession();
		
		Member_Vo member = (Member_Vo)session.getAttribute("member");
		String id = member.getId();
		
		// 사용자가 친 (수정할 때 친 정보)를 가져와야함 
		// 나는 비밀번호 / 핸드폰번호 / 이름 수정 할 수 있게 해놨음
		String pw = req.getParameter("pw");
		
		String tel = "";
		String mp1 = req.getParameter("mp1");
		String mp2 = req.getParameter("mp2");
		
		tel = "010-"+mp1+"-"+mp2;
		
		String name= req.getParameter("name");
		
		String viewPage = null;
		
		int result = 0;
		
		// 정보 수정 함수
		Member_Dao memDao = new Member_Dao();		
		Member_Vo vo = new Member_Vo();
		
		vo.setId(id);
		vo.setPw(pw);
		vo.setName(name);
		vo.setTel(tel);
		
		// updateData에서 수정 업데이트를 하였을 때
		// 수정 성공했을 때 : 1을 돌려주고
		// 수정 실패했을 때 : -1을 돌려줌
		result = memDao.updateData(vo);

		// 회원 수정을 성공했다면
		if(result == 1){
			
			// getData : dao 생성자 -> id값으로 회원정보 불러오기
			vo = memDao.getData(id);
			
			session = req.getSession();
			
			// id로 10개의 정보를 불러오기
			session.setAttribute("member", vo);
			
			// result값 저장해놓기 -> 값 넘기기용
			session.setAttribute("result", result);
			
			// 정보 수정 성공시 넘어가는 페이지
			viewPage = "/MiniHotel/mypageOk.jsp";
			
			
		// 회원 수정을 실패했다면	
		}else{
			
			// getData : dao 생성자 -> id값으로 회원정보 불러오기
			vo = memDao.getData(id);
						
			session = req.getSession();
						
			// id로 10개의 정보를 불러오기
			session.setAttribute("member", vo);
						
			// result값 저장해놓기 -> 값 넘기기용
			session.setAttribute("result", result);
						
			// 정보 수정 성공시 넘어가는 페이지
			viewPage = "/MiniHotel/mypageOk.jsp";
			
		}
		
		System.out.println(result);
		return viewPage;
		
	}

}
