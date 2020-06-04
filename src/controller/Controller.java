package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.JoinCommand;
import command.LoadCommand;
import command.LogoutCommand;
import command.login.LoginCommand;
import command.studying.TableList;
import command.studying.View;
import command.studying.WriteOk;
import command.studying.WriteTable;
import command.studying.commentOk;

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

		// 테스트 출 력
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

		case "/StudyBoard/view.ho":
			command = new View();
			command.execute(request, response);
			viewPage = "/StudyBoard/view.jsp";
			break;

		case "/StudyBoard/commentOk.ho":
			command = new commentOk();
			command.execute(request, response);
			break;
			
		case "/MyPage/list.ho":
			command = new LoadCommand();
			command.execute(request, response);
			break;
		case "/User/login.ho":
			viewPage = "login.jsp";
			break;
		case "/User/loginOk.ho":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "loginOk.jsp";
			break;
		case "/User/joinchk.ho":
			viewPage = "joinchk.jsp";
			break;
		case "/User/join.ho":
			viewPage = "join.jsp";
			break;
		case "/User/joinOk.ho":
			command = new JoinCommand();
			command.execute(request, response);
			viewPage = "joinOk.jsp";
			break;
		case "/index.ho":
			viewPage = "index.jsp";
			break;
		case "/User/logout.ho":
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "logout.jsp";
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
