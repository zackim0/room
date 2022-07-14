package com.room.view;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.View;

import com.room.dto.MateBoardAttach;

public class MateDownloadView implements View {

	@Override
	public void render(Map<String, ?> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// Controller에서 전달한 데이터 읽기
				String uploadDir = (String)model.get("uploadDir");
				MateBoardAttach boardAttach = (MateBoardAttach)model.get("mateBoardAttach");
				
				//ServletContext : JSP의 application객체와 동일한 객체
				ServletContext application = request.getServletContext();		
				String path = 
					application.getRealPath(uploadDir + boardAttach.getSavedFileName());				
						
				//브라우저가 응답 컨텐츠를 다운로드로 처리하도록 정보 설정
				response.setContentType("application/octet-stream;charset=utf-8");	
				
				//브라우저에게 다운로드하는 파일의 이름을 알려주는 코드 
				response.addHeader("Content-Disposition", 
						"Attachment;filename=\"" + 
						new String(boardAttach.getUserFileName().getBytes("utf-8"), "ISO-8859-1") + "\"");
				
				FileInputStream fis = new FileInputStream(path); 	//파일을 읽는 도구
				OutputStream fos = response.getOutputStream();			//브라우저에게 전송하는 도구
				
				while (true) {
					int data = fis.read();  //파일에서 1byte 읽기
					if (data == -1) { //더 이상 읽을 데이터가 없다면 (EOF)
						break;
					}
					fos.write(data); //응답 스트림에 1byte 쓰기
				}
				
				fis.close();
				fos.close();
		
	}

}
