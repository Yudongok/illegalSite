package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.model.LoginDAO;
import mvc.model.LoginDTO;

public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RequestURI= request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/LoginAction.do")) {
			boolean status = requestLoginAction(request);
			if(status) {
				RequestDispatcher rd = request.getRequestDispatcher("./Login/main.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("./Login/loginFail.jsp");
				rd.forward(request, response);
			}
		}else if(command.equals("/LoginNewMember.do")) {
			requestLoginAction(request);
			RequestDispatcher rd = request.getRequestDispatcher("./Login/newMember.jsp");
		}
	}
	
	public boolean requestLoginAction(HttpServletRequest request) {
		LoginDAO dao = LoginDAO.getInstance();
		ArrayList<LoginDTO> loginlist = new ArrayList<LoginDTO>();
		
		String DB_id= null;
		String DB_pw= null;
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		DB_id = dao.getId(id);
		if(DB_id == id) {
			DB_pw = dao.getPasswd(id, passwd);
			if(DB_pw == passwd) {
				int balance = ((LoginDAO) request).getBalance(id);
				String name = ((LoginDAO) request).getName(id);
				request.setAttribute("name", name);
				request.setAttribute("balance", balance);
				return true;
			}
			else {
				return false;
			}
		}	
		else {
			return false;
		}
	}

	public LoginController() {
		// TODO Auto-generated constructor stub
	}

}
