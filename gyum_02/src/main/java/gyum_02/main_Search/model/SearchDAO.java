package gyum_02.main_Search.model;

import java.util.List;

import gyum_02.Freebbs.model.FreebbsDTO;
import gyum_02.cybercampus.Model.CC_EpilogueDTO;
import gyum_02.member.model.My_memberTeacherDTO;
import gyum_02.mypage.model.My_ClassDTO;
import gyum_02.mypage.model.My_QnaDTO;
import gyum_02.notice.model.NoticeDTO;

public interface SearchDAO {

	List<My_ClassDTO> classSearch(int ls, String word, int ss);
	List<My_memberTeacherDTO> teacherSearch(String word, int ss);
	List<CC_EpilogueDTO> classReviewSearch(String word, int ss);
	List<FreebbsDTO> freebbsSearch(String word, int ss);
	List<NoticeDTO> noticeSearch(String word, int ss);
	int nowdateInteger();
}
