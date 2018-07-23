package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DietTipController {
	String getList(HttpServletRequest request);

	String getInfo(HttpServletRequest request);

	void registDietTip(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
