package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Page_testCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int curPage =1;
		
		String pageParam = request.getParameter("page");
		if(pageParam != null && pageParam.trim().equals("")) {
			try {
				int p = Integer.parseInt(pageParam);
				if(p>0) curPage =p;
			} catch(NumberFormatException e) {
				
			}
		}// end if
	}

}
