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

public class CommentOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DTOComment[] dtoComments = null;
		DAOStudy dao = new DAOStudy();

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

		String s_uid = multi.getParameter("s_uid");
		String m_uid = multi.getParameter("m_uid");
		String content = multi.getParameter("content");
		String parent_uid = multi.getParameter("parent_uid");

		if(content != null && content.trim().length() > 0 && s_uid != null && m_uid != null) {
			try {
				dtoComments = dao.insertComment(s_uid, m_uid, content, parent_uid);
				if(dtoComments != null && dtoComments.length > 0) {
					request.setAttribute("CommentList", dtoComments);
					new CommentJsonParse().execute(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
