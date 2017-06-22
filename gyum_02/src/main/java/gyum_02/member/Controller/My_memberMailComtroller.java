package gyum_02.member.Controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.member.model.My_memberParentDAO;
import gyum_02.member.model.My_memberStudentDAO;
import gyum_02.member.model.*;
@Controller
public class My_memberMailComtroller {

	@Autowired
	private My_memberStudentDAO My_memberDao1;
	@Autowired
	private My_memberParentDAO My_memberDao2;
	@Autowired
	private My_memberTeacherDAO My_memberDao3;
	
	@RequestMapping("emailAuth.do")
	public ModelAndView emailAuth(HttpServletResponse response,HttpServletRequest request,String email) throws Exception{
		
		
		String authNum = "";
		
		authNum = RandomNum();
		
		sendEmail(email.toString(), authNum);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("email", email);
		mav.addObject("authNum",authNum);
		mav.setViewName("mypage/my_member/my_memberEmailCheck");
		return mav;
	}
	private void sendEmail(String email,String authNum){
		String host = "smtp.gmail.com";
		String subject = "G.A 인증번호 전달";
		String fromName = "G.A 관리자";
		String from = "daehee919055@gmail.com";
		String to1 = email;
		
		String content = "인증번호 [" + authNum + "]";
		
		try{
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication("daehee919055","d!70eo85gml");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));
			
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Transport.send(msg);
		}catch (MessagingException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String RandomNum(){
		StringBuffer buffer = new StringBuffer();
		for(int i=0;i<=6;i++){
			int n = (int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	@RequestMapping("pwCheck.do")
	public ModelAndView PWCheck(HttpServletResponse response,HttpServletRequest request,String user_id,String user_email) throws Exception{
		
		String authNum = "";
		authNum = RandomNum();
		
		ModelAndView mav = new ModelAndView();
		String pwCheck = My_memberDao2.pwCheck(user_id, user_email);
		
		if(pwCheck==null){
			pwCheck = My_memberDao1.pwCheck(user_id, user_email);
			if(pwCheck==null){
				pwCheck =  My_memberDao3.pwCheck(user_id, user_email);
				String msg = "아이디 혹은 이메일이 틀립니다.";
				mav.addObject("msg", msg);
				mav.setViewName("mypage/my_member/my_pwCheckMsg");
			}
		}
		
		String email = user_email;
		if(pwCheck!=null){			
			pwCheck = authNum;
			My_memberStudentDTO dto = My_memberDao1.select_grade_id(user_id);
				
			if(dto.getUsergrade().equals("student")){
				int result = My_memberDao1.stu_pwCheck_up(user_id, pwCheck);
			}else if(dto.getUsergrade().equals("parent")){
				int result = My_memberDao2.par_pwCheck_up(user_id, pwCheck);
			}else{
				int result = My_memberDao3.tea_pwCheck_up(user_id, pwCheck);
			}
			
			pwd_Email(email.toString(), authNum.toString());
			
			mav.addObject("email", email);
			mav.addObject("authNum",authNum);
			mav.setViewName("mypage/my_member/my_memberLogin");
			return mav;
		}
		return mav;
	}
	private void pwd_Email(String email,String authNum){
		String host = "smtp.gmail.com";
		String subject = "G.A 비밀번호 전달";
		String fromName = "G.A 관리자";
		String from = "daehee919055@gmail.com";
		String to1 = email;
		
		String content = "비밀번호는 [" + authNum + "] 입니다.";
		
		try{
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication("daehee919055","d!70eo85gml");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText(fromName,"UTF-8","B")));
			
			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html;charset=euc-kr");
			
			Transport.send(msg);
		}catch (MessagingException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
