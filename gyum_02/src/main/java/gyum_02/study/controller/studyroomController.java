package gyum_02.study.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.study.model.studyroomDAO;
import gyum_02.study.model.studyroomDTO;
import oracle.sql.StructDescriptor;
@Controller
public class studyroomController {
	@Autowired
	private studyroomDAO srDao;
	
	@RequestMapping("/study_room_reservgo.do")
	public String study_room_reservgo(){		
		return "study/studyroom/studyroom_reserv";
	}
	@RequestMapping("/studyroom_reserv_list.do")
	public ModelAndView studyroom_reserv_list(int studyroom_reserv_date){
		System.out.println(studyroom_reserv_date);
		ModelAndView mav=new ModelAndView();	
		List<studyroomDTO>  list=new ArrayList<studyroomDTO>();
		try {
			list=srDao.studyroom_list(studyroom_reserv_date);
		} catch (Exception e) {
		 
		}
		mav.addObject("list",list);
		mav.setViewName("yongJson");
		return mav;
	}
	@RequestMapping("/studyroom_reserv.do")
	public ModelAndView studyroom_reserv(studyroomDTO dto,HttpSession session){		
		System.out.println("왜 안들어 오는데?");
		ModelAndView mav=new ModelAndView();
		String id=(String)session.getAttribute("id");
		if(id==null||id.equals("")){			
			mav.addObject("msg","로그인이 필요 합니다..");
		}else{			
			
			int usetime=dto.getStudyroom_usetime();
			int reserv_hour=dto.getStudyroom_reserv_hour();
			System.out.println("예약을 합시다"+id+"//"+usetime+"//"+reserv_hour);
			for(int i=0;i<usetime;i++){
				dto.setStudyroom_reserv_hour(reserv_hour+i);
				List<studyroomDTO> srdto=srDao.get_studyroom_reserv(dto);								
				if(srdto.size()>0){
					System.out.println(srdto.get(0).getStudyroom_id()+"////"+id);
					mav.addObject("msg","이미 에약되어 있습니다.");
					mav.setViewName("yongJson");
					return mav;										
				}
			}
			dto.setStudyroom_id(id);			
			for(int i=0;i<usetime;i++){
				dto.setStudyroom_reserv_hour(reserv_hour+i);
				int result=srDao.studyroom_reserv(dto);
			}
			for(int i=0;i<usetime;i++){
				dto.setStudyroom_reserv_hour(reserv_hour+i);
				List<studyroomDTO> srdto=srDao.get_studyroom_reserv(dto);								
				if(srdto.size()>1){
					System.out.println(srdto.get(0).getStudyroom_id()+"////"+id);
					if(!(srdto.get(0).getStudyroom_id().equals(id))){
						mav.addObject("msg","이미 에약되어 있습니다.");
						System.out.println("이미 예약 되어 있다.");
						for(int j=0;j<usetime;j++){
							dto.setStudyroom_reserv_hour(reserv_hour+i);
							int count=srDao.studyroom_reserv_cencel(dto);
						}
						break;
					}
				}
			}			
		}
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/study_room_reserv_listgo.do")
	public String study_room_reserv_listgo(){
		return "study/mypage/studyroom_reservlist";				
	}
	@RequestMapping("/study_room_reserv_list.do")
	public ModelAndView study_room_reserv_list(HttpSession session){
		ModelAndView mav=new ModelAndView();
		String id=(String)session.getAttribute("id");		
		List<studyroomDTO> list=srDao.getstudyroom_list(id);	
		mav.addObject("list",list);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/studyroom_reserv_cancel.do")
	public ModelAndView studyroom_reserv_cancel(int studyroom_idx){
		ModelAndView mav=new ModelAndView();
		int count=srDao.studyroom_reserv_cencel2(studyroom_idx);
		if(count>0){
			mav.addObject("msg","占쏙옙占� 占실억옙占쏙옙占싹댐옙.");
		}
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/getStudyroomList.do")
	public ModelAndView getStudyroomList(@RequestParam(value="cp",defaultValue="1")int cp){
		ModelAndView mav=new ModelAndView();
		int total = srDao.studyroom_totalCnt();
		int ls=10;
		int ps=5;
		List<studyroomDTO> allList = srDao.studyroom_paging_all(cp, ls);
		String page=study_paging.pageMake("getStudyroomList", total, ls, ps, cp);
		mav.addObject("page",page);
		mav.addObject("allList",allList);
		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/garbage.do")
	public ModelAndView garbage(int studyroom_idx){
		ModelAndView mav = new ModelAndView();
		int result = srDao.studyroom_garbage(studyroom_idx);
		if(result>0) mav.addObject("msg","삭제 성공");
		mav.setViewName("yongJson");
		return mav;
	}
	@RequestMapping("/srIDsearch.do")
	public ModelAndView srIDsearch(@RequestParam(value="cp",defaultValue="1")int cp, String studyroom_id){
		ModelAndView mav = new ModelAndView();
		int total = srDao.studyroom_totalCnt_withId(studyroom_id);
		int ls=10;
		int ps=5;
		List<studyroomDTO> IdList = srDao.studyroom_paging_search(cp,ls,studyroom_id);
		mav.addObject("IdList",IdList);
		String page=study_paging.pageMake("srIDsearch", total, ls, ps, cp);
		mav.addObject("page",page);
		mav.setViewName("yongJson");
		return mav;
	}
	
	
}
