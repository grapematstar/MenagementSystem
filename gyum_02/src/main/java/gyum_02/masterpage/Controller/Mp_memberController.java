package gyum_02.masterpage.Controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.commons.PageModule;
import gyum_02.masterpage.model.*;


@Controller
public class Mp_memberController {
	@Autowired
	private StudentDAO studentDao;
	@Autowired
	private Class_studentDAO class_studentDao;
	@Autowired
	private ClassDAO classDao;
	@Autowired
	private TeacherDAO teacherDao;
	@Autowired
	private ParentDAO parentDao;
	@Autowired
	private AttendDAO attendDao;

	@RequestMapping("/mp_member_search.do")
	public ModelAndView mp_member_search(){
		List<ClassDTO> classList = classDao.mp_c_allList();
		ModelAndView mav = new ModelAndView("masterpage/mp_member/mp_member_search","classList",classList);
		return mav;
	}
	/*회원조회 - 과목 셀렉트박스 에이작스*/
	@RequestMapping("/mp_member_search_subsub.do")
	public ModelAndView mp_member_search_subsub(int subject_num){
		ModelAndView mav = new ModelAndView();
		List<ClassDTO> classList = new ArrayList<ClassDTO>();
		if(subject_num==0){
			classList = classDao.mp_c_allList();
		}else{
			classList = classDao.mp_c_select_with_sn(subject_num);
		}
		mav.addObject("classList",classList);
		mav.setViewName("yongJson");
		return mav;
	}
	/*회원조회 - 검색결과 리스트*/
	@RequestMapping("/mp_member_search_searching.do")
	public ModelAndView mp_member_search_searching(@RequestParam(value="cp",defaultValue="1")int cp,String who,String name,int class_idx,int subject_num,HttpSession session){
		System.out.println("class_idx:"+class_idx+"/who:"+who+"/name:"+name+"/subject_num:"+subject_num+"/cp:"+cp);
		ModelAndView mav = new ModelAndView();
		try {
			int total = 0;
			int ls=5;
			int ps=5;
			if(who.equals("student")){
				List<StudentDTO> student_list=new ArrayList<StudentDTO>();
				if(subject_num==0){
					if(name==null || name.equals("")){
						total = studentDao.mp_student_getTotalCnt();
						student_list = studentDao.mp_student_paging(cp, ls);
						String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
						mav.addObject("page",page);
					}else{
						List<StudentDTO> list = studentDao.mp_student_allList();//cp,ls뺀 수강생전체?네여기서는 조건없이 다가져와야 함 이거 전체 가져오는걸로 고쳐바
						List<StudentDTO> student_list_2=new ArrayList<StudentDTO>();
						for(int i=0; i<list.size(); i++){
							if(name.equals(list.get(i).getStu_name())){
								student_list_2.add(list.get(i));								
							}
						}
						total=student_list_2.size();

						int start=0;
						if(cp>1){
							start=5*(cp-1);
						}	
						int end=ls*cp;
						for(int i=start;i<end;i++){
							if(total==i){
								break;
							}
							student_list.add(student_list_2.get(i));
						}
						if(total==0){
							total=1;
						}
						String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
						mav.addObject("page",page);
					}
				}else{
					if(name==null || name.equals("")){
						List<Class_studentDTO> stu_idxs=class_studentDao.mp_cs_stu_idx_paging(class_idx,cp,ls);
						if(stu_idxs.isEmpty()){
							mav.addObject("emptymsg","검색 결과 없음ㅋㅋㅋㅋ");
						}else{
							total = class_studentDao.mp_cs_totalCnt(class_idx);
							for(int i=0; i<stu_idxs.size(); i++){
								int stu_idx = stu_idxs.get(i).getStu_idx();
								List<StudentDTO> list=studentDao.mp_student_info(stu_idx);
								student_list.add(list.get(0));	
								String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
								mav.addObject("page",page);
							}
						}
					}else{
						List<Class_studentDTO> stu_idxs=class_studentDao.mp_cs_stu_idx(class_idx);
						if(stu_idxs.isEmpty()){
							mav.addObject("emptymsg","검색 결과 없음ㅋㅋㅋㅋ");
						}else{
							List<StudentDTO> student_list_2=new ArrayList<StudentDTO>();
							for(int i=0; i<stu_idxs.size(); i++){
								int stu_idx = stu_idxs.get(i).getStu_idx();
								List<StudentDTO> list=studentDao.mp_student_info(stu_idx);
								if(name.equals(list.get(0).getStu_name())){
									student_list_2.add(list.get(0));									
								}
							}
							total=student_list_2.size();

							int start=0;
							if(cp>1){
								start=5*(cp-1);
							}	
							int end=ls*cp;
							for(int i=start;i<end;i++){
								if(total==i){
									break;
								}
								student_list.add(student_list_2.get(i));
							}
							if(total==0){
								total=1;
							}
							String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
							mav.addObject("page",page);
						}
					}
				}
				mav.addObject("checkmsg","student");
				mav.addObject("list",student_list);
			}else if(who.equals("teacher")){
				List<TeacherDTO> teacher_list=new ArrayList<TeacherDTO>();
				if(subject_num==0){
					if(name==null || name.equals("")){
						total = teacherDao.mp_teacher_totalCnt();
						teacher_list = teacherDao.mp_teacher_paging(cp,ls);
						String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
						mav.addObject("page",page);
					}else{
						List<TeacherDTO> list = teacherDao.mp_teacher_allList();
						List<TeacherDTO> teacher_list_2=new ArrayList<TeacherDTO>();
						for(int i=0; i<list.size(); i++){
							if(name.equals(list.get(i).getTea_name())){
								teacher_list_2.add(list.get(i));
							}
						}
						total=teacher_list_2.size();

						int start=0;
						if(cp>1){
							start=5*(cp-1);
						}	
						int end=ls*cp;
						for(int i=start;i<end;i++){
							if(total==i){
								break;
							}
							teacher_list.add(teacher_list_2.get(i));
						}
						if(total==0){
							total=1;
						}
						String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
						mav.addObject("page",page);
					}
				}else{
					if(name==null || name.equals("")){
						List<ClassDTO> tea_idxs = classDao.mp_c_select_tea_idx_paging(class_idx,cp,ls);	
						if(tea_idxs.isEmpty()){
							mav.addObject("emptymsg","검색 결과 없음ㅋㅋㅋㅋ");
						}else{
							total = classDao.mp_c_totalCnt(class_idx);
							for(int i=0; i<tea_idxs.size(); i++){
								int tea_idx =tea_idxs.get(i).getTea_idx();
								List<TeacherDTO> list=teacherDao.mp_teacher_info(tea_idx);
								if(list.size()!=0){
									teacher_list.add(list.get(0));	
									String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
									mav.addObject("page",page);
								}else{
									mav.addObject("emptymsg","검색 결과 없음ㅋㅋㅋㅋ");
								}
							}
						}
					}else{
						List<ClassDTO> tea_idxs = classDao.mp_c_select_tea_idx(class_idx);
						if(tea_idxs.isEmpty()){
							mav.addObject("emptymsg","검색 결과 없음ㅋㅋㅋㅋ");
						}else{
							List<TeacherDTO> teacher_list_2=new ArrayList<TeacherDTO>();
							for(int i=0; i<tea_idxs.size(); i++){
								int tea_idx = tea_idxs.get(i).getTea_idx();
								List<TeacherDTO> list=teacherDao.mp_teacher_info(tea_idx);
								if(list.size()!=0){
									if(name.equals(list.get(0).getTea_name())){
										teacher_list_2.add(list.get(0));	
									}
								}else{
									mav.addObject("emptymsg","검색 결과 없음ㅋㅋㅋㅋ");
								}
							}
							total=teacher_list_2.size();
						
							int start=0;
							if(cp>1){
								start=5*(cp-1);
							}	
							int end=ls*cp;
							for(int i=start;i<end;i++){
								if(total==i){
									break;
								}
								teacher_list.add(teacher_list_2.get(i));
							}
							if(total==0){
								total=1;
							}
							String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
							mav.addObject("page",page);
						}
					}
				}
				mav.addObject("checkmsg","teacher");
				mav.addObject("list",teacher_list);
			}else if(who.equals("parent")){
				List<ParentDTO> parent_list = new ArrayList<ParentDTO>();
				if(name==null || name.equals("")){
					total = parentDao.mp_parent_totalCnt();
					parent_list = parentDao.mp_parent_paging(cp,ls);
					String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
					mav.addObject("page",page);
				}else{
					List<StudentDTO> par_idxs = studentDao.mp_student_par(name);
					List<ParentDTO> parent_list_2 = new ArrayList<ParentDTO>();
					for(int i=0; i<par_idxs.size(); i++){
						int par_idx = par_idxs.get(i).getPar_idx();
						List<ParentDTO> list = parentDao.mp_parent_info(par_idx);
						if(list.size()>0)parent_list_2.add(list.get(0));
					}
					total=parent_list_2.size();
					if(total==0){
						total=1;
					}
					int start=0;
					if(cp>1){
						start=5*(cp-1);
					}	
					int end=ls*cp;
					for(int i=start;i<end;i++){
						if(total==i){
							break;
						}
						parent_list.add(parent_list_2.get(i));
					}
					String page=Seongyun_PageModule.pageMake("searching", total, ls, ps, cp);
					mav.addObject("page",page);
				}
				mav.addObject("checkmsg","parent");
				mav.addObject("list",parent_list);
			}
		} catch (NullPointerException e) {}

		mav.setViewName("yongJson");
		return mav;
	}
	
	@RequestMapping("/mp_student_infogo.do")
	public ModelAndView mp_student_infogo(int stu_idx){
		ModelAndView mav = new ModelAndView();
		mav.addObject("stu_idx",stu_idx);
		mav.setViewName("masterpage/mp_member/mp_student_info");
		return mav;
	}
/**ȸ����������*/
	@RequestMapping("/mp_student_info.do")
	public ModelAndView mp_student_info(int stu_idx){
		ModelAndView mav = new ModelAndView();		
		List<StudentDTO> list = studentDao.mp_student_info(stu_idx);
		mav.addObject("studentInfo",list.get(0));		
		mav.setViewName("yongJson");
		return mav;
	}
	//���� ���� ������ ���ǳ���
	@RequestMapping("/mp_student_class_info.do")
	public ModelAndView mp_student_class_info(int stu_idx,int subject_num){		
		List<Class_studentDTO> IndexList = class_studentDao.mp_cs_select(stu_idx);
		List<ClassDTO> classList=new ArrayList<ClassDTO>();
		for(int i=0;i<IndexList.size();i++){
			int class_idx=IndexList.get(i).getClass_idx();
			List<ClassDTO> classList2 = classDao.mp_c_select(class_idx);
			if(classList2.get(0).getSubject_num()==subject_num){
				classList.add(classList2.get(0));
			}
		}		
		ModelAndView mav = new ModelAndView();
		mav.addObject("classList",classList);
		mav.setViewName("yongJson");
		return mav;
	}
	//���� ��ü ����
	@RequestMapping("/mp_academy_class_info.do")
	public ModelAndView mp_academy_class_info(int subject_num){
		List<ClassDTO> subclass = classDao.mp_c_select_with_sn(subject_num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("subClass",subclass);//����
		mav.setViewName("yongJson");
		return mav;
	}
	//�߰����� ��ħüũ �� ��� ����
	@RequestMapping("/mp_student_class_add.do")
	public ModelAndView mp_student_class_add(int class_idx,int stu_idx){
		List<ClassDTO> classList = classDao.mp_c_select(class_idx);		
		String class_day=classList.get(0).getClass_day();
		int class_time=classList.get(0).getClass_time();
		List<Class_studentDTO> IndexList = class_studentDao.mp_cs_select(stu_idx);		
		ModelAndView mav = new ModelAndView();
		int check=0;
		for(int i=0;i<IndexList.size();i++){
			int class_idx2=IndexList.get(i).getClass_idx();
			List<ClassDTO> classList2 = classDao.mp_c_select(class_idx2);
			String stu_class_day=classList2.get(0).getClass_day();
			int stu_class_time=classList2.get(0).getClass_time();
			if(class_day.equals(stu_class_day)){
				if(class_time==stu_class_time){
					mav.addObject("msg",classList2.get(0).getClass_subject()+"�� ���ǽð��� ��Ĩ�ϴ�.");
					check++;
					break;
				}
			}
		}
		if(check==0){
			mav.addObject("classadd",classList.get(0));
			Class_studentDTO dto=new Class_studentDTO(class_idx, stu_idx);
			class_studentDao.mp_cs_insert(dto);
		}		
		mav.setViewName("yongJson");
		return mav;
	}
	//�߰��ߴ� ���� ����
	@RequestMapping("/mp_student_class_del.do")
	public ModelAndView mp_student_class_del(int class_idx,int stu_idx){
		Class_studentDTO dto=new Class_studentDTO(class_idx, stu_idx);		
		class_studentDao.mp_cs_delete(dto);		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("yongJson");
		return mav;
	}
	//ȸ����������
	@RequestMapping("/mp_student_info_update.do")
	public ModelAndView mp_student_info_update(StudentDTO dto){
		studentDao.mp_student_update(dto);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("yongJson");
		return mav;
	}
		
/*�п� ���� ��ü*/
/*	@RequestMapping("/mp_class_all_info_list.do")
	public ModelAndView mp_class_all_info_list(){
		ModelAndView mav = new ModelAndView();
		List<ClassDTO> class_all_info_list = classDao.mp_c_allList();
		mav.addObject("class_all_info_list",class_all_info_list);
		mav.setViewName("yongJson");
		return mav;
	}*/
	
	@RequestMapping("/mp_teacher_info.do")
	public ModelAndView mp_teacher_info(int tea_idx){
		List<TeacherDTO> list = teacherDao.mp_teacher_info(tea_idx);
		int a=list.get(0).getSubject_num();
		List<ClassDTO> classlist = classDao.mp_c_allList_where_tea_idx(tea_idx);
		
		ModelAndView mav = new ModelAndView("masterpage/mp_member/mp_teacher_info","teacherInfo",list);
		mav.addObject("cl",classlist);
		mav.addObject("subject_num",a);
		return mav;
	}

	@RequestMapping("/mp_teacher_update.do")
	public ModelAndView mp_teacher_update(TeacherDTO dto){
		int result = teacherDao.mp_teacher_update(dto);
		String msg = result>0? "��������":"��������";
		ModelAndView mav = new ModelAndView("masterpage/mp_member/mp_member_msg","msg",msg);
		return mav;
	}
	@RequestMapping("/mp_parent_info.do")
	public ModelAndView mp_parent_info(int par_idx){
		List<ParentDTO> list = parentDao.mp_parent_info(par_idx);
		ModelAndView mav = new ModelAndView("masterpage/mp_member/mp_parent_info","parentInfo",list);
		return mav;
	}
	@RequestMapping("/mp_parent_update.do")
	public ModelAndView mp_parent_update(ParentDTO dto){
		int result = parentDao.mp_parent_update(dto);
		String msg = result>0? "��������":"��������";
		ModelAndView mav = new ModelAndView("masterpage/mp_member/mp_member_msg","msg",msg);
		return mav;
	}
/*
	@RequestMapping("/mp_student_delete.do")
	public ModelAndView mp_student_delete(int stu_idx){
		int result = studentDao.mp_student_delete(stu_idx);	//�л���������
		String msg = result>0? " delete student ":" omg ";
		int result2 = class_studentDao.mp_cs_delete_student(stu_idx);	//���Ǻ� �л� ���� ����
		if(result2==0){
			msg+="omg";
		}else{
			msg+=" delete class_student ";
		}
		List<StudentDTO> list = studentDao.mp_student_info(stu_idx);
		int result3=0;
	
		if(list.size()==0){
			msg+="no parent";
		}else{
			int par_idx = list.get(0).getPar_idx();
			if(par_idx!=0)result3 = parentDao.mp_parent_delete(par_idx);	//�θ�� ���� ����
			msg+=result3>0? " delete parent ":" omg ";
		}
		int result4 = attendDao.mp_attend_delete(stu_idx);	//�⼮ ���� ����
		System.out.println("result4:"+result4);
		msg+=result4>0? " delete attend ":" omg ";
		ModelAndView mav = new ModelAndView("masterpage/mp_member/mp_member_msg","msg",msg);
		return mav;
	}
	@RequestMapping("/mp_teacher_delete.do")
	public ModelAndView mp_teacher_delete(int tea_idx){
		int result = teacherDao.mp_teacher_delete(tea_idx);	//������ ���� ����
		int result2 = classDao.mp_c_delete(tea_idx);	//���� ���� ����
		String msg = result>0? " delete teacher ":" omg ";
		msg += result2>0? " delete class ":" omg ";
		ModelAndView mav = new ModelAndView("masterpage/mp_member/mp_member_msg","msg",msg);
		return mav;
	}
	@RequestMapping("/mp_parent_delete.do")
	public ModelAndView mp_parent_delete(int par_idx){
		int result = parentDao.mp_parent_delete(par_idx);
		String msg = result>0? "delete parent":"omg";
		ModelAndView mav = new ModelAndView("masterpage/mp_member/mp_member_msg","msg",msg);
		return mav;
	}
	*/

	@RequestMapping("/mp_member_msg.do")
	public ModelAndView mp_member_msg(StudentDTO sdto,TeacherDTO tdto, ParentDTO pdto){
		ModelAndView mav = new ModelAndView();
		String t=tdto.getTea_name();
		String s=sdto.getStu_name();
		String p=pdto.getPar_name();
		if(t==null && p==null){
			int result = studentDao.mp_student_add(sdto);
			String msg = result>0?"성공":"실패";
			mav.addObject("msg",msg);
			mav.setViewName("yongJson");
		}else if(s==null && p==null){
			int result = teacherDao.mp_teacher_add(tdto);
			String msg = result>0?"성공":"실패";
			mav.addObject("msg",msg);
			mav.setViewName("yongJson");
		}else if(s==null && t==null){
			int result = parentDao.mp_parent_add(pdto);
			String msg = result>0?"성공":"실패";
			mav.addObject("msg",msg);
			mav.setViewName("yongJson");
		}
		return mav;
	}
}
