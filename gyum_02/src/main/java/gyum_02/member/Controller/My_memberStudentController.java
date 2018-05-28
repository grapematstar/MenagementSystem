package gyum_02.member.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.DefaultNamingPolicy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;


import gyum_02.member.model.*;
import gyum_02.study.model.infoStudyDAO;
import gyum_02.study.model.infoStudyDTO;
import gyum_02.study.model.*;
@Controller
public class My_memberStudentController {

	@Autowired
	private My_memberStudentDAO My_memberDao1;
	@Autowired
	private My_memberParentDAO My_memberDao2;
	@Autowired
	private My_memberTeacherDAO My_memberDao3;

	@Autowired
	private infoStudyDAO infoSDao;
	
	@RequestMapping("/stu_information.do")
	public ModelAndView stu_infoForm(HttpSession session) {
		String ids = (String) session.getAttribute("id");
		int idxs = (Integer)session.getAttribute("idx");
		My_memberStudentDTO dto = My_memberDao1.getstuInfo(ids);
		List<My_memberStudentDTO> dto1 = My_memberDao1.stu_file(idxs);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("dto1",dto1);
		mav.setViewName("mypage/my_information/my_stu_info");
		return mav;
	}

	@RequestMapping("/my_member.do")
	public String memberForm() {
		return "mypage/my_member/my_memberJoin";
	}

	@RequestMapping("/login.do")
	public String loginForm() {
		return "mypage/my_member/my_memberLogin";
	}

	@RequestMapping("/my_memberstudent.do")
	public String studentWriteForm() {
		return "mypage/my_member/my_memberStudent";
	}

	@RequestMapping(value="/studentWrite.do",method=RequestMethod.POST)
	public ModelAndView studentWrite(My_memberStudentDTO dto, HttpSession request,@RequestParam("img_file")MultipartFile img_file)throws Exception {
		
		infoStudyDTO infoDTO = new infoStudyDTO();
		
		String stu_id = dto.getStu_id();
		ModelAndView mav = new ModelAndView();
		int result=0;
		int idCheck = My_memberDao2.idCheck(stu_id);
		if(!(stu_id==null||stu_id.equals(""))){
			if(idCheck==0){
				idCheck=My_memberDao3.idCheck(stu_id);
				if(idCheck==0) {
					idCheck=My_memberDao1.idCheck(stu_id);
					if(idCheck==0) {
						mav.addObject("stu_id", stu_id);
						result = My_memberDao1.studentWrite(dto);
						String msg = result>0?"회원가입 성공":"회원가입 실패";
						
						My_memberStudentDTO sdto=My_memberDao1.getstuInfo(stu_id);

						if(result>0){
							String img_folder = "C:\\uploads\\";
							File dir = new File(img_folder);
							if(!dir.isDirectory()){
								dir.mkdir();
							}
							String genID = "",originalfileName = "", saveFileName = "", savePath = "";
							genID = UUID.randomUUID().toString();
							originalfileName = img_file.getOriginalFilename();
							saveFileName = genID+"_%%_"+originalfileName;
							savePath = img_folder+saveFileName;
							img_file.transferTo(new File(savePath));
							Map<String,Object> filemap=new HashMap<String,Object>();
							filemap.put("file_route", savePath);
							filemap.put("file_name", originalfileName);
							int file_idx=My_memberDao1.studentImageFileWrite(filemap);
							result=My_memberDao1.studentImageFileIdxUpdate(sdto.getStu_idx(), file_idx);
						}
						
						if(result>0){
							infoDTO=new infoStudyDTO(sdto.getStu_idx(), stu_id, sdto.getStu_name(), 0, 0, 0, 0);
						}
						infoSDao.studyinfoadd(infoDTO);
						
						
						mav.setViewName("/mypage/my_member/my_memberMsg");
						mav.addObject("msg",msg);
						return mav;
					}
				}
			}		
			mav.setViewName("/mypage/my_member/my_joinMsg");
			mav.addObject("msg", "회원 가입 실패");
			mav.addObject("locationOrder", "my_memberstudent.do");
			return mav;
		}
		return mav;
	}

	@RequestMapping("/idCheck1.do")
	public ModelAndView idCheck2(My_memberStudentDTO dto){
		String stu_id = dto.getStu_id();
		ModelAndView mav = new ModelAndView();
		
		int idCheck = My_memberDao2.idCheck(stu_id);
		if(!(stu_id==null||stu_id.equals(""))){
			if(idCheck==0){
				idCheck=My_memberDao1.idCheck(stu_id);
				if(idCheck==0) {
					idCheck=My_memberDao3.idCheck(stu_id);
					if(idCheck==0) {
						mav.addObject("stu_id", stu_id);
						mav.addObject("msg", "사용 가능한 아이디입니다.");
						mav.setViewName("yongJson");
						return mav;
					}
				}
			}
			mav.addObject("stu_id", "");
			mav.addObject("msg", "이미 사용중인 아이디입니다.");
			mav.setViewName("yongJson");
			
		}
		return mav;
	}

	@RequestMapping(value="/stu_Update.do",method=RequestMethod.POST)
	public ModelAndView stu_Update(My_memberStudentDTO dto,HttpSession session,@RequestParam("img_file")MultipartFile img_file)throws Exception {
		int result = My_memberDao1.stu_Update(dto);
		String msg = result > 0 ? "회원 수정 성공" : "회원 수정 실패";
		String stu_id = (String)session.getAttribute("id");
		My_memberStudentDTO sdto=My_memberDao1.getstuInfo(stu_id);
		
		if(result>0){
			String img_folder = "C:\\uploads\\";
			File dir = new File(img_folder);
			if(!dir.isDirectory()){
				dir.mkdir();
			}
			String genID = "",originalfileName = "", saveFileName = "", savePath = "";
			genID = UUID.randomUUID().toString();
			originalfileName = img_file.getOriginalFilename();
			saveFileName = genID+"_%%_"+originalfileName;
			savePath = img_folder+saveFileName;
			img_file.transferTo(new File(savePath));
			Map<String,Object> filemap=new HashMap<String,Object>();
			filemap.put("file_route", savePath);
			filemap.put("file_name", originalfileName);
			int file_idx=My_memberDao1.studentImageFileWrite(filemap);
			result=My_memberDao1.studentImageFileIdxUpdate(sdto.getStu_idx(), file_idx);
		}
		
		ModelAndView mav = new ModelAndView("mypage/my_information/my_infoMsg", "msg", msg);
		return mav;
	}

	@RequestMapping("/stu_infoDel.do")
	public ModelAndView stu_infoDel(String id, HttpSession session) {
		String ids = (String) session.getAttribute("id");
		My_memberStudentDTO dto = My_memberDao1.stu_InfoDel(ids);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("mypage/my_information/my_stu_delete");
		return mav;
	}

	@RequestMapping("/stu_Delete.do")
	public ModelAndView stu_Delete(HttpServletRequest req,HttpSession session,String stu_pwd) {
		String stu_id = (String)session.getAttribute("id");
		int result = My_memberDao1.stu_Delete(stu_id,stu_pwd);
		String msg = result > 0 ? "회원 삭제 성공" : "회원 삭제 실패";
		ModelAndView mav = new ModelAndView("mypage/my_information/my_infoMsg", "msg", msg);
		session = req.getSession();
		session.removeAttribute("id");
		session.removeAttribute("idx");
		session.removeAttribute("name");
		session.removeAttribute("usergrade");
		return mav;
	}
}
