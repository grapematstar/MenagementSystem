package gyum_02.study.model;

import java.sql.Date;

public class recruitStudyDTO {
	  	private int study_recruitidx;
	  	private int stu_idx;
	    private String stu_id;
	    private String study_recruit_subject;
	    private String study_recruit_content;
	    private String study_recruit_directory;
	    private int study_recruit_maxnum;
	    private int study_recruit_reqmem;
	    private int study_recruit_aceptmem;
	    private int study_recruit_term;
	    private int study_recruit_weeknum;
	    private int study_recruit_onoff;
	    private int study_recruit_usetime;
	    private int study_recruit_situ;
	    private Date study_recruit_writedate;
		public recruitStudyDTO() {
			super();
		}
		public recruitStudyDTO(int study_recruitidx, int stu_idx, String stu_id, String study_recruit_subject,
				String study_recruit_content, String study_recruit_directory, int study_recruit_maxnum,
				int study_recruit_reqmem, int study_recruit_aceptmem, int study_recruit_term, int study_recruit_weeknum,
				int study_recruit_onoff, int study_recruit_usetime, int study_recruit_situ,
				Date study_recruit_writedate) {
			super();
			this.study_recruitidx = study_recruitidx;
			this.stu_idx = stu_idx;
			this.stu_id = stu_id;
			this.study_recruit_subject = study_recruit_subject;
			this.study_recruit_content = study_recruit_content;
			this.study_recruit_directory = study_recruit_directory;
			this.study_recruit_maxnum = study_recruit_maxnum;
			this.study_recruit_reqmem = study_recruit_reqmem;
			this.study_recruit_aceptmem = study_recruit_aceptmem;
			this.study_recruit_term = study_recruit_term;
			this.study_recruit_weeknum = study_recruit_weeknum;
			this.study_recruit_onoff = study_recruit_onoff;
			this.study_recruit_usetime = study_recruit_usetime;
			this.study_recruit_situ = study_recruit_situ;
			this.study_recruit_writedate = study_recruit_writedate;
		}
		public int getStudy_recruitidx() {
			return study_recruitidx;
		}
		public void setStudy_recruitidx(int study_recruitidx) {
			this.study_recruitidx = study_recruitidx;
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
		public String getStudy_recruit_subject() {
			return study_recruit_subject;
		}
		public void setStudy_recruit_subject(String study_recruit_subject) {
			this.study_recruit_subject = study_recruit_subject;
		}
		public String getStudy_recruit_content() {
			return study_recruit_content;
		}
		public void setStudy_recruit_content(String study_recruit_content) {
			this.study_recruit_content = study_recruit_content;
		}
		public String getStudy_recruit_directory() {
			return study_recruit_directory;
		}
		public void setStudy_recruit_directory(String study_recruit_directory) {
			this.study_recruit_directory = study_recruit_directory;
		}
		public int getStudy_recruit_maxnum() {
			return study_recruit_maxnum;
		}
		public void setStudy_recruit_maxnum(int study_recruit_maxnum) {
			this.study_recruit_maxnum = study_recruit_maxnum;
		}
		public int getStudy_recruit_reqmem() {
			return study_recruit_reqmem;
		}
		public void setStudy_recruit_reqmem(int study_recruit_reqmem) {
			this.study_recruit_reqmem = study_recruit_reqmem;
		}
		public int getStudy_recruit_aceptmem() {
			return study_recruit_aceptmem;
		}
		public void setStudy_recruit_aceptmem(int study_recruit_aceptmem) {
			this.study_recruit_aceptmem = study_recruit_aceptmem;
		}
		public int getStudy_recruit_term() {
			return study_recruit_term;
		}
		public void setStudy_recruit_term(int study_recruit_term) {
			this.study_recruit_term = study_recruit_term;
		}
		public int getStudy_recruit_weeknum() {
			return study_recruit_weeknum;
		}
		public void setStudy_recruit_weeknum(int study_recruit_weeknum) {
			this.study_recruit_weeknum = study_recruit_weeknum;
		}
		public int getStudy_recruit_onoff() {
			return study_recruit_onoff;
		}
		public void setStudy_recruit_onoff(int study_recruit_onoff) {
			this.study_recruit_onoff = study_recruit_onoff;
		}
		public int getStudy_recruit_usetime() {
			return study_recruit_usetime;
		}
		public void setStudy_recruit_usetime(int study_recruit_usetime) {
			this.study_recruit_usetime = study_recruit_usetime;
		}
		public int getStudy_recruit_situ() {
			return study_recruit_situ;
		}
		public void setStudy_recruit_situ(int study_recruit_situ) {
			this.study_recruit_situ = study_recruit_situ;
		}
		public Date getStudy_recruit_writedate() {
			return study_recruit_writedate;
		}
		public void setStudy_recruit_writedate(Date study_recruit_writedate) {
			this.study_recruit_writedate = study_recruit_writedate;
		}

	    
	    
}
