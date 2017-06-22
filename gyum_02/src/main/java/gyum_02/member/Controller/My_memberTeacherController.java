package gyum_02.member.Controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.member.model.*;
import gyum_02.mypage.model.*;

@Controller
public class My_memberTeacherController {
	
	@Autowired
	private My_memberStudentDAO My_memberDao1;
	@Autowired
	private My_memberParentDAO My_memberDao2;
	@Autowired
	private My_memberTeacherDAO My_memberDao3;
	@Autowired
	private My_ClassDAO My_Dao4;
	
	@RequestMapping("/my_memberteacher.do")
	public String teacherWriteForm(){
		return "mypage/my_member/my_memberTeacher";
	}
	
	@RequestMapping(value="/teacherWrite.do",method=RequestMethod.POST)
	public ModelAndView teacherWrite(
			@ModelAttribute("dto")My_memberTeacherDTO dto,
			@RequestParam MultipartFile img_file)throws Exception{
		String tea_id = dto.getTea_id();
		ModelAndView mav = new ModelAndView();
		int result = 0;
		int idCheck = My_memberDao2.idCheck(tea_id);
		if(!(tea_id==null||tea_id.equals(""))){
			if(idCheck==0){
				idCheck=My_memberDao1.idCheck(tea_id);
				if(idCheck==0) {
					idCheck=My_memberDao3.idCheck(tea_id);
					if(idCheck==0) {
						mav.addObject("tea_id", tea_id);
						result = My_memberDao3.teacherWrite(dto);
						String msg = result>0?"회원가입 성공":"회원가입  실패";
						
						int tea_idx = My_memberDao3.tea_idx(dto.getTea_id());
						System.out.println("tea_idx :"+tea_idx);
						
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
							int file_idx=My_memberDao3.teacherImageFileWrite(filemap);
							result=My_memberDao3.teacherImageFileIdxUpdate(tea_idx, file_idx);
						}
						mav.setViewName("/mypage/my_member/my_memberMsg");
						mav.addObject("msg",msg);
						return mav;
					}
				}
			}
			mav.setViewName("/mypage/my_member/my_joinMsg");
			mav.addObject("msg", "회원 가입 실패");
			mav.addObject("locationOrder", "my_memberteacher.do");
			return mav;
		}
		return mav;
	}
	
	@RequestMapping("/idCheck3.do")
	public ModelAndView idCheck2(My_memberTeacherDTO dto){
		String tea_id = dto.getTea_id();
		ModelAndView mav = new ModelAndView();
		
		int idCheck = My_memberDao2.idCheck(tea_id);
		if(!(tea_id==null||tea_id.equals(""))){
			if(idCheck==0){
				idCheck=My_memberDao1.idCheck(tea_id);
				if(idCheck==0) {
					idCheck=My_memberDao3.idCheck(tea_id);
					if(idCheck==0) {
						mav.addObject("tea_id", tea_id);
						mav.addObject("msg", "사용 가능한 아이디입니다.");
						mav.setViewName("yongJson");
						return mav;
					}
				}
			}
			mav.addObject("tea_id", "");
			mav.addObject("msg", "이미 사용중인 아이디입니다.");
			mav.setViewName("yongJson");
			
		}
		return mav;
	}
	
	@RequestMapping("/tea_information.do")
	public ModelAndView tea_infoForm(HttpSession session){
		String ids=(String)session.getAttribute("id");
		My_memberTeacherDTO dto = My_memberDao3.getteaInfo(ids);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("mypage/my_information/my_tea_info");
		return mav;
	}
	
	@RequestMapping(value="/tea_Update.do",method=RequestMethod.POST)
	public ModelAndView tea_Update(My_memberTeacherDTO dto,HttpSession session,@RequestParam("img_file")MultipartFile img_file)throws Exception {
		int result = My_memberDao3.tea_Update(dto);
		String msg = result>0?"회원 수정 성공":"회원 수정 실패";
		String tea_id = (String)session.getAttribute("id");
		My_memberTeacherDTO sdto=My_memberDao3.getteaInfo(tea_id);
		
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
			int file_idx=My_memberDao3.teacherImageFileWrite(filemap);
			result=My_memberDao3.teacherImageFileIdxUpdate(sdto.getTea_idx(), file_idx);
		}
		ModelAndView mav = new ModelAndView("mypage/my_information/my_infoMsg","msg",msg);
		return mav;
	}
	
	@RequestMapping("/tea_infoDel")
	public ModelAndView tea_infoDel(String id,HttpSession session){
		String ids=(String)session.getAttribute("id");
		My_memberTeacherDTO dto = My_memberDao3.tea_InfoDel(ids);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("mypage/my_information/my_tea_delete");
		return mav;
	}
	
	@RequestMapping("/tea_Delete.do")
	public ModelAndView tea_Delete(HttpServletRequest req,HttpSession session,String tea_pwd){
		String tea_id = (String)session.getAttribute("id");
		int result = My_memberDao3.tea_Delete(tea_id,tea_pwd);
		String msg = result>0?"회원 삭제 성공":"회원 삭제 실패";
		ModelAndView mav = new ModelAndView("mypage/my_information/my_infoMsg","msg",msg);
		session = req.getSession();
		session.removeAttribute("id");
		session.removeAttribute("idx");
		session.removeAttribute("name");
		session.removeAttribute("usergrade");
		return mav;
	}
}
