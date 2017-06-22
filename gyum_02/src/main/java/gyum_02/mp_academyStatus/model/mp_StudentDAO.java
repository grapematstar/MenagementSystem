package gyum_02.mp_academyStatus.model;

import java.util.*;

public interface mp_StudentDAO {
	public int mpStudentTotalCnt();
	public int mpStudentClassTotalCnt(int class_idx);
	public List mpStudentAllList(int cp, int listSize);
	public List mpStudentClassList(int cp, int listSize, int class_idx);
	public mp_ClassDTO mpClassInfo(int splits_class_idx);
	public List<String> mpStudentClassNameList();
}
