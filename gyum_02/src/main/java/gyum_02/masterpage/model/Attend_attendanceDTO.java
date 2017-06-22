package gyum_02.masterpage.model;

public class Attend_attendanceDTO {
	private int a_a_idx;
	private String a_a_attendance;
	
	public Attend_attendanceDTO(int a_a_idx, String a_a_attendance) {
		super();
		this.a_a_idx = a_a_idx;
		this.a_a_attendance = a_a_attendance;
	}
	public Attend_attendanceDTO() {
		super();
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
