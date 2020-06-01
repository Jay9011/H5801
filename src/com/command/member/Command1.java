// 공통으로 implement 하는 interface
package com.command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command1 {
	void execute(HttpServletRequest request, HttpServletResponse response);
}
