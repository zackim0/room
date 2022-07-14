package com.room.view;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.View;

import com.room.dto.GIBoardAttach;

public class GameIntroduceDownloadView implements View {
	
	@Override
	public void render(Map<String,?> model, // Controller에서 전달한 데이터
						HttpServletRequest req , HttpServletResponse resp)
			throws Exception{
		String uploadDir = (String)model.get("uploadDir");
		GIBoardAttach boardAttach = (GIBoardAttach)model.get("boardAttach");
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath(uploadDir + boardAttach.getSavedFileName());
		
		//브라우저가 응답 컨텐츠를 다운로드로 처리하도록 정보 설정
		resp.setContentType("application/octet-stream;charset=utf-8");
		
		//브라우저에게 다운로드하는 파일의 이름을 알려주는 코드
		resp.addHeader("Content-Disposition",
				"Attachment;filename=\""+
				new String(boardAttach.getUserFileName().getBytes("utf-8"),"ISO-8859-1")+"\"");

		FileInputStream fis = new FileInputStream(path);
		OutputStream fos = resp.getOutputStream();
		
		while(true) {
			int data = fis.read();
			if(data == -1) {
				break;
			}
			fos.write(data);
		}
		
		fis.close();
		fos.close();
		
	}

}
