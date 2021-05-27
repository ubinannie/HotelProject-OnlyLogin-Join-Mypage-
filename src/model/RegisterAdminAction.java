package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.AdminDAO;
import vo.AdminVO;

public class RegisterAdminAction implements Action{
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String mp1 = req.getParameter("mp1");
		String mp2 = req.getParameter("mp2");
		
		String viewPage = null;
		
		AdminDAO dao = new AdminDAO();
		AdminVO vo = new AdminVO(id, pw, name, email, "010-"+mp1+"-"+mp2);
		
		dao.addAdmin(vo);
		
		viewPage = "/MiniHotel/registerOk011.jsp";
		
		return viewPage;
		
	} // execute() end

}
