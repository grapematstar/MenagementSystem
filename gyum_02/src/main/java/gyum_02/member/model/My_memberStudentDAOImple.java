package gyum_02.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class My_memberStudentDAOImple implements My_memberStudentDAO {

   private SqlSessionTemplate sqlMap;
   
   public My_memberStudentDAOImple(SqlSessionTemplate sqlMap){
      super();
      this.sqlMap = sqlMap;
   }
   
   public int studentWrite(My_memberStudentDTO dto) {
      int count = sqlMap.insert("studentWrite",dto);
      return count;
   }
   
   public int studentImageFileWrite(Map<String, Object> filemap) {
      filemap.put("file_idx", 0);
      int count=sqlMap.insert("studentImageFileWrite", filemap);
      return (Integer)filemap.get("file_idx");
   }
   
   public int studentImageFileIdxUpdate(int stu_idx, int file_idx) {
      Map<String,Object> map=new HashMap<String,Object>();
      map.put("stu_idx", stu_idx);
      map.put("file_idx", file_idx);
      int count=sqlMap.update("studentImageFileIdxUpdate", map);
      return count;
   }
   
   public int idCheck(String stu_id){
      
      String idCheck = sqlMap.selectOne("stu_idCheck",stu_id);
      if(idCheck==null){
         System.out.println("stu_?븘?씠?뵒媛? ?뾾?쓬");
         return 0;
      }else{
         System.out.println("stu_?븘?씠?뵒媛? ?엳?쓬");
         return 1;
      }
   }

   public int login(String user_id,String user_pwd,HttpSession session){
      
      
      String pwd = sqlMap.selectOne("stu_login", user_id);
      if(pwd==null){
         System.out.println("?븘?씠?뵒媛? ?뾾?쓬");
         return 0;
      }else{
         if(pwd.equals(user_pwd)){
            System.out.println("李?");
            getInfo(user_id, session );
            return 2;
         }else{
         System.out.println("鍮꾨?踰덊샇媛? ??由?");
         return 1;
         }
      }
   }
   
   public String pwCheck(String user_id,String user_email){
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("user_id", user_id);
      map.put("user_email", user_email);
      String pwd =  sqlMap.selectOne("stu_pwdCheck",map);
      if(pwd==null){
         return null;
      }else{
         return pwd;
      }
   }
   public My_memberStudentDTO getInfo(String id,HttpSession session){
      
      List<My_memberStudentDTO> list= sqlMap.selectList("get_student",id);
      
      My_memberStudentDTO pdto= new My_memberStudentDTO(list.get(0).getStu_idx(), list.get(0).getStu_id(), "-", 0 ,"-",0, list.get(0).getStu_name(), "-", "-",null,null, "-",0,0,0,"-","-","-");
   
      
      session.setAttribute("idx", pdto.getStu_idx());
      session.setAttribute("id",pdto.getStu_id());
      session.setAttribute("name",pdto.getStu_name());
      session.setAttribute("usergrade", "student");
      return pdto;
   }
   
   public My_memberStudentDTO getstuInfo(String id){
      My_memberStudentDTO dto = sqlMap.selectOne("stu_info",id);
      return dto;
   }
   
   public int stu_Update(My_memberStudentDTO dto){
      int count = sqlMap.update("stu_Update",dto);
      return count;
   }
   
   public My_memberStudentDTO stu_InfoDel(String id){
      My_memberStudentDTO dto = sqlMap.selectOne("stu_infoDel",id);
      return dto;
   }
   
   public int stu_Delete(String stu_id,String stu_pwd){
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("stu_id", stu_id);
      map.put("stu_pwd", stu_pwd);
      int count = sqlMap.update("stu_Delete",map);
      return count;
   }
   
   public List<My_memberStudentDTO> stu_QnaWriteForm(String id,String usergrade){
      HashMap map = new HashMap();
      map.put("id", id);
      map.put("usergrade",usergrade);
      List<My_memberStudentDTO> list = sqlMap.selectList("stu_QnaWriteForm",map);
      return list;
   }
     public int getstuidx(String id){
         int idx=sqlMap.selectOne("getstuidx",id);
         return idx;
      }
     
     public My_memberStudentDTO user_stu_present_condition(String stu_id){
         My_memberStudentDTO dto = sqlMap.selectOne("user_stu_present_condition",stu_id);
         return dto;
      }
     public List<My_memberStudentDTO> stu_file(int stu_idx){
        List<My_memberStudentDTO> dto = sqlMap.selectList("stu_file",stu_idx);
        return dto;
     }
          
     public My_memberStudentDTO in_out_date_check(String user_id){
        My_memberStudentDTO dto = sqlMap.selectOne("in_out_date_check",user_id);
        return dto;
     }
   
     public My_memberStudentDTO select_grade_id(String user_id){
        My_memberStudentDTO dto = sqlMap.selectOne("select_grade_id",user_id);
        return dto;
     }
     
     public int stu_pwCheck_up(String user_id,String stu_pwd){
         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("user_id", user_id);
         map.put("stu_pwd",stu_pwd);
         
         int count = sqlMap.update("stu_pwCheck_up",map);
         return count;
     }
     
     public My_memberStudentDTO mas_check(String user_id){
        My_memberStudentDTO dto = sqlMap.selectOne("mas_check",user_id);
        return dto;
     }
}