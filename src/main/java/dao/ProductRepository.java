package dao;

import java.util.ArrayList;

import dto.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private ArrayList<Product> listOfBestProducts = new ArrayList<Product>();
	private ArrayList<Product> listAll = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance() {
		return instance;
	}

	public ProductRepository() {
		Product travel = new Product("T13013", "두바이+이집트 8일 나일강 크루즈 + 고급 호텔 + 쇼핑 + 유명 관광지 총집합", 1999000);
		travel.setDescription("23년01월20일 ~ 23년01월27일 두바이 + 이집트 여행" + "<br>" +"숙소: 호텔 ASIANA(두바이), 카이로(RAMSES HILTON)" + "<br>" + "대표여행: 나일강 크루즈 2박, 쇼핑, 관광지 튜어, 두바이 불꽃축제");
		travel.setCategory("BEST");
		travel.setTravelPlace("두바이, 이집트");
		travel.setUnitsInStock(20);
		travel.setDuration(8);
		travel.setContinent("아시아, 아프리카");
		travel.setFilename("dubai.jpg");

		Product travel1 = new Product("T14223", "시드니 5박6일 힐링 여행, 블루마운틴+ 라파로스 + 바랑가루 핫플 + 레져스포츠", 2300200);
		travel1.setDescription("22년 12월 28일 ~ 23년 01월 03일 시드니 자유 여행" + "<br>" +"숙소: 4성급 호텔 예약" + "<br>" + "대표여행: 사막투어 + 블루 마운틴 + 라파로스 관광");
		travel1.setCategory("BEST");
		travel1.setTravelPlace("호주");
		travel1.setUnitsInStock(12);
		travel1.setDuration(6);
		travel1.setContinent("오세아니아");
		travel1.setFilename("sydney.jpg");

		Product travel2 = new Product("T15232", "동유럽 6국 13일 대한항공 + 박물관 + 맛집 + 오페라 + 인기 유럽국 + 자유 여행  + 크리스마스", 2500000);
		travel2.setDescription("22년 12월23일 ~ 01월05일 동유럽 인기 6국"  + "<br>" +"숙소: 3성~4성 호텔 예약" + "<br>" + "대표여행: 비엔나 음악회, 프라하 시티투어, 부다페스트 야간 유람선, 독일 맥주 투어, 폴란드 유대인 장소, 네덜란드 홍등가");
		travel2.setCategory("BEST");
		travel2.setTravelPlace("오스트리아, 체코, 헝가리, 독일, 폴란드, 네덜란드");
		travel2.setUnitsInStock(22);
		travel2.setDuration(13);
		travel2.setContinent("유럽");
		travel2.setFilename("europe.jpg");
		

		
		
		listOfBestProducts.add(travel);
		listOfBestProducts.add(travel1);
		listOfBestProducts.add(travel2);
		listAll.addAll(listOfProducts);
		listAll.addAll(listOfBestProducts);
	}

	public void addProduct(Product product) {
		if (product.getCategory().equals("BEST")) {
			listOfBestProducts.add(product);
		} else {
			listOfProducts.add(product);
		}

	}

	public Product getProductById(String productId) {
		Product productById = null;
		for (int i = 0; i < listAll.size(); i++) {
			Product product = listAll.get(i);
			if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		return productById;
	}

	public ArrayList<Product> getAllProducts() {
		return listAll;
	}

	public ArrayList<Product> getAllNewProducts() {
		return listOfProducts;
	}

	public ArrayList<Product> getAllBestProducts() {
		return listOfBestProducts;
	}
}
