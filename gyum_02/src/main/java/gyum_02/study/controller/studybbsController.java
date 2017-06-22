package gyum_02.study.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.study.model.*;

@Controller
public class studybbsController {
   @Autowired
   private createStudyDAO createStudyDao;
   @Autowired
   private memberStudyDAO memberSDao;
   @Autowired
   private bbsnameStudyDAO bbsnameSDao;
   @Autowired
   private leaderStudyDAO leaderSDao;
   @Autowired
   private study_bbsDAO studybbsDao;
   @Autowired
   private votebbsDAO vbbsDao;
   @Autowired
   private voteconListDAO vclDao;
   @Autowired
   private voterDAO voterDao;
   @Autowired
   private filebbsDAO filebbsDao;
   @Autowired
   private fileuploadDAO fileuploadDao;
   
   @RequestMapping("/study_bbscontentgo.do")
   public ModelAndView study_bbscontentgo(int study_bbsidx,HttpSession session){
      session.setAttribute("study_bbsidx",study_bbsidx);
      List<study_bbsDTO> bbslist=studybbsDao.study_bbscontent(study_bbsidx);   
      session.setAttribute("bsssun", bbslist.get(0).getStudy_bbssunbun());
      ModelAndView mav=new ModelAndView();      
      
      int study_idx=(Integer)session.getAttribute("study_idx");
      int study_bbsref=bbslist.get(0).getStudy_bbsref();
      System.out.println("ref"+study_bbsref);
      session.setAttribute("study_bbsref", study_bbsref);
      study_bbsDTO study_bbsdto=new study_bbsDTO();
      study_bbsdto.setStudy_idx(study_idx);
      study_bbsdto.setStudy_bbsref(study_bbsref);
      bbsnameStudyDTO bbsnamedto=new bbsnameStudyDTO(study_idx, "-", study_bbsref);
      
      String study_bbsname=bbsnameSDao.bbsnameget(bbsnamedto);
      if(study_bbsname==null){
         mav.addObject("study_bbsname","Study Place");
      }else{
         mav.addObject("study_bbsname",study_bbsname);
      }   
      
      mav.addObject("bbsc",bbslist.get(0));
      mav.setViewName("study/studybbs_content");            
      return mav;      
   }
   @RequestMapping("/study_bbsadd.do")
   public ModelAndView study_bbsadd(study_bbsDTO dto,HttpSession session){
      int study_idx=(Integer)session.getAttribute("study_idx");
      int study_bbsref=(Integer)session.getAttribute("study_bbsref");
      String name=(String)session.getAttribute("name");      
      dto.setStudy_idx(study_idx);
      dto.setStu_name(name);
      dto.setStudy_bbsref(study_bbsref);
      studybbsDao.study_bbsinsert(dto);
      ModelAndView mav=new ModelAndView();         
      mav.setViewName("yongJson");      
      return mav;
   }
   @RequestMapping("/studyreplyList.do")
   public ModelAndView studyreplyList(HttpSession session){
      int study_idx=(Integer)session.getAttribute("study_idx");
      int study_bbsref=(Integer)session.getAttribute("study_bbsref");
      int bsssun=(Integer)session.getAttribute("bsssun");
      study_bbsDTO bbsdto=new study_bbsDTO();
      bbsdto.setStudy_idx(study_idx);
      bbsdto.setStudy_bbsref(study_bbsref);      
      bbsdto.setStudy_bbssunbun(bsssun);
      List<study_bbsDTO> replylist=studybbsDao.study_bbsreply(bbsdto);   
      ModelAndView mav=new ModelAndView();      
      mav.addObject("reply",replylist);
      mav.setViewName("yongJson");            
      return mav;   
   }

   @RequestMapping("/study_replyadd.do")
   public ModelAndView study_replyadd(study_bbsDTO dto,HttpSession session){      
      int study_idx=(Integer)session.getAttribute("study_idx");
      int study_bbsref=(Integer)session.getAttribute("study_bbsref");
      int bsssun=(Integer)session.getAttribute("bsssun");
      String name=(String)session.getAttribute("name");   
      dto.setStudy_bbssunbun(bsssun);
      dto.setStudy_idx(study_idx);
      dto.setStu_name(name);
      dto.setStudy_bbsref(study_bbsref);
      studybbsDao.study_replyinsert(dto);
      ModelAndView mav=new ModelAndView();      
      mav.setViewName("yongJson");            
      return mav;   
   }

   @RequestMapping("/votego.do")
   public ModelAndView votego(HttpSession session,int study_voteidx,int study_votebbsidx,int aleadyvote){      
      ModelAndView mav=new ModelAndView();      
      String id=(String)session.getAttribute("id");
      int idx=(Integer)session.getAttribute("idx");
      System.out.println(study_voteidx+" /// "+study_votebbsidx+" /// "+aleadyvote);
      if(aleadyvote<0){
         
      }else{
         int count=voterDao.voter_cancel(aleadyvote,study_votebbsidx,id);         
         count+=vclDao.vote_cancel(aleadyvote,study_votebbsidx);
      }      
      int result=vclDao.updatevotenum(study_voteidx);
      voterDao.voterinsert(study_voteidx,study_votebbsidx,idx,id);
    
      mav.setViewName("yongJson");            
      return mav;   
   }
  
   
   @RequestMapping("/getvoteList.do")
   public ModelAndView study_votelist(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
      int study_idx=(Integer)session.getAttribute("study_idx");
      int total=vbbsDao.study_votebbs_gettotal(study_idx);
      int votebbsgo_check=(Integer)session.getAttribute("votebbsgo_check");
      if(votebbsgo_check==0){
      int cp_s=(Integer)session.getAttribute("study_votebbs_cp");     
      	cp=cp_s;
      }
      if(total==0){
          total=1;
       }
       int ls=15;
        int ps=10;
        session.setAttribute("study_votebbs_cp", cp);     
        session.setAttribute("votebbsgo_check", 1);
        String page=study_paging.pageMake("votelist", total, ls, ps, cp);
      List<votebbsDTO> vbldto=vbbsDao.getvotebbsList(study_idx,cp,ls);
      ModelAndView mav=new ModelAndView();      
      mav.addObject("votebbslist",vbldto);
      mav.addObject("page",page);
      mav.setViewName("yongJson");            
      return mav;   
   }
   
   @RequestMapping("/study_filebbsList.do")
   public ModelAndView study_filebbsList(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session){
      ModelAndView mav = new ModelAndView();
      int study_idx=(Integer)session.getAttribute("study_idx");
      int total=filebbsDao.study_filebbs_gettotal(study_idx);
      int filebbsgo_check=(Integer)session.getAttribute("filebbsgo_check");
      if(filebbsgo_check==0){
    	int cp_s=(Integer)session.getAttribute("study_filebbs_cp");
    	cp=cp_s;
      }      
      
      if(total==0){
          total=1;
       }
       int ls=15;
        int ps=10;
        session.setAttribute("study_filebbs_cp", cp);
             
	      session.setAttribute("filebbsgo_check", 1);
        String page=study_paging.pageMake("filebbslist", total, ls, ps, cp);
      List<filebbsDTO> list=filebbsDao.getfilebbsList(study_idx,cp,ls);
      mav.addObject("page",page);
      mav.addObject("list",list);
      mav.setViewName("yongJson");
      return mav;
   }
   
   
   @RequestMapping("/votebbsadd.do")
   public ModelAndView votebbsadd(){
      ModelAndView mav=new ModelAndView();   
      mav.setViewName("yongJson");            
      return mav;   
   }
   @RequestMapping("/study_bbsvote_add.do")
   public ModelAndView studybbsvoteadd(String vote_con,String vote_sub,String stu_id,voteconListDTO vcldto,HttpSession session){
      int study_idx=(Integer)session.getAttribute("study_idx");
      votebbsDTO vbdto=new votebbsDTO(0, study_idx, 0, stu_id, stu_id, vote_sub, vote_con, 0, 0,0,1,null);      
      int study_votebbsidx=vbbsDao.votebbsinsert(vbdto);
      
      System.out.println("stubybbscontroller 130: "+study_votebbsidx);
      for(int i=0;i<vcldto.getVoteconlist().size();i++){      
         if(vcldto.getVoteconlist().get(i).getStudy_votecontent()!=null&&!(vcldto.getVoteconlist().get(i).getStudy_votecontent().equals(""))){         
            vcldto.getVoteconlist().get(i).setStudy_idx(study_idx);
            vcldto.getVoteconlist().get(i).setStudy_votebbsidx(study_votebbsidx);
            vcldto.getVoteconlist().get(i).setStudy_votenum(0);
            vclDao.voteconListinsert(vcldto.getVoteconlist().get(i));
         }
      }
      ModelAndView mav=new ModelAndView();   
      mav.setViewName("yongJson");            
      return mav;   
   }
      @RequestMapping("/studybbsvotecontent.do")
      public ModelAndView studybbsvotecontent(int study_votebbsidx,HttpSession session){
         votebbsDTO vbdto=vbbsDao.getvotecon(study_votebbsidx);      
         session.setAttribute("votebbssunbun",vbdto.getStudy_votebbssunbun());
         ModelAndView mav=new ModelAndView();      
         mav.addObject("vbdto",vbdto);
         mav.setViewName("study/studyvotebbs_content");            
         return mav;   
      }
   @RequestMapping("/voteconlist.do")
   public ModelAndView voteconlist(int study_votebbsidx,HttpSession session){
      int study_idx=(Integer)session.getAttribute("study_idx");
      String id=(String)session.getAttribute("id");   
      List<voteconStudyDTO> vcldto=vclDao.getvoteconlist(study_idx,study_votebbsidx);
      int check=0;      
      ModelAndView mav=new ModelAndView();
      for(int i=0;i<vcldto.size();i++){
         int Study_votebbsidx=vcldto.get(i).getStudy_votebbsidx();
         List<voterDTO> voterlist=voterDao.getvoterstu_id(Study_votebbsidx,id);
         if(voterlist.size()>0){
            check=voterlist.get(0).getStudy_voteidx();
            mav.addObject("check",check);
            break;
         }
      }
      mav.addObject("vcldto",vcldto);
      mav.setViewName("yongJson");            
      return mav;   
   }
   

   @RequestMapping("/study_filebbs.do")
   public ModelAndView study_filebbs(HttpSession session,filebbsDTO fdto,@RequestParam("upload")List<MultipartFile> upload){
   
      ModelAndView mav = new ModelAndView();
      int study_idx=(Integer)session.getAttribute("study_idx");
      String stu_name=(String)session.getAttribute("name");   
      filebbsDTO dto=new filebbsDTO(0, study_idx,fdto.getStu_id(), stu_name, fdto.getStudy_filebbssubject(), fdto.getStudy_filebbscontent(), 0, 0, 0, 0, null);      
      int result = filebbsDao.makelistfilebbs(dto);
      fileuploadDTO fldto=new fileuploadDTO(0, study_idx, result,null, null);
      if(result>0){//疫뀐옙占쎈쾺疫꿸퀗占� 占쎄쉐�⑤벏釉�筌롫똻�뒄
         
         fileUploadMulti(fldto,upload);//占쎈솁占쎌뵬占쎈즲 占쏙옙占쎌삢占쎌뱽 占쎈막�댆�눘肉됵옙�뒄
      }
   
      mav.setViewName("study/study_filebbs");
      return mav;
   }
   //占쎈뼄餓ο옙 占쎈씜嚥≪뮆諭�!!!!!�몴占� 獄쏆룇釉섓옙占� 餓λ씭�빍占쎈뼄.
   public void fileUploadMulti(fileuploadDTO fldto,List<MultipartFile> upload){      
      for(MultipartFile temp:upload){
      ;
         copy_Into(fldto,temp);
      }      
   }

   /*占쎈뼄占쎌젫 占쎈솁占쎌뵬占쎌뱽 癰귣벊沅쀯옙鍮� 雅뚯눖�뮉 筌롫뗄�꺖占쎈굡*/
   public void copy_Into(fileuploadDTO fldto,MultipartFile upload){      
   
      String fname=fldto.getStudy_idx()+"-"+fldto.getS_f_filebbssunbun();
      try {
         byte bytes[] = upload.getBytes();      
         File F = new File("c:/upload/"+fname);   
         if(!F.exists()){
            F.mkdir();
         }
         File outFile = new File("c:/upload/"+fname+"/"+upload.getOriginalFilename()); //占쎌쁽 占쎌뵠占쎌젫 占쎈쨨占쎈쐭繹먮슣占� 筌띾슢諭억옙堉� 餓Ρ딆몵占쎈빍 �룯占� 野껋럥以덄몴占� 占쎈르占쎈땾 占쎌뿳野껋쥙吏�?
         FileOutputStream fos = new FileOutputStream(outFile);   //占쎌쁽 占쎌뵠占쎌젫 域뱄옙 占쎈솁占쎌뵬占쎌뱽 揶쏉옙筌욑옙�⑨옙 
         fos.write(bytes);   //癰귣벊沅쀯옙釉�
         fos.close();   //占쎌쁽占쎌뜚甕곌쑬�뵝 占쎄국
      } catch (IOException e) {
         e.printStackTrace();
      }
      fldto.setS_f_filename(upload.getOriginalFilename());
      fldto.setS_f_filepath("c:/upload/"+fname+"/"+upload.getOriginalFilename());
      fileuploadDao.study_fileupload_insert(fldto);
      System.out.println("");
       
   }   
   
   
   
   /*疫뀐옙 占쎄땀占쎌뒠占쎌몵嚥∽옙 占쎌뵠占쎈짗*/
   @RequestMapping("/study_filebbsContent.do")
   public ModelAndView study_filebbsContentgo(int study_filebbsidx,HttpSession session){
      ModelAndView mav = new ModelAndView();
      filebbsDTO dto = filebbsDao.getfilebbsContent(study_filebbsidx);
      session.setAttribute("filebbssunbun",dto.getStudy_filebbssunbun());
      session.setAttribute("study_idx", dto.getStudy_idx());
      String fname=dto.getStudy_idx()+"-"+dto.getStudy_filebbssunbun();
      File f = new File("c:/upload/"+fname);   //占쎈쨨占쎈쐭占쎌벥 占쎌젟癰귨옙
      File files[] = f.listFiles();   //域뱄옙 占쎈쨨占쎈쐭占쎌벥 �뵳�딅뮞占쎈뱜�몴占� 獄쏆꼹�넎 獄쏆룆�뮉占쎈뼄.
      
      mav.addObject("files",files);      
      mav.addObject("dto",dto);
      mav.setViewName("study/study_filebbsContent");
      return mav;
   }
   /*野껊슣�뻻疫뀐옙 占쎈땾占쎌젟*/
   @RequestMapping("/study_filebbsupdate.do")
   public ModelAndView study_filebbsupdate(filebbsDTO dto){
      ModelAndView mav = new ModelAndView();
      int result=filebbsDao.study_filebbsupdate(dto);

      mav.setViewName("yongJson");
      return mav;
   }
   
   /*野껊슣�뻻疫뀐옙 獄쏉옙 占쎈솊疫뀐옙 占쎄텣占쎌젫*/
   @RequestMapping("/study_filebbsdel.do")
   public ModelAndView study_filebbsdel(int study_filebbsidx){
      ModelAndView mav = new ModelAndView();
      int result=filebbsDao.study_filebbsdel(study_filebbsidx);
   
      mav.setViewName("yongJson");
      return mav;
   }
   /*占쎈솊疫뀐옙 筌뤴뫖以� �겫�뜄�쑎占쎌궎疫뀐옙*/
   @RequestMapping("/study_filebbs_replyList.do")
   public ModelAndView study_filebbs_replyList(HttpSession session,int bbssb){
      int study_idx=(Integer)session.getAttribute("study_idx");
      System.out.println("study_idx:"+study_idx);
      int filebbssunbun=(Integer)session.getAttribute("filebbssunbun");
      filebbsDTO dto=new filebbsDTO();
      dto.setStudy_idx(study_idx);
      dto.setStudy_filebbssunbun(filebbssunbun);
      System.out.println(dto.getStudy_filebbssunbun());
      List<filebbsDTO> replylist=filebbsDao.getstudy_filebbsreply(dto);   
      ModelAndView mav=new ModelAndView();      
      mav.addObject("reply",replylist);
      mav.setViewName("yongJson");            
      return mav;   
   }
   /*占쎈솊疫뀐옙�빊遺쏙옙*/
   @RequestMapping("/study_filebbs_replyadd.do")
   public ModelAndView study_filebbs_replyadd(filebbsDTO dto,HttpSession session){      
      int study_idx=(Integer)session.getAttribute("study_idx");
      dto.setStudy_idx(study_idx);
      int fbsunbun=(Integer)session.getAttribute("filebbssunbun");
      dto.setStudy_filebbssunbun(fbsunbun);
      filebbsDao.makestudy_filebbsreply(dto);
      ModelAndView mav=new ModelAndView();   
      mav.setViewName("yongJson");            
      return mav;   
   }
   /*占쎈솊疫뀐옙 占쎈땾占쎌젟*/
   @RequestMapping("/study_filebbs_replyupdate.do")
   public ModelAndView study_filebbs_replyupdate(filebbsDTO dto){
      ModelAndView mav = new ModelAndView();   
      int result=filebbsDao.study_filebbsreplyupdate(dto);

      mav.setViewName("yongJson");
      return mav;
   }
   


   @RequestMapping("/down.do")
   public ModelAndView downloadFile(@RequestParam("filename")String filename,HttpSession session){
      String name=(Integer)session.getAttribute("study_idx")+"-"+(Integer)session.getAttribute("filebbssunbun");
      File f = new File("c:/upload/"+name+"/"+filename);
      ModelAndView mav = new ModelAndView("yongDown");
      mav.addObject("downloadFile",f);
      return mav;
   }
   
     
      /*�뿬湲곗뿬湲�*/
      @RequestMapping("/study_votebbs_replyList.do")
      public ModelAndView study_votebbs_replyList(HttpSession session,int bbssb){
         int study_idx=(Integer)session.getAttribute("study_idx");
         System.out.println("study_idx:"+study_idx);
         int votebbssunbun=(Integer)session.getAttribute("votebbssunbun");
         votebbsDTO dto=new votebbsDTO();
         dto.setStudy_idx(study_idx);
         dto.setStudy_votebbssunbun(votebbssunbun);
         System.out.println(dto.getStudy_votebbssunbun());
         List<votebbsDTO> replylist=vbbsDao.getstudy_votebbsreply(dto);   
         if(replylist.size()>0){
         System.out.println(replylist.get(0).getStu_name()+"/"+replylist.get(0).getStu_id());}
         ModelAndView mav=new ModelAndView();      
         mav.addObject("reply",replylist);
         mav.setViewName("yongJson");            
         return mav;   
      }
      /*占쏙옙占쏙옙煞占�*/
      @RequestMapping("/study_votebbs_replyadd.do")
      public ModelAndView study_votebbs_replyadd(votebbsDTO dto,HttpSession session){      
         int study_idx=(Integer)session.getAttribute("study_idx");
         dto.setStudy_idx(study_idx);
         int fbsunbun=(Integer)session.getAttribute("votebbssunbun");
         dto.setStudy_votebbssunbun(fbsunbun);
         System.out.println("ddddddddddddddddddddddd"+dto.getStu_name());
         vbbsDao.makestudy_votebbsreply(dto);
         ModelAndView mav=new ModelAndView();   
         mav.setViewName("yongJson");            
         return mav;   
      }
      /*占쏙옙占� 占쏙옙占쏙옙*/
      @RequestMapping("/study_votebbs_replyupdate.do")
      public ModelAndView study_votebbs_replyupdate(votebbsDTO dto){
         ModelAndView mav = new ModelAndView();   
         int result=vbbsDao.study_votebbsreplyupdate(dto);
      
         mav.setViewName("yongJson");
         return mav;
      }
      
      @RequestMapping("/study_votebbsdel.do")
      public ModelAndView study_votebbsdel(int study_votebbsidx){
         ModelAndView mav = new ModelAndView();
         int result=vbbsDao.study_votebbsdel(study_votebbsidx);
       
         mav.setViewName("yongJson");
         return mav;
      }
      
      @RequestMapping("/study_bbs_replyupdate.do")
      public ModelAndView study_bbs_replyupdate(study_bbsDTO dto){
         ModelAndView mav = new ModelAndView();   
         int result=studybbsDao.study_bbsreplyupdate(dto);
        
         mav.setViewName("yongJson");
         return mav;
      }
      
      @RequestMapping("/study_bbsdel.do")
      public ModelAndView study_bbsdel(int study_bbsidx){
         ModelAndView mav = new ModelAndView();
         int result=studybbsDao.study_bbsdel(study_bbsidx);
     
         mav.setViewName("yongJson");
         return mav;
      }
}