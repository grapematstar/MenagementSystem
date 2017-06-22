package gyum_02.study.model;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.w3c.dom.ls.LSInput;
public class createStudyDAOImple implements createStudyDAO {
	
		private SqlSessionTemplate sqlMap;

		public createStudyDAOImple(SqlSessionTemplate sqlMap) {
			super();
			this.sqlMap = sqlMap;
		}
		
		public int studyadd(createStudyDTO dto,HttpSession session){
			String stu_id=(String)session.getAttribute("id");
			dto.setStudy_id(stu_id);
			int count=sqlMap.insert("studyinsert",dto);			
			if(count>0){
			int study_idx=sqlMap.selectOne("study_getidx",dto);			
			int stu_idx=(Integer)session.getAttribute("idx");			
			String stu_name=(String)session.getAttribute("name");				
		
			memberStudyDTO mdto=new memberStudyDTO(study_idx, stu_idx, stu_id, stu_name);
			
			sqlMap.insert("create_study_member",mdto);
			
			String no="-";
			leaderStudyDTO ldto=new leaderStudyDTO(study_idx,stu_id,no);
			sqlMap.insert("create_study_leader",ldto);			
			
			infoStudyDTO infoDTO=sqlMap.selectOne("get_info_study", stu_idx);
			
			int study_info_alltime=infoDTO.getStudy_info_alltime()+1;
			int study_info_playing=infoDTO.getStudy_info_playing()+1;
			
			infoStudyDTO infoSDTO=new infoStudyDTO(stu_idx, stu_id, stu_name, study_info_alltime,0, study_info_playing,0);
			
			sqlMap.update("info_study_update",infoSDTO);
			
			
			bbsnameStudyDTO bbsnameDTO=new bbsnameStudyDTO(study_idx, "Study Place", 1);
			sqlMap.insert("study_bbsname",bbsnameDTO);
			
			}
			
			return count;
		}
		public int studymodi(createStudyDTO dto,HttpSession session){
			String stu_id=(String)session.getAttribute("id");
			dto.setStudy_id(stu_id);
			int count=sqlMap.update("studymodi",dto);		
			return count;
		}
		public List<createStudyDTO> studylist(int cp,int ls){
			  int startnum = (cp-1)*ls+1;
		      int endnum = cp*ls;
			Map<String, Integer> map=new HashMap<String, Integer>();
			   map.put("startnum", startnum);
			      map.put("endnum", endnum);
			List<createStudyDTO> list=sqlMap.selectList("studylist",map);
			return list;
		}
		
		
		public List<createStudyDTO> getstudyinfo(int idx){
			List<createStudyDTO> list=sqlMap.selectList("getstudyinfo",idx);
			return list;
		}
		
		public int getmaxmember(int study_idx){
			int maxmem=sqlMap.selectOne("getmaxmember",study_idx);
			return maxmem;
		}
		public int get_study_total(){
			int total=sqlMap.selectOne("get_study_total");
			return total;
		}
		
		
      public int get_study_total_theme(String theme) {
          int total=sqlMap.selectOne("get_study_total_theme",theme);
          return total;
       }
       public int get_study_total_title(String title) {
          int total=sqlMap.selectOne("get_study_total_title",title);
          return total;
       }
       public List<createStudyDTO> studylist_theme(int cp, int ls, String theme) {
          int startnum = (cp-1)*ls+1;
          int endnum = cp*ls;
          Map<String,Object> map=new HashMap<String,Object>();
          map.put("theme",theme);
          map.put("startnum", startnum);
            map.put("endnum", endnum);
          List<createStudyDTO> list=sqlMap.selectList("studylist_theme",map);
          System.out.println("�����ΰ˻��� ���:"+list.size());
          return list;
       }
       public List<createStudyDTO> studylist_title(int cp, int ls, String title) {
          int startnum = (cp-1)*ls+1;
          int endnum = cp*ls;
          Map<String,Object> map=new HashMap<String, Object>();
          map.put("title",title);
          map.put("startnum", startnum);
            map.put("endnum", endnum);
          List<createStudyDTO> list=sqlMap.selectList("studylist_title",map);
          return list;
       }
       public int study_CloseOrStart(int study_idx,int study_situ) {
		      Map<String, Object> map=new HashMap<String, Object>();
		      map.put("study_idx", study_idx);
		      map.put("study_situ", study_situ);
		      int count=sqlMap.update("study_CloseOrStart",map);
		      return count;
		   }
       
       public int get_study_idx(createStudyDTO csdto){
    	   int study_idx=sqlMap.selectOne("get_study_idx",csdto);
    	   return study_idx;
       }
       
}