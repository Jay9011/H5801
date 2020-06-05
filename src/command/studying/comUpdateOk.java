package command.studying;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

import command.Command;
import dbcommon.DAOStudy;
import dbcommon.DTOComment;

public class comUpdateOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy daoStudy = new DAOStudy();
		int result = 0;

		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "utf-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		int sr_uid = Integer.parseInt(multi.getParameter("sr_uid"));
		String content = multi.getParameter("content");

		try {
			result = daoStudy.updateComment(content, sr_uid);
			request.setAttribute("result", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
