package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.Member_Dao;
import vo.Member_Vo;

public class RegisterAction implements Action{
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		// DB연동해서 회원가입 해주게하는 곳
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String birth = req.getParameter("birth");
		String mp1 = req.getParameter("mp1");
		String mp2 = req.getParameter("mp2");
		String nickname = req.getParameter("nick");
		
		String viewPage = null;
		
		Member_Dao dao = new Member_Dao();
		
		Member_Vo vo = 
				new Member_Vo(id, pw, name, nickname, email, birth, "010-"+mp1+"-"+mp2);
				
		dao.addData(vo);
		
		viewPage = "/MiniHotel/registerOk01.jsp";
		
		return viewPage;
		
	} // execute() end

}
