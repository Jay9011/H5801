package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import login.LoginCommand;
import studying.TableList;
import studying.WriteOk;
import studying.WriteTable;

@WebServlet("*.ho")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionHo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionHo(request, response);
	}

	protected void actionHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		Command command = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		// 테스트 출력
		System.out.println("uri: " + uri);
		System.out.println("conPath: " + conPath);
		System.out.println("com: " + com);

		switch (com) {
		case "/Login/Login.ho":
			viewPage = "/Login/Login.jsp";
			break;

		case "/Login/LoginOk.ho":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "LoginOk.jsp";
			break;

		case "/StudyBoard/list.ho":
			command = new TableList();
			command.execute(request, response);
			viewPage = "/StudyBoard/list.jsp";
			break;

		case "/StudyBoard/write.ho":
			command = new WriteTable();
			command.execute(request, response);
			viewPage = "/StudyBoard/write.jsp";
			break;

		case "/StudyBoard/writeOk.ho":
			command = new WriteOk();
			command.execute(request, response);
			viewPage = "/StudyBoard/writeOk.jsp";
			break;

		default:
			break;
		}

		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
