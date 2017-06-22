package gyum_02.member.model;

import java.util.List;

public interface StudentMemberDAO {

	public int studentAdd(StudentMemberDTO dto);
	public int studentRmv(String name);
	public List<StudentMemberDTO> studentAllList();
	public List<StudentMemberDTO> studentSearch(String name);
	public int studentUpdate(String name);
	public int studentLogin(String id, String pwd);
}
