package gyum_02.sugang.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class SgPaymentDAOImple implements SgPaymentDAO {

	private SqlSessionTemplate sqlMap;
	private PreparedStatement ps;
	private ResultSet rs;

	
	public SgPaymentDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<SgPaymentDTO> sgPaymentList(int stu_idx) {
		System.out.println("student paymentList 인덱스:"+stu_idx);
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("stu_idx", stu_idx);
		List<SgPaymentDTO> sgPaymentList = sqlMap.selectList("sgPaymentList", forSubmit);
		System.out.println("DAOImpleList:"+sgPaymentList.size());
		return sgPaymentList;
	}
	
	public List<SgPaymentDTO> sgcheckedPaymentList(int stu_idx, List<String> arrayParam){
		List<SgPaymentDTO> sgcheckedPaymentList = new ArrayList<SgPaymentDTO>();
		
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("stu_idx", stu_idx);
		
		for(int i=0;i<arrayParam.size();i++){
			int class_idx = Integer.parseInt(arrayParam.get(i));
			forSubmit.put("class_idx", class_idx);
			SgPaymentDTO sdto = sqlMap.selectOne("sgSelectPaymentList", forSubmit);
			sgcheckedPaymentList.add(sdto);
		}
		return sgcheckedPaymentList;
	}
	
	public List<SgPaymentDTO> sgPaymentFavorList(int stu_idx) {
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("stu_idx", stu_idx);
		List<SgPaymentDTO> sgPaymentFavorList = sqlMap.selectList("sgPaymentFavorList", forSubmit);
		return sgPaymentFavorList;
	}

	public int sgPaymentInsert(int stu_idx, List<String> arrayParam) {
		int count = 0;
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("stu_idx", stu_idx);
		
		for(int i=0;i<arrayParam.size();i++){
			int class_idx = Integer.parseInt(arrayParam.get(i));
			forSubmit.put("class_idx", class_idx);
			if(sqlMap.selectList("payinsertchk", forSubmit).isEmpty()){
				count += sqlMap.insert("payFavorInsert", forSubmit);
				sqlMap.insert("payClassStuInsert", forSubmit);
			}
		}
		return count;
	}
	
	public int sgPaymentIncomeInsert(int income, String context){
		int count = 0;
		Map forSubmit = new HashMap();
		forSubmit.put("income", income);
		forSubmit.put("context", context);
		count += sqlMap.insert("payIncomInsert", forSubmit);
		return count;
	}
	
	public int sgPaymentExpendInsert(int expend, String context){
		int count = 0;
		Map forSubmit = new HashMap();
		forSubmit.put("expend", expend);
		forSubmit.put("context", context);
		count += sqlMap.insert("payExpendDelete", forSubmit);
		return count;
	}

	public int sgPaymentDelete(int stu_idx, List<String> arrayParam) {
		int count = 0;
		Map<String,Integer> forSubmit = new HashMap<String,Integer>();
		forSubmit.put("stu_idx", stu_idx);
		
		for(int i=0;i<arrayParam.size();i++){
			int class_idx = Integer.parseInt(arrayParam.get(i));
			forSubmit.put("class_idx", class_idx);
			count += sqlMap.delete("sgPaymentDelete", forSubmit);
			sqlMap.delete("payClassStuDelete", forSubmit);
		}
		
		return count;
	}
	
	public int sgTotalPrice(int stu_idx, List<String> arrayParam){
		int totalprice = 0;
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("stu_idx", stu_idx);
		for(int i=0;i<arrayParam.size();i++){
			int class_idx = Integer.parseInt(arrayParam.get(i));
			forSubmit.put("class_idx", class_idx);
			totalprice += Integer.parseInt(sqlMap.selectOne("sgTotalPrice", forSubmit).toString());
		}	
		return totalprice;
	}

	public int sgReturnDate(int class_startdate) throws ParseException{
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyyMMdd");
		
		String date = formatdate.format(new Date());
		
		Date begindate = formatdate.parse(String.valueOf(class_startdate));
		Date enddate = formatdate.parse(date);
		
		long difference = enddate.getTime() - begindate.getTime();

		long differencedays = difference / (24*60*60*1000);
		
		int returnday = (int)differencedays;
		System.out.println("Differ:"+returnday);
		return returnday;
	}
	
	public int sgReturnPayment(int class_price, int differenceday){
		
		int payment = 0;
		
		if(differenceday>3&&differenceday<=10){
			payment = class_price*3/4;

		}else if(differenceday<=3){
			payment = class_price*1;

		}else if(differenceday>10){
			payment = 0;

		}
		
		return payment;
	}
	
	public int sgPaymentStartDate(int class_idx){
		int start_date = 0;
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("class_idx", class_idx);
		start_date = sqlMap.selectOne("sgPaymentStartDate", forSubmit);
		System.out.println("START_DATE:"+start_date);
		return start_date;
	}
	
	public int sgPaymentClassPrice(int class_idx){
		int class_price = 0;
		Map<String, Integer> forSubmit = new HashMap<String, Integer>();
		forSubmit.put("class_idx", class_idx);
		class_price = sqlMap.selectOne("sgPaymentPrice", forSubmit);
		System.out.println("sgPaymentPrice:"+class_price);
		return class_price;
	}
	
}
