package gyum_02.Freebbs.model;

import java.util.List;

public interface FreebbsDAO {
	
	public List<FreebbsDTO> freebbsList(int cp, int ls);
	public List<FreebbsDTO> freebbsReply(int cp, int ls, int idx);
	public int getTotal();
	public int getTotalRep(int idx);
	public FreebbsDTO freebbsContent(int idx);
	public int freebbsWrite(FreebbsDTO dto);
	public int freebbsDel(int idx);
	public int read(int idx);
	public List pageMove(int idx);
	public int freebbsUpdate(FreebbsDTO dto);
}
