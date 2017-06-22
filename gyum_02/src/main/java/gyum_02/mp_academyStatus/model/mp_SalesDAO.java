package gyum_02.mp_academyStatus.model;

import java.util.*;

public interface mp_SalesDAO {
	public int mpSalesTotalCnt();
	public int mpSalesInTotalCnt();
	public int mpSalesOutTotalCnt();
	public List mpSalesAllList(int cp, int listSize);
	public List mpSalesInList(int cp, int listSize);
	public List mpSalesOutList(int cp, int listSize);
}
