package command.studying;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import dbcommon.DAOStudy;
import dbcommon.DTOStudyTable;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAOStudy daoStudy = new DAOStudy();
		DTOStudyTable[] table = null;

		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		// 페이징 세팅
		int page = 1;
		int pageRows = 10;
		int writePages = 5;
		int totalCnt = 0;
		int totalPage = 0;

		String param;

		param = request.getParameter("page");
		if(param != null && param.trim().length() != 0) {
			try {
				page = Integer.parseInt(param);
			} catch (NumberFormatException e) {
			}
		}

		param = request.getParameter("pageRows");
		if(param != null && param.trim().length() != 0) {
			try {
				pageRows = Integer.parseInt(param);
			} catch (NumberFormatException e) {
			}
		}

		try {
			StringBuffer fromBlock = new StringBuffer();
			String totalFromBlock = "s_table";
			StringBuffer totalWhereBlock = new StringBuffer();
			fromBlock.append("s_table");


			int fromRow = (page - 1) * pageRows + 1;

			fromBlock.setLength(0);
			fromBlock.append("SELECT * FROM s_table WHERE ");

			String search = "";		// 검색어 저장
			String category = "";	// 카테고리 저장
			// 검색어가 존재한다면
			param = request.getParameter("search");
			if(param != null && param.trim().length() != 0) {
				search = param;
				fromBlock.append("REGEXP_LIKE(S_TITLE||REGEXP_REPLACE(S_CONTENT ,'<(/)?(img|label|table|thead|tbody|tfoot|tr|td|p|br|div|span|font|strong|b)(.|\\s|\\t|\\n|\\r\\n)*?>', '') , '" + search + "', 'i') AND ");
				totalWhereBlock.append("REGEXP_LIKE(S_TITLE||REGEXP_REPLACE(S_CONTENT ,'<(/)?(img|label|table|thead|tbody|tfoot|tr|td|p|br|div|span|font|strong|b)(.|\\s|\\t|\\n|\\r\\n)*?>', '') , '" + search + "', 'i') AND ");
				message.append(search + "의 ");
			}

			int curCategory = 0;
			// 카테고리가 존재한다면
			param = request.getParameter("category");
			if(param != null && param.trim().length() != 0) {
				// 카테고리의 최대 번호
				int max = daoStudy.maxCol("SC_UID", "S_CATEGORY");
				// 파라미터로 넘어온 카테고리의 번호를 저장
				try {
					curCategory = Integer.parseInt(param);
				} catch (NumberFormatException e) {
					// 카테고리가 숫자가 아니면 0으로
					e.printStackTrace();
				}
				// 만약 카테고리 번호가 잘못 넘어왔다면 0으로
				if(curCategory > max || curCategory < 1) {
					curCategory = 0;
				}
			}

			if(curCategory == 0) {
				fromBlock.append("SC_UID > 0 ");
				totalWhereBlock.append("SC_UID > 0 ");
			} else {
				fromBlock.append("SC_UID = " + curCategory + " ");
				totalWhereBlock.append("SC_UID = " + curCategory + " ");
			}
			// s_uid 역순으로 정렬
			fromBlock.append("ORDER BY s_uid DESC");

			totalCnt = daoStudy.countAll(totalFromBlock, totalWhereBlock.toString());
			totalPage = (int) Math.ceil(totalCnt / (double)pageRows);

			table = daoStudy.selectFromRow(fromRow, pageRows, fromBlock.toString());

			if(table == null) {
				message.append("검색 결과가 없습니다.");
				status = "OK";
			} else {
				message.append("검색 결과");
				status = "OK";
			}


//			table = daoStudy.selectAll();
//			request.setAttribute("listRow", table);
		} catch (SQLException e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러:" + e.getMessage() + "]");
			try {
				daoStudy.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

		request.setAttribute("status", status);
		request.setAttribute("message", message.toString());
		request.setAttribute("list", table);

		request.setAttribute("page", page );
		request.setAttribute("totalPage", totalPage );
		request.setAttribute("writePages", writePages );
		request.setAttribute("pageRows", pageRows );
		request.setAttribute("totalCnt", totalCnt );

	} // end execute()

} // end Class
