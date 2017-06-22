package gyum_02.mypage.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.member.model.My_memberParentDAO;
import gyum_02.member.model.My_memberStudentDAO;
import gyum_02.member.model.My_memberStudentDTO;
import gyum_02.member.model.My_memberTeacherDAO;
import gyum_02.member.model.My_memberTeacherDTO;
import gyum_02.mypage.model.*;

@Controller
public class My_classController {

   @Autowired
   private My_memberStudentDAO My_memberDao1;
   @Autowired
   private My_memberParentDAO My_memberDao2;
   @Autowired
   private My_memberTeacherDAO My_memberDao3;
   @Autowired
   private My_ClassDAO My_classDao;
   @Autowired
   private My_ClassCheckDAO My_checkDao;
   @Autowired
   private My_ClassTestDAO My_classTestDao;

   
   @RequestMapping("/open_lectureForm.do")
   public ModelAndView tea_open_WriteForm(HttpSession session){
      int sidx = (Integer)session.getAttribute("idx");
      ModelAndView mav = new ModelAndView();
      mav.addObject("idx",sidx);
      mav.setViewName("mypage/my_teacher/my_class_write");      
      return mav;
   }
   
   @RequestMapping("/open_lecture.do")
   public ModelAndView class_Write(My_ClassDTO dto,HttpSession session,My_ClassCheckDTO cdto){
      int result = My_classDao.class_Open(dto);
      String msg = result>0?"강의 개설 성공":"강의 개설 실패";
      session.setAttribute("class_idx", dto.getClass_idx());
      System.out.println("class_idx"+dto.getClass_idx());
      int class_idx = My_classDao.class_idxCheck();
      int class_checkWrite = My_checkDao.class_checkWrite(class_idx);
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("mypage/my_teacher/my_classMsg");
      return mav;
   }
   
   @RequestMapping("/class_check.do")
   public ModelAndView class_CheckMain(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
      int idxs = (Integer)session.getAttribute("idx");
      int c_totalCnt = My_checkDao.c_ck_TotalCnt(idxs);
      int nc_totalCnt = My_checkDao.nc_ck_TotalCnt(idxs);
      
      c_totalCnt = c_totalCnt == 0? 1 :c_totalCnt;
      nc_totalCnt = nc_totalCnt == 0? 1 :nc_totalCnt;
      int listSize = 5;
      int pageSize = 5;
      
      List<My_ClassDTO> c_list = My_checkDao.c_class_CheckList(cp, listSize,idxs);   
      String c_pageStr = gyum_02.paging.Paging_PageModule.pageMake("class_check.do", c_totalCnt, listSize, pageSize, cp);
      List<My_ClassDTO> nc_list = My_checkDao.nc_class_CheckList(cp, listSize,idxs);   
      String nc_pageStr = gyum_02.paging.Paging_PageModule.pageMake("class_check.do", nc_totalCnt, listSize, pageSize, cp);
   
      ModelAndView mav = new ModelAndView();
      mav.addObject("c_pageStr",c_pageStr);
      mav.addObject("c_list",c_list);
      mav.addObject("nc_pageStr",nc_pageStr);
      mav.addObject("nc_list",nc_list);
      mav.setViewName("mypage/my_teacher/my_class_check");
      return mav;
   }
   
   @RequestMapping("/class_content.do")
   public ModelAndView class_content(int class_idx){
      ModelAndView mav = new ModelAndView();
      My_ClassDTO dto = My_classDao.class_Content(class_idx);
      System.out.println(dto.getClass_idx());
      mav.addObject("dto",dto);
      mav.setViewName("mypage/my_teacher/my_class_content");
      return mav;
   }
   
   @RequestMapping("/class_Update.do")
   public ModelAndView stu_Update(My_ClassDTO dto,int class_idx){
      int result = My_classDao.class_Update(dto,class_idx);
      String msg = result>0?"강의 수정 성공":"강의 수정 실패";
      ModelAndView mav = new ModelAndView("mypage/my_teacher/my_classMsg","msg",msg);
      return mav;
   }
   
   @RequestMapping("/class_test_Write.do")
   public ModelAndView class_test_Write(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
      int idxs = (Integer)session.getAttribute("idx");
      int c_totalCnt = My_checkDao.c_ck_TotalCnt(idxs);
      int workbook_totalCnt = My_classTestDao.workbook_TotalCnt(idxs);
      List<My_ClassTestDTO> question_totalCnt = My_classTestDao.class_workbook_Sel(idxs);
      c_totalCnt = c_totalCnt == 0? 1 :c_totalCnt;
      workbook_totalCnt = workbook_totalCnt == 0? 1 :workbook_totalCnt;
      int listSize = 5;
      int pageSize = 5;
      List<My_ClassDTO> c_list = My_checkDao.c_class_CheckList(cp, listSize,idxs);   
      String c_pageStr = gyum_02.paging.Paging_PageModule.pageMake("class_test_Write.do", c_totalCnt, listSize, pageSize, cp);
      List<My_ClassTestDTO> wb_list = My_classTestDao.class_Workbook_List(cp, listSize, idxs);
      String wb_pageStr = gyum_02.paging.Paging_PageModule.pageMake("class_test_Write.do", workbook_totalCnt, listSize, pageSize, cp);
      System.out.println("wb_list : "+wb_list.size());
      int[] workbook_Question_count = new int[wb_list.size()];
      for(int i=0;i<wb_list.size();i++){         
         workbook_Question_count[i] = My_classTestDao.workbook_Question_Count(wb_list.get(i).getTest_idx(),wb_list.get(i).getC_t_testnum());
         System.out.println(workbook_Question_count[i]);
      }
      ModelAndView mav = new ModelAndView();
      mav.addObject("question_count",workbook_Question_count);
      mav.addObject("c_pageStr",c_pageStr);
      mav.addObject("c_list",c_list);
      mav.addObject("wb_pageStr",wb_pageStr);
      mav.addObject("wb_list",wb_list);
      mav.setViewName("mypage/my_teacher/my_class_test_write");
      return mav;
   }
   
   @RequestMapping("/class_question_list.do")
   public ModelAndView class_Question_List(
         @RequestParam(value="cp",defaultValue="1")int cp,
         HttpSession session,
         int test_idx,
         int c_t_testnum,
         int class_idx){
      int idxs = (Integer)session.getAttribute("idx");
      List<My_ClassTestDTO> question_totalCnt = My_classTestDao.class_workbook_Sel(idxs);
      HashMap qs_map = new HashMap();
      System.out.println("test_idx : "+test_idx);
      qs_map.put("test_idx",test_idx);
      qs_map.put("c_t_testnum",c_t_testnum);
      qs_map.put("class_idx",class_idx);
      
      int qs_totalCnt = My_classTestDao.workbook_Question_TotalCnt(test_idx,c_t_testnum,class_idx);
      qs_totalCnt = qs_totalCnt == 0? 1 : qs_totalCnt;
      int listSize = 5;
      int pageSize = 5;
      
      List<My_ClassTestDTO> qs_list = My_classTestDao.workbook_Question_List(qs_map, cp, listSize);
      qs_map.remove("startnum");
      qs_map.remove("endnum");
      List<String> checkList=new ArrayList<String>();
      checkList.add("test_idx");
      checkList.add("c_t_testnum");
      checkList.add("class_idx");      
      String qs_pageStr = gyum_02.mypage.model.My_SearchPaging.searchPagingMapAjax("questionListPaging", qs_totalCnt, listSize, pageSize, cp, checkList,qs_map);
      ModelAndView mav = new ModelAndView();
      mav.addObject("qs_list",qs_list);
      mav.addObject("qs_pageStr",qs_pageStr);
      mav.setViewName("mypage/my_teacher/my_class_question_list");
      return mav;
   }
   @RequestMapping("class_workbookForm.do")
   public String class_workbookFrom(){
      return "mypage/my_teacher/my_class_workbook_write";
   }
   
   @RequestMapping("class_workbook_write.do")
   public ModelAndView class_workbook_write(My_ClassTestDTO dto){
      int result = My_classTestDao.class_Workbook_Write(dto);
      String msg = result>0?"시험 작성 성공":"시험 작성 실패";
      
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("mypage/my_teacher/my_class_testMsg");
      return mav;
   }
   
   @RequestMapping("class_testWriteForm.do")
   public String class_questionWriteForm(){
      return "mypage/my_teacher/my_class_question_write";
   }
   
   @RequestMapping(value="class_question_Write.do",method=RequestMethod.GET)
   public ModelAndView class_Question_Write(
      @ModelAttribute("dto")My_ClassTestDTO dto,
      @RequestParam(value="c_question_Option_num[]",defaultValue="")List<Integer> c_question_Option_num,
      @RequestParam(value="c_question_Option_option[]",defaultValue="")List<String> c_question_Option_option,
      int test_idx,int c_t_q_num){
      System.out.println("test_idx : " + test_idx);
      System.out.println("c_t_q_num : "+c_t_q_num);
      System.out.println("c_question_Option_option : " +c_question_Option_option.get(0));
      int result = My_classTestDao.class_Question_Write(dto);
      String msg = result>0?"등록되었습니다.":"등록에 실패했습니다.";
      int c_t_q_idx = My_classTestDao.class_test_qna_c_t_q_idx(test_idx, c_t_q_num);
      System.out.println("c_t_q_idx : "+c_t_q_idx);
      List<My_ClassTestDTO> list = new ArrayList<My_ClassTestDTO>();
      for(int i=0;i<c_question_Option_num.size();i++){
         My_ClassTestDTO ClassTestdto = new My_ClassTestDTO();
         ClassTestdto.setTest_idx(test_idx);
         ClassTestdto.setC_t_q_idx(c_t_q_idx);
         ClassTestdto.setC_t_q_o_num(c_question_Option_num.get(i));
         ClassTestdto.setC_t_q_o_option(c_question_Option_option.get(i));
         list.add(ClassTestdto);
      }
      My_classTestDao.class_Question_Option_Write(dto,list);
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("mypage/my_teacher/my_class_testMsg");
      return mav;
   }
   
   @RequestMapping(value="/class_question_option_update.do",method=RequestMethod.GET)
   public ModelAndView class_question_option_update(
         @ModelAttribute("dto")My_ClassTestDTO dto,
         @RequestParam(value="c_question_Option_num[]",defaultValue="")List<Integer> c_question_Option_num,
         @RequestParam(value="c_question_Option_option[]",defaultValue="")List<String> c_question_Option_option,
         int test_idx,int c_t_q_idx){
      System.out.println("test_idx :"+test_idx);
      System.out.println("c_t_q_idx :"+c_t_q_idx);
      System.out.println("dto.getC_t_q_num :"+dto.getC_t_q_num());
      System.out.println("dto.getC_t_q_idx :"+dto.getC_t_q_idx());
      int result = My_classTestDao.class_question_qna_update(dto);
      String msg = result>0?"문제 수정 성공":"문제 수정 실패";
      List<My_ClassTestDTO> listdelete = new ArrayList<My_ClassTestDTO>();
      for(int i=0;i<c_question_Option_num.size();i++){
         My_ClassTestDTO ClassTestdto = new My_ClassTestDTO();
         ClassTestdto.getTest_idx();
         ClassTestdto.getC_t_q_idx();
         listdelete.add(ClassTestdto);
      }
      My_classTestDao.class_test_qna_option_update_delete(test_idx, c_t_q_idx);
      List<My_ClassTestDTO> list = new ArrayList<My_ClassTestDTO>();
      for(int i=0;i<c_question_Option_num.size();i++){
         My_ClassTestDTO ClassTestdto = new My_ClassTestDTO();
         ClassTestdto.setTest_idx(test_idx);
         ClassTestdto.setC_t_q_idx(c_t_q_idx);
         ClassTestdto.setC_t_q_o_num(c_question_Option_num.get(i));
         ClassTestdto.setC_t_q_o_option(c_question_Option_option.get(i));
         list.add(ClassTestdto);
      }
      My_classTestDao.class_Question_Option_Write(dto,list);
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg",msg);
      System.out.println("zzzz1111");
      mav.setViewName("mypage/my_teacher/my_class_testMsg");
      System.out.println("zzzz1112");
      
      return mav;
   }
   
   @RequestMapping("class_question_delete.do")
   public ModelAndView class_Question_Delete(My_ClassTestDTO dto){
      int result = My_classTestDao.question_Delete(dto);
      String msg = result>0?"시험 삭제 성공":"문제 삭제 실패";
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("mypage/my_teacher/my_classMsg");
      return mav;
   }
   
   
   @RequestMapping("/question_Delete.do")
   public ModelAndView question_Delete(My_ClassTestDTO dto){
      int result = My_classTestDao.woorkbook_question_Delete(dto);
      String msg = result>0?"문제 삭제 성공":"문제 삭제 실패";
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg",msg);
      mav.setViewName("mypage/my_teacher/my_classMsg");
      return mav;
   }
   
   @RequestMapping("/class_question_update_select.do")
   public ModelAndView class_question_update_select(int c_t_q_idx){
      My_ClassTestDTO dto1 = My_classTestDao.class_question_update_select(c_t_q_idx);
      List<My_ClassTestDTO> dto2 = My_classTestDao.class_question_option_update_select(c_t_q_idx);
      ModelAndView mav = new ModelAndView();
      mav.addObject("dto1",dto1);
      mav.addObject("dto2",dto2);
      mav.setViewName("mypage/my_teacher/my_class_question_update");
      return mav;
   }
   
   @RequestMapping("/class_question_all_delete.do")
   public ModelAndView class_question_delete(int c_t_q_idx){
      System.out.println("c_t_q_idx :"+c_t_q_idx);
      int result1 = My_classTestDao.class_question_delete(c_t_q_idx);
      int result2 = My_classTestDao.class_question_option_delete(c_t_q_idx);
      String msg = result2>0?"시험 문제 삭제 성공":"시험 문제 삭제 실패";
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg",msg);
      mav.setViewName("mypage/my_teacher/my_questionMsg");
      return mav;
   }
}