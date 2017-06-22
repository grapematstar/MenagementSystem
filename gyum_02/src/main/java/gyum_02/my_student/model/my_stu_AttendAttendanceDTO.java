package gyum_02.my_student.model;

public class my_stu_AttendAttendanceDTO {

	private int a_a_idx;
	private String a_a_attendance;
	
	public my_stu_AttendAttendanceDTO() {
		super();
	}

	public my_stu_AttendAttendanceDTO(int a_a_idx, String a_a_attendance) {
		super();
		this.a_a_idx = a_a_idx;
		this.a_a_attendance = a_a_attendance;
	}

	public int getA_a_idx() {
		return a_a_idx;
	}

	public void setA_a_idx(int a_a_idx) {
		this.a_a_idx = a_a_idx;
	}

	public String getA_a_attendance() {
		return a_a_attendance;
	}

	public void setA_a_attendance(String a_a_attendance) {
		this.a_a_attendance = a_a_attendance;
	}
		
}
