package gyum_02.mp_academyStatus.Controller;

import java.io.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gyum_02.commons.ControllerSurpport;
import gyum_02.paging.Paging_PageModule;
import gyum_02.mp_academyStatus.model.mp_TeacherDAO;
import gyum_02.mp_academyStatus.model.mp_TeacherDTO;

@Controller
//@RequestMapping("/masterpage/mp_academy_status")
public class mp_TeacherController {
	
//	mp_teacher_all_list.do
	
	@Autowired
	public mp_TeacherDAO dao;

	public ControllerSurpport cs = new ControllerSurpport();
	
	String folderName = "masterpage/mp_academy_status/";
	
	@RequestMapping(value="/mp_teacher.do", method=RequestMethod.GET)
	public String mp_Teacher(){
		return folderName+"mp_teacher";
	}

	@RequestMapping(value = "/mp_teacher_all_list.do", method = RequestMethod.GET)
	public ResponseEntity<String> mp_teacherAllList(@RequestParam(value = "cp", defaultValue = "1") int cp,
			HttpServletRequest req) {
		int listSize = 3;
		int pageSize = 5;
		int totalCnt = dao.mpTeacherTotalCnt();
		totalCnt = totalCnt == 0 ? 1 : totalCnt;

		HashMap<String, Integer> pageMap = new HashMap<String, Integer>();
		pageMap.put("cp", cp);
		pageMap.put("listSize", listSize);
		List<mp_TeacherDTO> list = dao.mpTeacherAllList(cp, listSize);
		List<File> flist = new ArrayList<File>();

		String page = Paging_PageModule.mp_pageMakeAcademy("showAll(", totalCnt, listSize, pageSize, cp);
		HashMap map = new HashMap();

		for(int i=0; i<list.size(); i++){
			if(list.get(i).getFile_route()!=null && list.get(i).getFile_route()!=""){
				File infile = new File(list.get(i).getFile_route());
				System.out.println(list.get(i).getFile_route());
				File newFile = new File("uploads/temp.png");
				FileInputStream fis;
				try {
					fis = new FileInputStream(list.get(i).getFile_route());
					FileOutputStream fos;

					fos = new FileOutputStream("D:/kh/finalProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/gyum_02/uploads/"+list.get(i).getFile_name());

					int data = 0;
					while ((data = fis.read()) != -1) {
						fos.write(data);
					}
					fis.close();
					fos.close();
					infile.renameTo(newFile);

					newFile.createNewFile();

				} catch (FileNotFoundException e1) {
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		map.put("page", page);
		map.put("list", list);
		
		return cs.getJsonResponse(map);
	}

}
