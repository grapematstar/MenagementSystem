package gyum_02.study.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.study.model.bbsnameStudyDAO;
import gyum_02.study.model.bbsnameStudyDTO;
import gyum_02.study.model.createStudyDAO;
import gyum_02.study.model.createStudyDTO;
import gyum_02.study.model.infoStudyDAO;
import gyum_02.study.model.infoStudyDTO;
import gyum_02.study.model.infoStudyListDTO;
import gyum_02.study.model.leaderStudyDAO;
import gyum_02.study.model.leaderStudyDTO;
import gyum_02.study.model.memberStudyDAO;
import gyum_02.study.model.memberStudyDTO;
import jdk.nashorn.internal.ir.annotations.Reference;

@Controller
public class studysetupController {
	

	@Autowired
	private createStudyDAO createStudyDao;
	
	@Autowired
	private memberStudyDAO memberSDao;
	
	@Autowired
	private bbsnameStudyDAO bbsnameSDao;
	
	@Autowired
	private leaderStudyDAO leaderSDao;
	
	@Autowired
	private infoStudyDAO infoSDao;
	
	
	
	@RequestMapping("/study_setup_go.do")
	public ModelAndView study_setup_go(HttpSession session){
		int study_idx=(Integer)session.getAttribute("study_idx");		
		List<createStudyDTO> createSlist =createStudyDao.getstudyinfo(study_idx);		
		List<memberStudyDTO> memberSlist=memberSDao.getstudymemberinfo(study_idx);
		List<leaderStudyDTO> leaderSlist=leaderSDao.getstudyleaderinfo(study_idx);
		List<bbsnameStudyDTO> bbsnameSlist=bbsnameSDao.bbsnamelist(session);	
		ModelAndView mav=new ModelAndView();
		int nownum=memberSDao.membercount(study_idx);
		
		mav.addObject("nownum",nownum);
		mav.addObject("createSlist",createSlist.get(0));
		mav.addObject("memberSlist",memberSlist);
		mav.addObject("leaderSlist",leaderSlist.get(0));
		mav.addObject("bbsnameSlist",bbsnameSlist);
		mav.setViewName("study/study_setup");		
		return mav;
	}
	
	
	@RequestMapping("/study_memberchange.do")
	public ModelAndView study_memberchangego(HttpSession session){
		
		int study_idx=(Integer)session.getAttribute("study_idx");
		
		List<memberStudyDTO> studymem_list=memberSDao.getstudymemberinfo(study_idx);
		
		List<infoStudyDTO> infolistdto=new ArrayList<infoStudyDTO>();		
		List<leaderStudyDTO> ldto=ldto=leaderSDao.getstudyleaderinfo(study_idx);
		
		for(int i=0;i<studymem_list.size();i++){
				int stu_idx=studymem_list.get(i).getStu_idx();						
				List<infoStudyDTO> studyinfo=infoSDao.getstudyinfo(stu_idx);				
				infolistdto.add(studyinfo.get(0));			
		}
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("infolistdto",infolistdto);
		mav.addObject("ldto",ldto.get(0));
		mav.setViewName("yongJson");
		return mav;
	}

	
	@RequestMapping("/study_memberchangego.do")
	public String study_memberchangego(){
		return "study/study_memberchange";
	}
	
	
	@RequestMapping("/studybbsnamedel.do")
	public ModelAndView studybbsnamedel(bbsnameStudyDTO dto,HttpSession session){
		dto.setStudy_idx((Integer)session.getAttribute("study_idx"));
		int count=bbsnameSDao.bbsnamedel(dto);
		ModelAndView mav=new ModelAndView();	
		if(count>0){mav.addObject("msg","삭제완료");}
		mav.setViewName("yongJson");		
		return mav;
		
	}
	
	@RequestMapping("/study_memdel.do")
	public ModelAndView studymemdel(String stu_id,HttpSession session){
		int study_idx=(Integer)session.getAttribute("study_idx");
		
		memberStudyDTO memdto=new memberStudyDTO(study_idx,0, stu_id,"-");
		int count=memberSDao.study_memberdel(memdto);
		int count2=infoSDao.study_memdeport(stu_id);
		ModelAndView mav=new ModelAndView();
		 
		mav.setViewName("yongJson");		
		return mav;
	}
	
	@RequestMapping("/study_memsearch.do")
	public ModelAndView study_memsearch(String stu_id){
	
		ModelAndView mav=new ModelAndView();
		infoStudyDTO infoDTO=infoSDao.getstudymem_info(stu_id);
		if(infoDTO.getStu_idx()==0){
			mav.addObject("msg","아이디가 없거나 수강생이 아닙니다.");
		}else{
			mav.addObject("stu_info", infoDTO);
		}
		mav.setViewName("yongJson");		
		return mav;
		
	}
	@RequestMapping("/study_memadd.do")
	public ModelAndView study_memadd(String stu_id,HttpSession session){
		ModelAndView mav=new ModelAndView();
		int study_idx=(Integer)session.getAttribute("study_idx");
		
		int result=memberSDao.study_membercheck(stu_id,study_idx);
		if(result>0){
			mav.addObject("msg","이미 멤버 입니다.");
		}else{			
			int maxnum=createStudyDao.getmaxmember(study_idx);
			int count=memberSDao.membercount(study_idx);
			 if(maxnum==count){
				 mav.addObject("msg","정원이 다 찼습니다.");	
			 }else{
				int memadd=memberSDao.study_memadd(stu_id,study_idx);
				int infoupdate=infoSDao.study_infoupdate(stu_id);
				System.out.println(memadd+"//"+infoupdate);
			 }
		}
		
		mav.setViewName("yongJson");		
		return mav;
	}
	
	@RequestMapping("/study_leaderchange.do")
	public ModelAndView study_leaderchange(int check,String change_mem,HttpSession session){		
		ModelAndView mav=new ModelAndView();
		int study_idx=(Integer)session.getAttribute("study_idx");
		leaderStudyDTO lstdto=new leaderStudyDTO();
		if(check==1){
			lstdto=new leaderStudyDTO(study_idx, change_mem, null);
			leaderSDao.study_leaderchange(lstdto);
		}else{
			lstdto=new leaderStudyDTO(study_idx, null, change_mem);
			leaderSDao.study_seconchange(lstdto);
		}
		mav.setViewName("yongJson");		
		return mav;
	}
}
