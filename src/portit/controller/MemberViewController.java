package portit.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import portit.model.dao.Portfolio_ViewDao;
import portit.model.dao.SearchDao;


@WebServlet(urlPatterns="/memSearch")
public class MemberViewController extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		resp.setContentType("text/html; charset=UTF-8");
		String cmd = req.getParameter("cmd");
		String url = null;
		
		//검색어 저장
		String memSearch = req.getParameter("memSearch");
		memSearch = memSearch.toUpperCase();
		req.setAttribute("memSearch", memSearch);
		
		//dao 호출
		SearchDao searchDao = new SearchDao();		
		List mem_list = searchDao.searchAll_member(memSearch);

		//Model에서 가지고 온 정보를 View에 넘겨주기 위해 변수 선언
		req.setAttribute("mem_list", mem_list);

		
		if(cmd.equals("MEMSEARCH")){
			url="/memSearch.jsp";
		}

		RequestDispatcher view = req.getRequestDispatcher(url);
		view.forward(req,resp);
	}
}
