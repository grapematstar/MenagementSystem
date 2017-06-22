package gyum_02.member.model;

import java.sql.Date;

public class My_memberStudentDTO {

   private int stu_idx;
   private String stu_id;
   private String stu_pwd;
   private int pwd_q_idx;
   private String stu_pwd_a;
   private int stu_birth;
   private String stu_name;
   private String stu_tel;
   private String stu_email;
   private Date stu_in_date;
   private Date stu_out_date;
   private String stu_school;
   private int stu_grade;
   private int file_idx;
   private int par_idx;
   private String file_route;
   private String usergrade;
   private String mas_id;
   public My_memberStudentDTO() {
      super();
   }
   public My_memberStudentDTO(int stu_idx, String stu_id, String stu_pwd, int pwd_q_idx, String stu_pwd_a,
         int stu_birth, String stu_name, String stu_tel, String stu_email, Date stu_in_date, Date stu_out_date,
         String stu_school, int stu_grade, int file_idx, int par_idx, String file_route, String usergrade,
         String mas_id) {
      super();
      this.stu_idx = stu_idx;
      this.stu_id = stu_id;
      this.stu_pwd = stu_pwd;
      this.pwd_q_idx = pwd_q_idx;
      this.stu_pwd_a = stu_pwd_a;
      this.stu_birth = stu_birth;
      this.stu_name = stu_name;
      this.stu_tel = stu_tel;
      this.stu_email = stu_email;
      this.stu_in_date = stu_in_date;
      this.stu_out_date = stu_out_date;
      this.stu_school = stu_school;
      this.stu_grade = stu_grade;
      this.file_idx = file_idx;
      this.par_idx = par_idx;
      this.file_route = file_route;
      this.usergrade = usergrade;
      this.mas_id = mas_id;
   }
   public int getStu_idx() {
      return stu_idx;
   }
   public void setStu_idx(int stu_idx) {
      this.stu_idx = stu_idx;
   }
   public String getStu_id() {
      return stu_id;
   }
   public void setStu_id(String stu_id) {
      this.stu_id = stu_id;
   }
   public String getStu_pwd() {
      return stu_pwd;
   }
   public void setStu_pwd(String stu_pwd) {
      this.stu_pwd = stu_pwd;
   }
   public int getPwd_q_idx() {
      return pwd_q_idx;
   }
   public void setPwd_q_idx(int pwd_q_idx) {
      this.pwd_q_idx = pwd_q_idx;
   }
   public String getStu_pwd_a() {
      return stu_pwd_a;
   }
   public void setStu_pwd_a(String stu_pwd_a) {
      this.stu_pwd_a = stu_pwd_a;
   }
   public int getStu_birth() {
      return stu_birth;
   }
   public void setStu_birth(int stu_birth) {
      this.stu_birth = stu_birth;
   }
   public String getStu_name() {
      return stu_name;
   }
   public void setStu_name(String stu_name) {
      this.stu_name = stu_name;
   }
   public String getStu_tel() {
      return stu_tel;
   }
   public void setStu_tel(String stu_tel) {
      this.stu_tel = stu_tel;
   }
   public String getStu_email() {
      return stu_email;
   }
   public void setStu_email(String stu_email) {
      this.stu_email = stu_email;
   }
   public Date getStu_in_date() {
      return stu_in_date;
   }
   public void setStu_in_date(Date stu_in_date) {
      this.stu_in_date = stu_in_date;
   }
   public Date getStu_out_date() {
      return stu_out_date;
   }
   public void setStu_out_date(Date stu_out_date) {
      this.stu_out_date = stu_out_date;
   }
   public String getStu_school() {
      return stu_school;
   }
   public void setStu_school(String stu_school) {
      this.stu_school = stu_school;
   }
   public int getStu_grade() {
      return stu_grade;
   }
   public void setStu_grade(int stu_grade) {
      this.stu_grade = stu_grade;
   }
   public int getFile_idx() {
      return file_idx;
   }
   public void setFile_idx(int file_idx) {
      this.file_idx = file_idx;
   }
   public int getPar_idx() {
      return par_idx;
   }
   public void setPar_idx(int par_idx) {
      this.par_idx = par_idx;
   }
   public String getFile_route() {
      return file_route;
   }
   public void setFile_route(String file_route) {
      this.file_route = file_route;
   }
   public String getUsergrade() {
      return usergrade;
   }
   public void setUsergrade(String usergrade) {
      this.usergrade = usergrade;
   }
   public String getMas_id() {
      return mas_id;
   }
   public void setMas_id(String mas_id) {
      this.mas_id = mas_id;
   }
   
}