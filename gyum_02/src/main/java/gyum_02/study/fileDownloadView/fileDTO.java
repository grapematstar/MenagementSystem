package gyum_02.study.fileDownloadView;
import org.springframework.web.multipart.MultipartFile;

public class fileDTO {
	private String writer;
	private MultipartFile upload;
	
	public fileDTO() {
		super();
	}
	
	public fileDTO(String writer, MultipartFile upload) {
		super();
		this.writer = writer;
		this.upload = upload;
	}
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
	
}
