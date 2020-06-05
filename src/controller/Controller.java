package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import command.login.LoginCommand;
import command.studying.ComDeleteOk;
import command.studying.CommentJsonParse;
import command.studying.CommentList;
import command.studying.TableList;
import command.studying.Update;
import command.studying.UpdateOk;
import command.studying.View;
import command.studying.WriteOk;
import command.studying.WriteTable;
import command.studying.comUpdate;
import command.studying.comUpdateOk;
import command.studying.CommentOk;
import command.studying.DeleteOk;
import command.studying.FavorClick;
import command.studying.ResultJsonParse;
import command.studying.FileUploadCommand;

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
			viewPage = "Login.jsp";
			break;

		case "/Login/LoginOk.ho":
			command = new LoginCommand();
			command.execute(request, response);
			viewPage = "LoginOk.jsp";
			break;

		case "/StudyBoard/list.ho":
			command = new TableList();
			command.execute(request, response);
			viewPage = "list.jsp";
			break;

		case "/StudyBoard/write.ho":
			command = new WriteTable();
			command.execute(request, response);
			viewPage = "write.jsp";
			break;

		case "/StudyBoard/writeOk.ho":
			command = new WriteOk();
			command.execute(request, response);
			viewPage = "writeOk.jsp";
			break;

		case "/StudyBoard/view.ho":
			command = new View();
			command.execute(request, response);
			viewPage = "view.jsp";
			break;

		case "/StudyBoard/commentJSON.ho":
			new CommentList().execute(request, response);
			new CommentJsonParse().execute(request, response);
			break;

		case "/StudyBoard/commentOk.ho":
			command = new CommentOk();
			command.execute(request, response);
			break;

		case "/StudyBoard/fileUpload.ho":
			new FileUploadCommand().execute(request, response);
			break;

		case "/StudyBoard/update.ho":
			command = new Update();
			command.execute(request, response);
			viewPage = "update.jsp";
			break;

		case "/StudyBoard/updateOk.ho":
			command = new UpdateOk();
			command.execute(request, response);
			viewPage = "updateOk.jsp";
			break;

		case "/StudyBoard/comUpdate.ho":
			new comUpdate().execute(request, response);
			new CommentJsonParse().execute(request, response);
			break;

		case "/StudyBoard/comUpdateOk.ho":
			new comUpdateOk().execute(request, response);
			new ResultJsonParse().execute(request, response);
			break;

		case "/StudyBoard/deleteOk.ho":
			command = new DeleteOk();
			command.execute(request, response);
			viewPage = "deleteOk.jsp";
			break;

		case "/StudyBoard/comDeleteOk.ho":
			new ComDeleteOk().execute(request, response);
			new ResultJsonParse().execute(request, response);
			break;

		case "/StudyBoard/favor.ho":
			new FavorClick().execute(request, response);
			break;
		}


		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
