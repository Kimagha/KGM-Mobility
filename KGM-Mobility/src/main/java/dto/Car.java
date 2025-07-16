package dto;

import java.io.Serializable;

public class Car implements Serializable {
	
	private static final long serialVersionUID=-4274700572038677000L;
	
	private String carId; // 자동차ID
	private String name; // 자동차 이름
	private int unitPrice; // 자동차 가격
	private String[] outColor; // 자동차 외부색상
	private String selectedOutColor; // 선택한 외부색상
	private String[] inColor; // 자동차 내부색상
	private String selectedInColor; // 선택한 내부색상
	private String[] motor; // 자동차 구동(모터)
	private String selectedMotor; // 선택한 모터
	private String[] option; // 자동차 옵션
	private String selectedOptions; // 선택한 옵션
	private String engine; // 자동차 엔진
	private String releaseDate; // 자동차 출고일
	private String filename;
	private int quantity;
	
	
	
	
	public String getSelectedInColor() {
		return selectedInColor;
	}

	public void setSelectedInColor(String selectedInColor) {
		this.selectedInColor = selectedInColor;
	}

	public String getSelectedMotor() {
		return selectedMotor;
	}

	public void setSelectedMotor(String selectedMotor) {
		this.selectedMotor = selectedMotor;
	}

	public String getSelectedOptions() {
		return selectedOptions;
	}

	public void setSelectedOptions(String selectedOptions) {
		this.selectedOptions = selectedOptions;
	}

	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity=quantity;
	}
	
	
	
	public String getFilename() {
		return filename;
	}
	
	public void setFilename(String filename) {
		this.filename=filename;
	}
	
	public Car() {
		super();
	}
	
	public Car(String carId, String name, Integer unitPrice) {
		this.carId=carId;
		this.name=name;
		this.unitPrice=unitPrice;
	}
	
	public String getCarId() {return carId;}
	
	public void setCarId(String carId) {
		this.carId=carId;
	}
	
	public String getName() {return name;} 
	
	public void setName(String name) {
		this.name=name;
	}
	
	public int getUnitPrice() {return unitPrice;}
	
	public void setUnitPrice(int unitPrice) {
		this.unitPrice=unitPrice;
	}
	
	public String[] getOutColor() {
	    return outColor;
	}

	public void setOutColor(String[] outColor) {
	    this.outColor = outColor;
	}
	
	public String getSelectedOutColor() {
	    return selectedOutColor;
	}

	public void setSelectedOutColor(String selectedOutColor) {
	    this.selectedOutColor = selectedOutColor;
	}
	
	public String[] getInColor() {return inColor;}
	
	public void setInColor(String[] inColor) {
		this.inColor=inColor;
	}
	
	public String[] getMotor() {return motor;}
	
	public void setMotor(String[] motor) {
		this.motor=motor;
	}
	
	public String[] getOption() {return option;}
	
	public void setOption(String[] option) {
		this.option=option;
	}
	
	public String getEngine() {return engine;}
	
	public void setEngine(String engine) {
		this.engine=engine;
	}
	
	public String getReleaseDate() {return releaseDate;}
	
	public void setReleaseDate(String releaseDate) {
		this.releaseDate=releaseDate;
	}
	
}

