package portit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import portit.model.dao.MemberDao;
import portit.model.dao.SearchDao;
import portit.model.dto.Member;
import portit.model.dto.Portfolio;

@WebServlet(urlPatterns="/search")
public class SearchController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String cmd = req.getParameter("cmd");
		String url = null;
		
		//검색어 저장
		String search = req.getParameter("search");
		req.setAttribute("search", search);
		
		//dao 호출
		SearchDao searchDao = new SearchDao();		
		List port_list = searchDao.searchAll_port(search);
		List dev_list = searchDao.searchAll_developer(search);
		List proj_list = searchDao.searchAll_proj(search);
	
		//Model에서 가지고 온 정보를 View에 넘겨주기 위해 변수 선언
		req.setAttribute("port_list", port_list);
		req.setAttribute("dev_list", dev_list);
		req.setAttribute("proj_list", proj_list);			
		
		
		if(cmd.equals("SEARCH")){
			url="/searchAll.jsp";
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req,resp);
	}
}
