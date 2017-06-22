package gyum_02.study.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.masterpage.model.StudentDAO;
import gyum_02.study.model.createStudyDAO;
import gyum_02.study.model.createStudyDTO;
import gyum_02.study.model.infoStudyDAO;
import gyum_02.study.model.infoStudyDTO;
import gyum_02.study.model.inqStudyDAO;
import gyum_02.study.model.inqStudyDTO;
import gyum_02.study.model.recruitStudyDAO;
import gyum_02.study.model.recruitStudyDTO;
import gyum_02.study.model.reqStudyDAO;
import gyum_02.study.model.reqStudyDTO;

@Controller
public class studyRecruitController {

   @Autowired
   private createStudyDAO createStudyDao;

   @Autowired
   private recruitStudyDAO rsDao;
   
   @Autowired
   private inqStudyDAO inqDao;
   @Autowired
   private infoStudyDAO infoSDao;
   @Autowired
   private reqStudyDAO reqDao;
   
   @Autowired
   private StudentDAO studentDao;
   
   @RequestMapping("/studyRecruitgo.do")
   public ModelAndView studyRecruitgo(){
      ModelAndView mav=new ModelAndView();   
      mav.setViewName("study/study_ recruit");            
      return mav;      
   }
   
   @RequestMapping("/study_recruitadd.do")
   public ModelAndView study_recruitadd(recruitStudyDTO dto,HttpSession session){
      String usergrade=(String)session.getAttribute("usergrade");      
      ModelAndView mav=new ModelAndView();
       if(usergrade.equals("student")){
         System.out.println(dto.getStudy_recruit_content());
         int stu_idx=(Integer)session.getAttribute("idx");
         String stu_id=(String)session.getAttribute("id");
         dto.setStu_id(stu_id);
         dto.setStu_idx(stu_idx);   
         rsDao.study_recruit_insert(dto);
         int recruitidx=rsDao.getstudy_recruitidx(dto);
         reqStudyDTO reqdto=new reqStudyDTO(recruitidx, stu_idx, 1,null);
         reqDao.study_req_add(reqdto);
      }else{
         mav.addObject("msg","You are not a student");
      }
      mav.setViewName("yongJson");            
      return mav;      
   }
   
   @RequestMapping("/study_recruitList.do")
   public ModelAndView study_recruitList(@RequestParam(value="cp",defaultValue="1")int cp){      
      int total=rsDao.get_study_recruit_total();
      int ls=15;
      int ps=10;

      ModelAndView mav=new ModelAndView();
      List<recruitStudyDTO> list=rsDao.study_recruit_list(cp,ls);
      String page=study_paging.pageMake("study_recruitlist", total, ls, ps, cp);   
      mav.addObject("page",page);
      mav.addObject("list",list);
      mav.setViewName("yongJson");            
      return mav;
   }
   
   @RequestMapping("/study_recruit_inq.do")
   public ModelAndView study_recruit_inq(inqStudyDTO idto,HttpSession session){
      ModelAndView mav=new ModelAndView();      
      String stu_id=(String)session.getAttribute("id");      
      idto.setStu_id(stu_id);
      System.out.println(idto.getStudy_recruitidx());
      int count=inqDao.study_recruit_inq_send(idto);
      if(count<1){
         mav.addObject("msg","Fail");
      }
      mav.setViewName("yongJson");            
      return mav;
   }
   
   @RequestMapping("/study_inq_recivlistgo.do")
   public ModelAndView study_inq_recivlistgo(){
      ModelAndView mav=new ModelAndView();
      mav.setViewName("study/mypage/study_inq_reciver");
      return mav;
   }
   
   @RequestMapping("/study_inq_recivlist.do")
   public ModelAndView study_inq_recivlist(HttpSession session){
      ModelAndView mav=new ModelAndView();
      String stu_id=(String)session.getAttribute("id");
      List<inqStudyDTO> inqlist=inqDao.study_reciv_list(stu_id);
      
      List<Map<String , Object>> listmap=new ArrayList<Map<String,Object>>();
      List<createStudyDTO> cdto=new ArrayList<createStudyDTO>();
      List<recruitStudyDTO> rcdto=new ArrayList<recruitStudyDTO>();
      int check=0;
      for(int i=0;i<inqlist.size();i++){
         String sub="";
         String direc="";
         Map<String , Object> map=new HashMap<String , Object>();
         if(inqlist.get(i).getStudy_recruitidx()==0){
            cdto=createStudyDao.getstudyinfo(inqlist.get(i).getStudy_idx());
            if(cdto.size()>0){
               sub=cdto.get(0).getStudy_subject();
               direc=cdto.get(0).getStudy_directory();
               map.put("situ","스터디");
               map.put("idx", inqlist.get(i).getStudy_idx());
               check++;
            }
         }else{
            rcdto=rsDao.getstudy_recruit(inqlist.get(i).getStudy_recruitidx());
            if(rcdto.size()>0){
               sub=rcdto.get(0).getStudy_recruit_subject();
               direc=rcdto.get(0).getStudy_recruit_directory();
               map.put("idx", inqlist.get(i).getStudy_recruitidx());
               map.put("situ","모집");
               check++;
            }
         }
         if(check>0){
            map.put("directory",direc);
            map.put("study_sub", sub);
            map.put("sender",inqlist.get(i).getStudy_inq_sender());
            listmap.add(map);
            check=0;
         }
      }      
      mav.addObject("inqlist",listmap);
      
      mav.setViewName("yongJson");
      return mav;
   }
   @RequestMapping("/inq_con_go.do")
   public ModelAndView inq_con_go(String situ,int idx,String sender,HttpSession session){      
      ModelAndView mav=new ModelAndView();
      String id=(String)session.getAttribute("id");
      inqStudyDTO inqdto=new inqStudyDTO();
      inqdto.setStudy_inq_reciver(id);
      inqdto.setStudy_inq_sender(sender);
      if(situ.equals("모집")){
         inqdto.setStudy_recruitidx(idx);
         inqdto.setStudy_idx(0);         
      }else if(situ.equals("스터디")){
         inqdto.setStudy_idx(idx);
         inqdto.setStudy_recruitidx(0);         
      }      
      mav.addObject("inqdto",inqdto);
      mav.setViewName("study/mypage/study_inq_reciver_con");
      return mav;      
   }
   @RequestMapping("/inq_con.do")
   public ModelAndView inq_con(inqStudyDTO inqdto,HttpSession session){      
      ModelAndView mav=new ModelAndView();      
      List<inqStudyDTO> inqlist=inqDao.study_inq_list(inqdto);
      String id=(String)session.getAttribute("id");
      for(int i=0;i<inqlist.size();i++){
         if(!(inqlist.get(i).getStu_id().equals(id))){
            inqdto.setStudy_inqidx(inqlist.get(i).getStudy_inqidx());
            inqDao.update_study_readcheck(inqdto);
         }
      }
      infoStudyDTO infodto=new infoStudyDTO();
      if(id.equals(inqdto.getStudy_inq_reciver())){
         infodto=infoSDao.getstudymem_info(inqdto.getStudy_inq_sender());
      }else{
         infodto=infoSDao.getstudymem_info(inqdto.getStudy_inq_reciver());
      }
      mav.addObject("infodto",infodto);
      mav.addObject("inqlist",inqlist);
      mav.setViewName("yongJson");
      return mav;      
   }
   
   @RequestMapping("/inq_answer.do")
   public ModelAndView inq_answer(inqStudyDTO inqdto,HttpSession session){
      ModelAndView mav=new ModelAndView();      
      String id=(String)session.getAttribute("id");
      inqdto.setStu_id(id);
      inqDao.study_recruit_inq_send(inqdto);
      mav.setViewName("yongJson");
      return mav;      
   }

   @RequestMapping("/study_inq_sendlistgo.do")
   public ModelAndView study_inq_sendlistgo(){
      ModelAndView mav=new ModelAndView();
      mav.setViewName("study/mypage/study_inq_sender");
      return mav;
   }
   
   @RequestMapping("/study_inq_sendlist.do")
   public ModelAndView study_inq_sendlist(HttpSession session){
      ModelAndView mav=new ModelAndView();
      String stu_id=(String)session.getAttribute("id");
      List<inqStudyDTO> inqlist=inqDao.study_send_list(stu_id);
      
      List<Map<String , Object>> listmap=new ArrayList<Map<String,Object>>();
      List<createStudyDTO> cdto=new ArrayList<createStudyDTO>();
      List<recruitStudyDTO> rcdto=new ArrayList<recruitStudyDTO>();
      int check=0;
      for(int i=0;i<inqlist.size();i++){
         String sub="";
         String direc="";
         Map<String , Object> map=new HashMap<String , Object>();
         if(inqlist.get(i).getStudy_recruitidx()<0){
            cdto=createStudyDao.getstudyinfo(inqlist.get(i).getStudy_idx());
            if(cdto.size()>0){
            sub=cdto.get(0).getStudy_subject();            
            direc=cdto.get(0).getStudy_directory();
            map.put("situ","스터디");
            map.put("idx", inqlist.get(i).getStudy_idx());
            check++;
            }
         }else{
            rcdto=rsDao.getstudy_recruit(inqlist.get(i).getStudy_recruitidx());
            if(rcdto.size()>0){
            sub=rcdto.get(0).getStudy_recruit_subject();
            direc=rcdto.get(0).getStudy_recruit_directory();
            map.put("idx", inqlist.get(i).getStudy_recruitidx());
            map.put("situ","모집");
            check++;
            }
         }
         if(check>0){
         map.put("directory",direc);
         map.put("study_sub", sub);
         map.put("reciver",inqlist.get(i).getStudy_inq_reciver());
         listmap.add(map);
         check=0;
         }
      }      
      mav.addObject("inqlist",listmap);
      
      mav.setViewName("yongJson");
      return mav;
   }
   @RequestMapping("/inq_con_send_go.do")
   public ModelAndView inq_con_send_go(String situ,int idx,String reciver,HttpSession session){
      System.out.println(situ);
      ModelAndView mav=new ModelAndView();
      String id=(String)session.getAttribute("id");
      inqStudyDTO inqdto=new inqStudyDTO();
      inqdto.setStudy_inq_sender(id);
      inqdto.setStudy_inq_reciver(reciver);
      if(situ.equals("모집")){
         inqdto.setStudy_recruitidx(idx);
         inqdto.setStudy_idx(0);         
      }else if(situ.equals("스터디")){
         inqdto.setStudy_idx(idx);
         inqdto.setStudy_recruitidx(0);         
      }      
      mav.addObject("inqdto",inqdto);
      mav.setViewName("study/mypage/study_inq_sender_con");
      return mav;      
   }
   
   @RequestMapping("/goSearching_recruit.do")
      public ModelAndView goSearching_recruit(@RequestParam(value="cp",defaultValue="1")int cp,String title,String theme){
         ModelAndView mav=new ModelAndView();
         int total=0;
         if(title==null||title.equals("")){
            total=rsDao.get_studyRecruit_total_theme(theme);
         }else{
            total=rsDao.get_studyRecruit_total_title(title);
         }
         int ls=15;
          int ps=10;
          List<recruitStudyDTO> list = new ArrayList<recruitStudyDTO>();
          if(title.equals(null) || title.equals("")){
            list = rsDao.studyRecruitlist_theme(cp, ls,theme);
         }else{
            list = rsDao.studyRecruitlist_title(cp, ls,title);
         }
          String page=study_paging.pageMake("goSearching", total, ls, ps, cp);
         mav.addObject("page",page);
         mav.addObject("list",list);
         mav.setViewName("yongJson");      
         return mav;
      }
   
   @RequestMapping("/study_recruit_del.do")
   public ModelAndView study_recruit_del(HttpSession session, int study_recruitidx){
      ModelAndView mav = new ModelAndView();
      int stu_idx = (Integer)session.getAttribute("idx");
      rsDao.study_recruit_del(stu_idx,study_recruitidx);
      reqDao.study_req_del(stu_idx,study_recruitidx);
      mav.setViewName("yongJson");
      return mav;
   }
   @RequestMapping("/study_recruit_close.do")
   public ModelAndView study_recruit_close(HttpSession session, int study_recruitidx){
      ModelAndView mav = new ModelAndView();
      int stu_idx = (Integer)session.getAttribute("idx");
      rsDao.study_recruit_close(stu_idx,study_recruitidx);
      mav.setViewName("yongJson");
      return mav;
   }
   @RequestMapping("/recruit_accept.do")
   public ModelAndView recruit_accept(String stu_id, int study_recruitidx){
      ModelAndView mav = new ModelAndView();
      int stu_idx = studentDao.mp_student_get_idx(stu_id);
      reqDao.study_recruit_accept(stu_idx,study_recruitidx);
      mav.setViewName("yongJson");
      return mav;
   }
   @RequestMapping("/recruit_cancle.do")
   public ModelAndView recruit_cancle(String stu_id, int study_recruitidx){
      ModelAndView mav = new ModelAndView();
      int stu_idx = studentDao.mp_student_get_idx(stu_id);
      reqDao.study_recruit_cancle(stu_idx,study_recruitidx);
      mav.setViewName("yongJson");
      return mav;
   }
   

}
























