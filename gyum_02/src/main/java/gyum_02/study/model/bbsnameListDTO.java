package gyum_02.study.model;

import java.util.List;

public class bbsnameListDTO {
	private List<bbsnameStudyDTO> bbsnameStudyDTO;

	public bbsnameListDTO() {
		super();
	}

	public bbsnameListDTO(List<gyum_02.study.model.bbsnameStudyDTO> bbsnameStudyDTO) {
		super();
		this.bbsnameStudyDTO = bbsnameStudyDTO;
	}

	public List<bbsnameStudyDTO> getBbsnameStudyDTO() {
		return bbsnameStudyDTO;
	}

	public void setBbsnameStudyDTO(List<bbsnameStudyDTO> bbsnameStudyDTO) {
		this.bbsnameStudyDTO = bbsnameStudyDTO;
	}
	
	
}
