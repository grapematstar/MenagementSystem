package gyum_02.mp_academyStatus.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import gyum_02.commons.testMode;

public class mp_SalesDAOImple implements mp_SalesDAO {
	
	private SqlSessionTemplate sqlMap;

	public mp_SalesDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List mpSalesAllList(int cp, int listSize) {
		HashMap map = new HashMap();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		if(testMode.mode){
			ArrayList<mp_SalesDTO> arr = new ArrayList<mp_SalesDTO>();
			for(int i=startNum-1, j=0; i<endNum && i<testMode.salesTotalNum; i++, j++){
				int i_e_idx = i+1;
				int i_e_money = 1000*i_e_idx;
				Date i_e_date = new Date();
				Date i_e_r_date = new Date();
				String i_e_content = "뒷돈"+i_e_idx;
				int mas_idx = i+1;
				String i_e_in_out = i_e_idx*3%2==0?"in":"out";
				
				mp_SalesDTO dto = new mp_SalesDTO(i_e_idx,
						i_e_date, i_e_r_date, i_e_money,
						mas_idx, i_e_in_out, i_e_content);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpSalesList", map);
		}
	}

	public List mpSalesInList(int cp, int listSize) {
		HashMap map = new HashMap();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("i_e_in_out", "in");
		if(testMode.mode){
			ArrayList<mp_SalesDTO> arr = new ArrayList<mp_SalesDTO>();
			for(int i=startNum-1; i<endNum && i<testMode.salesInTotalNum; i++){
				int i_e_idx = i+1;
				int i_e_money = 1000*i_e_idx;
				Date i_e_date = new Date();
				Date i_e_r_date = new Date();
				String i_e_content = "받은 뒷돈"+i_e_idx;
				int mas_idx = i+1;
				String i_e_in_out = "in";
				
				mp_SalesDTO dto = new mp_SalesDTO(i_e_idx,
						i_e_date, i_e_r_date, i_e_money,
						mas_idx, i_e_in_out, i_e_content);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpSalesInList", map);
		}
	}

	public List mpSalesOutList(int cp, int listSize) {
		HashMap map = new HashMap();
		
		int startNum = (cp-1)*listSize+1;
		int endNum = cp*listSize;
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("i_e_in_out", "out");
		if(testMode.mode){
			ArrayList<mp_SalesDTO> arr = new ArrayList<mp_SalesDTO>();
			for(int i=startNum-1; i<endNum && i<testMode.salesOutTotalNum; i++){
				int i_e_idx = i+1;
				int i_e_money = 1000*i_e_idx;
				Date i_e_date = new Date();
				Date i_e_r_date = new Date();
				String i_e_content = "준 뒷돈"+i_e_idx;
				int mas_idx = i+1;
				String i_e_in_out = "out";
				
				mp_SalesDTO dto = new mp_SalesDTO(i_e_idx,
						i_e_date, i_e_r_date, i_e_money,
						mas_idx, i_e_in_out, i_e_content);
				arr.add(dto);
			}
			return arr;
		}else{
			return sqlMap.selectList("mpSalesOutList", map);
		}
	}

	public int mpSalesTotalCnt() {
		if(testMode.mode){
			return testMode.salesTotalNum;
		}else{
			return sqlMap.selectOne("mpSalesTotalCnt");
		}
	}
	
	public int mpSalesInTotalCnt() {
		if(testMode.mode){
			return testMode.salesInTotalNum;
		}else{
			return sqlMap.selectOne("mpSalesInTotalCnt", "in");
		}
	}

	public int mpSalesOutTotalCnt() {
		if(testMode.mode){
			return testMode.salesOutTotalNum;
		}else{
			return sqlMap.selectOne("mpSalesOutTotalCnt", "out");
		}
	}

}
