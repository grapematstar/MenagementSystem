package gyum_02.member.model;

import java.util.List;
import java.util.Map;

import gyum_02.member.model.*;
import javax.servlet.http.HttpSession;

public interface My_memberStudentDAO{

   public int studentWrite(My_memberStudentDTO dto);
   
   public int studentImageFileWrite(Map<String,Object> filemap);
   
   public int studentImageFileIdxUpdate(int stu_idx,int file_idx);
   
   public int login(String stu_id,String stu_pwd,HttpSession session);
   
   public String pwCheck(String user_id,String user_email);
   
   public int idCheck(String stu_id);
   
   public My_memberStudentDTO getInfo(String id,HttpSession session);
   
   public My_memberStudentDTO getstuInfo(String id);
   
   public int stu_Update(My_memberStudentDTO dto);
   
   public My_memberStudentDTO stu_InfoDel(String id);
   
   public int stu_Delete(String stu_id,String stu_pwd);
   
   public List<My_memberStudentDTO> stu_QnaWriteForm(String id,String usergrade);
   
   public int getstuidx(String id);
   
   public List<My_memberStudentDTO> stu_file(int stu_idx);
   
   public My_memberStudentDTO in_out_date_check(String user_id);
   
   public My_memberStudentDTO select_grade_id(String user_id);
   
   public int stu_pwCheck_up(String user_id,String stu_pwd);
   
   public My_memberStudentDTO mas_check(String user_id);
   
}