package gyum_02.sugang.model;


import java.text.ParseException;
import java.util.List;

public interface SgPaymentDAO {

	public List<SgPaymentDTO> sgPaymentList(int stu_idx);
	public List<SgPaymentDTO> sgPaymentFavorList(int stu_idx);
	public int sgPaymentInsert(int stu_idx,List<String> arrayParam);
	public int sgPaymentIncomeInsert(int income, String context);
	public int sgPaymentExpendInsert(int expend, String context);
	public int sgPaymentDelete(int stu_idx,List<String> arrayParam);
	public int sgTotalPrice(int stu_idx,List<String> arrayParam);
	public int sgReturnDate(int class_startdate) throws ParseException;
	public int sgReturnPayment(int class_price, int differenceday);
	
	public int sgPaymentStartDate(int class_idx);
	public int sgPaymentClassPrice(int class_idx);
	public List<SgPaymentDTO> sgcheckedPaymentList(int stu_idx, List<String> arrayParam);
	
}
