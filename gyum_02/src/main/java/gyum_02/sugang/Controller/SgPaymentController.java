package gyum_02.sugang.Controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gyum_02.member.model.My_memberStudentDAO;
import gyum_02.sugang.model.ReturnPayDTO;
import gyum_02.sugang.model.SgFavorDAO;
import gyum_02.sugang.model.SgFavorDTO;
import gyum_02.sugang.model.SgPaymentDAO;
import gyum_02.sugang.model.SgPaymentDTO;
import gyum_02.sugang.model.StudentInfoDTO;
import gyum_02.sugang.model.SugangDAO;
import gyum_02.sugang.model.SugangDTO;

@Controller
public class SgPaymentController {

	@Autowired
	private SugangDAO sugangDao;
	
	@Autowired
	private SgPaymentDAO sgPaymentDao;
	
	//결제리스트 컨트롤러
	@RequestMapping(value="/sg_payment.do",method=RequestMethod.GET)
	public ModelAndView sgPaymentList(HttpSession sgsession){
		ModelAndView mav = new ModelAndView();
		String id = (String)sgsession.getAttribute("id");
		if(!(id==null||id.equals(""))){
			String usergrade = (String)sgsession.getAttribute("usergrade");
			if(usergrade.equals("student")||usergrade.equals("master")){
				if(usergrade.equals("student")){
					int user_idx = sugangDao.userIdxSearch(id);
					List<SgPaymentDTO> sgPaymentList = sgPaymentDao.sgPaymentList(user_idx);
					List<StudentInfoDTO> stuList = sugangDao.stuList(id);
					mav.addObject("sgPaymentList", sgPaymentList);
					mav.addObject("stuList", stuList);
					mav.setViewName("sugang/sg_payment");
				} else {
					List<SgPaymentDTO> sgPaymentList = null;
					List<StudentInfoDTO> stuList = null;
					
					mav.addObject("sgPaymentList", sgPaymentList);
					mav.addObject("stuList", stuList);
					mav.setViewName("sugang/sg_payment");
				}
			} else {
				mav.addObject("msg", "학생 또는 관리자만 접근 가능합니다.");
				mav.addObject("locationOrder", "index.do");
				mav.setViewName("sugang/sgMsg");
			}
		} else {
			mav.addObject("msg", "로그인이 필요합니다.");
			mav.addObject("locationOrder", "index.do");
			mav.setViewName("sugang/sgMsg");
		}
		return mav;
	}
	
	//최종결제리스트 컨트롤러
	@RequestMapping(value="/sg_paymentFi.do",method=RequestMethod.GET)
	public ModelAndView sgPaymentFinalList(HttpSession sgsession,
			@RequestParam(value="checkboxValues[]",defaultValue="nolist")List<String> arrayParam) throws ParseException{
		System.out.println("checkboxvalues:"+arrayParam.size());
		ModelAndView mav = new ModelAndView();
		String id = (String)sgsession.getAttribute("id");
		if(!(id==null||id.equals(""))){
			String usergrade = (String)sgsession.getAttribute("usergrade");
			if(usergrade.equals("student")||usergrade.equals("master")){
				if(usergrade.equals("student")){
					int user_idx = sugangDao.userIdxSearch(id);
					List<SgPaymentDTO> sgPaymentList = sgPaymentDao.sgcheckedPaymentList(user_idx, arrayParam);
					List<StudentInfoDTO> stuList = sugangDao.stuList(id);
					List<ReturnPayDTO> discountPriceList = new ArrayList<ReturnPayDTO>();
					for(int i=0;i<arrayParam.size();i++){
						int class_idx = Integer.parseInt(arrayParam.get(i));
						int class_nprice = sgPaymentDao.sgPaymentClassPrice(Integer.parseInt(arrayParam.get(i)));
						System.out.println("class_nprice : "+class_nprice);
						int cstartdate = sgPaymentDao.sgPaymentStartDate(class_idx);
						int differenceday = sgPaymentDao.sgReturnDate(cstartdate);
						int payment = sgPaymentDao.sgReturnPayment(class_nprice, differenceday);
						ReturnPayDTO rdto = new ReturnPayDTO();
						rdto.setPayment(payment);
						discountPriceList.add(i, rdto);
					}
					mav.addObject("sgPaymentList", sgPaymentList);
					mav.addObject("stuList", stuList);
					mav.addObject("dcPriceList", discountPriceList);
					mav.setViewName("sugang/sg_paymentFinal");
				} else {
					List<SgPaymentDTO> sgPaymentList = null;
					List<StudentInfoDTO> stuList = null;
					List<ReturnPayDTO> discountPriceList = null;
					
					mav.addObject("sgPaymentList", sgPaymentList);
					mav.addObject("stuList", stuList);
					mav.addObject("dcPriceList", discountPriceList);
					mav.setViewName("sugang/sg_paymentFinal");
				}
				
			} else {
				mav.addObject("msg", "학생 또는 관리자만 접근 가능합니다.");
				mav.addObject("locationOrder", "index.do");
				mav.setViewName("sugang/sgMsg");
			}
		} else {
			mav.addObject("msg", "로그인을 요청합니다.");
			mav.addObject("locationOrder", "index.do");
			mav.setViewName("sugang/sgMsg");
		}
		return mav;
	}
	
	//결제취소 컨트롤러
	@RequestMapping(value="/sg_paymentDel.do", method=RequestMethod.GET)
	public ModelAndView sgPaymentDelete(HttpSession sgsession,
			@RequestParam(value="listValues[]", defaultValue="0")List<String> paramList,
			@RequestParam(value="context", defaultValue="con")String context){
		String id = (String)sgsession.getAttribute("id");
		int user_idx=sugangDao.userIdxSearch(id);
		int totalPrice = sgPaymentDao.sgTotalPrice(user_idx, paramList);
		sgPaymentDao.sgPaymentExpendInsert(totalPrice, context);
		sgPaymentDao.sgPaymentDelete(user_idx, paramList);
		ModelAndView mav = sgPaymentList(sgsession);
		return mav;
	}
	
	//장바구니 결제 컨트롤러
	@RequestMapping(value="/sg_paymentIns.do", method=RequestMethod.GET)
	public ModelAndView sgPaymentInsert(HttpSession sgsession,
			@RequestParam(value="listValues[]",defaultValue="noList")List<String> arrayParam){
		if(arrayParam.equals("noList")){
			ModelAndView mav = new ModelAndView();
			String msg = "List is Nothing";
			mav.addObject("msg", msg);
			mav.addObject("locationOrder", "sg_payment.do");
			mav.setViewName("sugang/sgMsg");
			return mav;
		}else{
			System.out.println("paylist출력 : "+arrayParam);
			String id = (String)sgsession.getAttribute("id");
			int user_idx=sugangDao.userIdxSearch(id);
			sgPaymentDao.sgPaymentInsert(user_idx, arrayParam);
			ModelAndView mav = sgPaymentList(sgsession);
			return mav;
		}
	}
	
	//장바구니 결제 컨트롤러(->결제DB에 넣기)
	@RequestMapping(value="/sg_paymentIns.do", method=RequestMethod.POST)
	public ModelAndView sgPaymentDbInsert(HttpSession sgsession,
			@RequestParam(value="totalPrice",defaultValue="0")int totalPrice,
			@RequestParam(value="context", defaultValue="con")String context){
		System.out.println("총 수강료 출력 : "+totalPrice);
		System.out.println("비고 내용 출력 : "+context);
		sgPaymentDao.sgPaymentIncomeInsert(totalPrice, context);
		ModelAndView mav = sgPaymentList(sgsession);
		return mav;
	}
	
	//결제창 오픈 컨트롤러
	@RequestMapping(value="/sg_paymentview.do",method=RequestMethod.GET)
	public ModelAndView sgPaymentView(HttpSession sgsession){
		String id = (String)sgsession.getAttribute("id");
		int user_idx = sugangDao.userIdxSearch(id);
		List<SgPaymentDTO> sgPaymentFavorList = sgPaymentDao.sgPaymentFavorList(user_idx);
		List<StudentInfoDTO> stuList = sugangDao.stuList(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("sgPaymentFavorList", sgPaymentFavorList);
		mav.addObject("stuList", stuList);
		mav.setViewName("sugang/sg_paymentSub");
		return mav;
	}
	
}
