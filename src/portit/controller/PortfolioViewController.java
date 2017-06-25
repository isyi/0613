package portit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import portit.model.dao.Portfolio_ViewDao;
import portit.model.dao.SearchDao;


@WebServlet(urlPatterns="/pfSearch")
public class PortfolioViewController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setContentType("text/html; charset=UTF-8");
		String cmd = req.getParameter("cmd");
		String url = null;
		HttpSession session = req.getSession();
		
		session.removeAttribute("search");
		//검색어 결과
		String pfSearch = req.getParameter("pfSearch");
		pfSearch = pfSearch.toUpperCase();
		req.setAttribute("pfSearch", pfSearch);
		
		//포트폴리오 Dao 호출
		SearchDao searchDao = new SearchDao();		
		List port_list = searchDao.searchAll_port(pfSearch);
		
		//Controller -> Model로 넘겨주기 위한 변수
		req.setAttribute("port_list", port_list);
		
		if(cmd.equals("PFSEARCH")){
			url="/pfSearch.jsp";
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req,resp);
	}
}
