package gyum_02.masterpage.model._____;

public class mp_ClassManagementDTO {
	public int class_idx;
	public String subject_name;	//과목명
	public String class_subject;//강의명
	public String tea_name;		//선생명
	public String class_day;	//요일
	public int class_check;		//상태
	public int class_startdate;//개강일
	public int class_enddate;	//종강일
	public int classroom;
	public int class_time;
	public int tea_idx;
	public int class_price;
	public int class_max_student;
	public int subject_num;
	
	public String checkbox_class_idx;
	public String checkbox_subject_name;
	public String checkbox_class_subject;
	public String checkbox_tea_name;		
	public String checkbox_class_startdate;
	public String checkbox_class_enddate;
	public String checkbox_class_check_0;
	public String checkbox_class_check_1;
	public String checkbox_class_check_2;
	public String checkbox_class_day_0;
	public String checkbox_class_day_1;
	public String checkbox_class_day_2;
	public String checkbox_class_day_3;
	public String checkbox_class_day_4;
	
	//tea_idx
	
	public mp_ClassManagementDTO() {
		super();
	}
	public mp_ClassManagementDTO(int class_idx, String subject_name, String class_subject, String tea_name,
			String class_day, int class_check, int class_startdate, int class_enddate) {
		super();
		this.class_idx = class_idx;
		this.subject_name = subject_name;
		this.class_subject = class_subject;
		this.tea_name = tea_name;
		this.class_day = class_day;
		this.class_check = class_check;
		this.class_startdate = class_startdate;
		this.class_enddate = class_enddate;
	}
	
	public mp_ClassManagementDTO(int class_idx, String class_subject, String class_day, int class_startdate, int class_enddate,
			int classroom, int class_time, int tea_idx, int class_price, int class_max_student, int subject_num) {
		super();
		this.class_idx = class_idx;
		this.class_subject = class_subject;
		this.class_day = class_day;
		this.class_startdate = class_startdate;
		this.class_enddate = class_enddate;
		this.classroom = classroom;
		this.class_time = class_time;
		this.tea_idx = tea_idx;
		this.class_price = class_price;
		this.class_max_student = class_max_student;
		this.subject_num = subject_num;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}
	public String getClass_subject() {
		return class_subject;
	}
	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
	}
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
	public String getClass_day() {
		return class_day;
	}
	public void setClass_day(String class_day) {
		this.class_day = class_day;
	}
	public int getClass_check() {
		return class_check;
	}
	public void setClass_check(int class_check) {
		this.class_check = class_check;
	}
	public int getClass_startdate() {
		return class_startdate;
	}
	public void setClass_startdate(int class_startdate) {
		this.class_startdate = class_startdate;
	}
	public int getClass_enddate() {
		return class_enddate;
	}
	public void setClass_enddate(int class_enddate) {
		this.class_enddate = class_enddate;
	}
	public String getCheckbox_class_idx() {
		return checkbox_class_idx;
	}
	public void setCheckbox_class_idx(String checkbox_class_idx) {
		this.checkbox_class_idx = checkbox_class_idx;
	}
	public String getCheckbox_subject_name() {
		return checkbox_subject_name;
	}
	public void setCheckbox_subject_name(String checkbox_subject_name) {
		this.checkbox_subject_name = checkbox_subject_name;
	}
	public String getCheckbox_class_subject() {
		return checkbox_class_subject;
	}
	public void setCheckbox_class_subject(String checkbox_class_subject) {
		this.checkbox_class_subject = checkbox_class_subject;
	}
	public String getCheckbox_tea_name() {
		return checkbox_tea_name;
	}
	public void setCheckbox_tea_name(String checkbox_tea_name) {
		this.checkbox_tea_name = checkbox_tea_name;
	}
	public String getCheckbox_class_startdate() {
		return checkbox_class_startdate;
	}
	public void setCheckbox_class_startdate(String checkbox_class_startdate) {
		this.checkbox_class_startdate = checkbox_class_startdate;
	}
	public String getCheckbox_class_enddate() {
		return checkbox_class_enddate;
	}
	public void setCheckbox_class_enddate(String checkbox_class_enddate) {
		this.checkbox_class_enddate = checkbox_class_enddate;
	}
	public String getCheckbox_class_check_0() {
		return checkbox_class_check_0;
	}
	public void setCheckbox_class_check_0(String checkbox_class_check_0) {
		this.checkbox_class_check_0 = checkbox_class_check_0;
	}
	public String getCheckbox_class_check_1() {
		return checkbox_class_check_1;
	}
	public void setCheckbox_class_check_1(String checkbox_class_check_1) {
		this.checkbox_class_check_1 = checkbox_class_check_1;
	}
	public String getCheckbox_class_check_2() {
		return checkbox_class_check_2;
	}
	public void setCheckbox_class_check_2(String checkbox_class_check_2) {
		this.checkbox_class_check_2 = checkbox_class_check_2;
	}
	public String getCheckbox_class_day_0() {
		return checkbox_class_day_0;
	}
	public void setCheckbox_class_day_0(String checkbox_class_day_0) {
		this.checkbox_class_day_0 = checkbox_class_day_0;
	}
	public String getCheckbox_class_day_1() {
		return checkbox_class_day_1;
	}
	public void setCheckbox_class_day_1(String checkbox_class_day_1) {
		this.checkbox_class_day_1 = checkbox_class_day_1;
	}
	public String getCheckbox_class_day_2() {
		return checkbox_class_day_2;
	}
	public void setCheckbox_class_day_2(String checkbox_class_day_2) {
		this.checkbox_class_day_2 = checkbox_class_day_2;
	}
	public String getCheckbox_class_day_3() {
		return checkbox_class_day_3;
	}
	public void setCheckbox_class_day_3(String checkbox_class_day_3) {
		this.checkbox_class_day_3 = checkbox_class_day_3;
	}
	public String getCheckbox_class_day_4() {
		return checkbox_class_day_4;
	}
	public void setCheckbox_class_day_4(String checkbox_class_day_4) {
		this.checkbox_class_day_4 = checkbox_class_day_4;
	}
	public int getClassroom() {
		return classroom;
	}
	public void setClassroom(int classroom) {
		this.classroom = classroom;
	}
	public int getClass_time() {
		return class_time;
	}
	public void setClass_time(int class_time) {
		this.class_time = class_time;
	}
	public int getTea_idx() {
		return tea_idx;
	}
	public void setTea_idx(int tea_idx) {
		this.tea_idx = tea_idx;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public int getClass_max_student() {
		return class_max_student;
	}
	public void setClass_max_student(int class_max_student) {
		this.class_max_student = class_max_student;
	}
	public int getSubject_num() {
		return subject_num;
	}
	public void setSubject_num(int subject_num) {
		this.subject_num = subject_num;
	}
	
	
}
