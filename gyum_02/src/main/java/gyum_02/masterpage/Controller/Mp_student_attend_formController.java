package gyum_02.masterpage.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.masterpage.model.*;

@Controller
public class Mp_student_attend_formController {

	@Autowired
	private ClassDAO classDao;
	@Autowired
	private StudentDAO studentDao;
	@Autowired
	private Class_studentDAO class_studentDao;
	@Autowired
	private AttendDAO attendDao;
	@Autowired
	private Attend_attendanceDAO attend_attendanceDao;
	
	@RequestMapping("/mp_student_attend.do")
	public ModelAndView mp_student_attend(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("masterpage/mp_member/mp_student_attend");
		return mav;
	}
	@RequestMapping("/mp_student_attend_list.do")
	public ModelAndView getsublist(int sub){				
		ModelAndView mav=new ModelAndView();
		List<ClassDTO> sublist= classDao.mp_c_select_with_sn(sub);		
		mav.addObject("sublist",sublist);
		mav.addObject("msg","불러오기 성공");
		mav.setViewName("yongJson");
		return mav;
	}
	@RequestMapping("/mp_student_attend_list_ok.do")
	public ModelAndView getresult(int sub, int class_idx, String stu_name){
		List<StudentDTO> slist=new ArrayList<StudentDTO>();
		//List<Attend_attendanceDTO> aalist=new ArrayList<Attend_attendanceDTO>();
		List<AttendDTO> alist=new ArrayList<AttendDTO>();	
		AttendDTO adto=new AttendDTO();
		ModelAndView mav=new ModelAndView();
		int check=0;
		if(stu_name==null||stu_name.equals("")){
			List<Class_studentDTO> cslist=class_studentDao.mp_cs_stu_idx(class_idx);
			List<A_tableDTO> last_result=new ArrayList<A_tableDTO>();
			for(int i=0;i<cslist.size();i++){	//여기서 2번.....아 배고파
				int stu_idx=cslist.get(i).getStu_idx();
				List<StudentDTO> sdto=studentDao.mp_student_info(stu_idx);
				String stu_name2=sdto.get(0).getStu_name(); //여기선 이름만 뺴올꺼.................
				List<ClassDTO> clist=classDao.mp_c_select(class_idx);
				String class_subject=clist.get(0).getClass_subject();
				adto.setClass_idx(class_idx);
				adto.setStu_idx(stu_idx);
				alist=attendDao.mp_attend_getinfo(adto);//출결 전체 상황
				for(int j=0;j<alist.size();j++){
					int attend_date=alist.get(j).getAttend_date();
					String  attend_note=alist.get(j).getAttend_note();
					int a_a_idx=alist.get(j).getA_a_idx();
					String a_a_attendance=attend_attendanceDao.mp_aa_aaa(a_a_idx); //........................
					A_tableDTO atabledto=new A_tableDTO(null, class_idx, stu_idx, stu_name2, attend_date, a_a_attendance, attend_note,class_subject);
					last_result.add(atabledto);
				}
			}
			if(last_result.size()==0){
				mav.addObject("check","검색된 수강생이 없습니다.");
			}
			mav.addObject("num",0);
			mav.addObject("last_result",last_result);
		}else{
			slist=studentDao.mp_student_info2(stu_name);
			//List<List<A_tableDTO>> last_result=new ArrayList<List<A_tableDTO>>(); 
			
			int num=0;
			for(int i=0;i<slist.size();i++){
				List<A_tableDTO> result=new ArrayList<A_tableDTO>();
				int stu_idx=slist.get(i).getStu_idx();
				List<Class_studentDTO> cslist=class_studentDao.mp_cs_select(stu_idx);
				if(cslist.size()>0){
					check++;
				}
				for(int j=0;j<cslist.size();j++){
					int class_idx2=cslist.get(j).getClass_idx();
					List<ClassDTO> clist=classDao.mp_c_select(class_idx2);
					String class_subject=clist.get(0).getClass_subject();
					adto.setClass_idx(class_idx2);
					adto.setStu_idx(stu_idx);
					alist=attendDao.mp_attend_getinfo(adto);//출결 전체 상황
					for(int k=0;k<alist.size();k++){
						int attend_date=alist.get(k).getAttend_date();
						String  attend_note=alist.get(k).getAttend_note();
						int a_a_idx=alist.get(k).getA_a_idx();
						String a_a_attendance=attend_attendanceDao.mp_aa_aaa(a_a_idx); //........................
						A_tableDTO atabledto=new A_tableDTO(null, class_idx2, stu_idx, stu_name, attend_date, a_a_attendance, attend_note,class_subject);
						result.add(atabledto);
					}
				}
				num++;
				mav.addObject("last_result"+i,result);
			}			
			mav.addObject("num",num);//끝은아닌데............ㅋㅋㅋㅋ	뭐가 빠졋냐면		
			if(check==0){		
				mav.addObject("check","검색된 수강생이 없습니다.");			
			}
		}		
		mav.addObject("msg","수강생 불러오기 성공");
		mav.setViewName("yongJson");
		return mav;
	}
}
