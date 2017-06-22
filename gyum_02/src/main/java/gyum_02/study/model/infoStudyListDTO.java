package gyum_02.study.model;

import java.util.List;

public class infoStudyListDTO {
	private List<infoStudyDTO> infoStudyDTO;

	public infoStudyListDTO() {
		super();
	}

	public infoStudyListDTO(List<gyum_02.study.model.infoStudyDTO> infoStudyDTO) {
		super();
		this.infoStudyDTO = infoStudyDTO;
	}

	public List<infoStudyDTO> getInfoStudyDTO() {
		return infoStudyDTO;
	}

	public void setInfoStudyDTO(List<infoStudyDTO> infoStudyDTO) {
		this.infoStudyDTO = infoStudyDTO;
	}
	
	
}
