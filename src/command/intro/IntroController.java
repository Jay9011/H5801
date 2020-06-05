package command.intro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;

@WebServlet("*.fc2")
public class IntroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IntroController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		intros(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		intros(request, response);
	}
	
	protected void intros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		case "/Intro/introduce.fc2":
			System.out.println("아아악");
			command = new IntroLoad();
			command.execute(request, response);
			viewPage = "introduce.jsp";
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
