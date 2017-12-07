package com.nanum.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class FileUpload {
	
	public List<String> File_Upload (List<CommonsMultipartFile> files, HttpServletRequest request) throws IOException{
		
		List<String> filenames = new ArrayList<String>(); // 파일명만 추출
		for (CommonsMultipartFile multipartfile : files) {
			String fname = multipartfile.getOriginalFilename(); // 파일명 얻기
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			// String uploadedFileName = System.currentTimeMillis() + UUID.randomUUID().toString() + fname.substring(fname.lastIndexOf("."));
			String uploadedFileName = System.currentTimeMillis() + UUID.randomUUID().toString() + ".jpg";
			String fullpath = path + "\\" + uploadedFileName;
			if (!fname.equals("")) {
				// 서버에 파일 쓰기 작업
				FileOutputStream fs = new FileOutputStream(fullpath);
				fs.write(multipartfile.getBytes());
				fs.close();
			}
			filenames.add(uploadedFileName); // 실 DB Insert 작업시 .. 파일명
		}
		
		return filenames;
	}

}
