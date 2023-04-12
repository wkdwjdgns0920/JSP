package com.KoreaIT.java.jam.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KoreaIT.java.jam.service.ArticleService;
import com.KoreaIT.java.jam.util.DBUtil;
import com.KoreaIT.java.jam.util.SecSql;

public class ArticleController {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private Connection conn;
	private ArticleService articleService;
	
	public ArticleController(HttpServletRequest request, HttpServletResponse response, Connection conn) {
		this.request = request;
		this.response = response;
		this.conn = conn;
		this.articleService = new ArticleService(conn);
	}

	public void showList() throws ServletException, IOException {
		int page = 1;

		if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int itemsInAPage = articleService.getItemsInAPage();

		int totalPage = articleService.getTotalPage();

		List<Map<String, Object>> articleRows = articleService.getForPrintArticleRows(page);

		request.setAttribute("page", page);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("articleRows", articleRows);
		request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
	}

	public void doWrite() throws IOException, ServletException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginedMemberId") == null) {
			response.getWriter()
			.append(String.format("<script>alert('로그인후에 이용해주세요'); location.replace('../member/login');</script>"));
			return;
		}
		request.getRequestDispatcher("/jsp/article/write.jsp").forward(request, response);
		
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		int loginedMemberId = (int)session.getAttribute("loginedMemberId");
		
		int id = articleService.getId(loginedMemberId,title,body);

		response.getWriter()
				.append(String.format("<script>alert('%d번 글이 생성되었습니다'); location.replace('list');</script>", id));

		
	}

	public void doDelete() throws IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginedMemberId") == null) {
			response.getWriter()
			.append(String.format("<script>alert('로그인후에 이용해주세요'); location.replace('../member/login');</script>"));
			return;
		}
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Map<String, Object> articleRow = articleService.getarticleRow(id);
		
		int loginedMemberId = (int)session.getAttribute("loginedMemberId");
		
		if(loginedMemberId != (int)articleRow.get("memberId")) {
			response.getWriter()
			.append(String.format("<script>alert('해당 게시글에 대한 권한이 없습니다'); location.replace('list');</script>"));
			return;
		}

		articleService.doDelete(id);

		response.getWriter()
				.append(String.format("<script>alert('%d번 글이 삭제되었습니다'); location.replace('list');</script>", id));
		
	}

}
