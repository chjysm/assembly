package dto;

public class VisitDTO {
	private String visitDate;
	private int visitCount;
	
	public VisitDTO(String visitDate, int visitCount) {
		super();
		this.visitDate = visitDate;
		this.visitCount = visitCount;
	}
	
	public VisitDTO() {
	}

	public String getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}
	public int getVisitCount() {
		return visitCount;
	}
	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	
	
	
	
	
}
