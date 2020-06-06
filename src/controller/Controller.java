package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.BookCommand;
import command.Command;
import command.JoinCommand;
import command.LoadCommand;
import command.LoginCommand;
import command.LogoutCommand;
import command.Page_testCommand;
import command.ReinfoCommand;
import command.ReinfoOkCommand;
import command.SelectCommand;
import command.SendCommand;
import command.UpdateCommand;
import command.chkMailCommand;
import command.chkNickCommand;
import command.studying.ComDeleteOk;
import command.studying.CommentJsonParse;
import command.studying.CommentList;
import command.studying.CommentOk;
import command.studying.DeleteOk;
import command.studying.FavorClick;
import command.studying.FileUploadCommand;
import command.studying.ResultJsonParse;
import command.studying.TableList;
import command.studying.Update;
import command.studying.UpdateOk;
import command.studying.View;
import command.studying.WriteOk;
import command.studying.WriteTable;
import command.studying.comUpdate;
import command.studying.comUpdateOk;

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

//		마이페이지
		case "/MyPage/list.ho":
			command = new LoadCommand();
			command.execute(request, response);
			viewPage = "/MyPage/list.jsp";
			break;

		case "/MyPage/reInfo.ho":
			command = new ReinfoCommand();
			command.execute(request, response);
			viewPage = "/MyPage/reInfo.jsp";
			break;
		
		case "/MyPage/reInfoOk.ho":
			command = new ReinfoOkCommand();
			command.execute(request, response);
			viewPage = "/MyPage/reInfoOk.jsp";
			break;

			// 예약현황 목록
		case "/MyPage/book.ho":
			new BookCommand().execute(request, response);
			viewPage = "book.jsp";
			break;

		case "/User/login.ho":
			command = new LoginCommand();
			command.execute(request, response);
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
		case "/User/nickChk.ho":
			command = new chkNickCommand();
			command.execute(request, response);
			viewPage = "nickChk.jsp";
			break;
		case "/User/emailChk.ho":
			command = new chkMailCommand();
			command.execute(request, response);
			viewPage = "emailChk.jsp";
			break;
		case "/index.ho":
			viewPage = "index.jsp";
			break;
		case "/User/logout.ho":
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "logout.jsp";
			break;

		// 비밀번호 찾기(인증번호 받기)
		case "/User/findPw.ho":
			viewPage = "findPw.jsp";
			break;

		case "/User/findPwOk.ho":
			new SendCommand().execute(request, response);
			viewPage = "findPwOk.jsp";
			break;

		// 비밀번호 변경
		case "/User/resetPw.ho":
			new SelectCommand().execute(request, response);
			viewPage = "resetPw.jsp";
			break;

		case "/User/resetPwOk.ho":
			new UpdateCommand().execute(request, response);
			viewPage = "resetPwOk.jsp";
			break;


		}


		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
