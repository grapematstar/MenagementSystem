package gyum_02.study.model;

import java.util.List;

public class voteconListDTO {
	private List<voteconStudyDTO> voteconlist;

	public voteconListDTO() {
		super();
	}

	public voteconListDTO(List<voteconStudyDTO> voteconlist) {
		super();
		this.voteconlist = voteconlist;
	}

	public List<voteconStudyDTO> getVoteconlist() {
		return voteconlist;
	}

	public void setVoteconlist(List<voteconStudyDTO> voteconlist) {
		this.voteconlist = voteconlist;
	}
	
}
