package dto;

import java.io.Serializable;

public class Product implements Serializable {
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String productId;
	private String pname;
	private Integer unitPrice;
	private String description;
	private String travelPlace;
	private String category; //Best, Sale, Today, etc...
	private String continent;
	private long unitsInStock;
	private long duration;
	private String filename; //이미지 파일명 
	private int quantity;
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String productId, String pname, Integer unitPrice) {
		super();
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContinent() {
		return continent;
	}

	public void setContinent(String continent) {
		this.continent = continent;
	}

	public String getTravelPlace() {
		return travelPlace;
	}
	

	public void setTravelPlace(String travelPlace) {
		this.travelPlace = travelPlace;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getDuration() {
		return duration;
	}

	public void setDuration(long duration) {
		this.duration = duration;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	
}
