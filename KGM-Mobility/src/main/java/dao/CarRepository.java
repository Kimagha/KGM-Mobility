package dao;

import java.util.ArrayList;

import dto.Car;

public class CarRepository {
	
	private ArrayList<Car> listOfCars=new ArrayList<Car>();
	
	private static CarRepository instance=new CarRepository();
	
	public static CarRepository getInstance() {
		return instance;
	}
	
	public void addCar(Car car) {
		listOfCars.add(car);
	}
	
	
	 public Car getCarById(String carId) { Car carById=null;
	 
	 for (int i=0; i < listOfCars.size(); i++) { Car car=listOfCars.get(i); if
	 (car!=null && car.getCarId()!=null && car.getCarId().equals(carId)) {
	 carById=car; break; } } return carById; }
	 
	/*
	 * public Car getCarById(String carId) { Car car = null;
	 * 
	 * Connection conn = null; PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * try { conn = DBUtil.getConnection(); // dbconn.jsp 내용에 해당하는 연결 String sql =
	 * "SELECT * FROM car WHERE c_carId = ?"; pstmt = conn.prepareStatement(sql);
	 * pstmt.setString(1, carId); rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) { car = new Car( rs.getString("c_carId"),
	 * rs.getString("c_name"), rs.getInt("c_unitPrice") );
	 * car.setEngine(rs.getString("c_engine"));
	 * car.setReleaseDate(rs.getString("c_releaseDate"));
	 * car.setFilename(rs.getString("c_filename")); // 필요 시 컬럼 추가 }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { try { if (rs !=
	 * null) rs.close(); } catch (Exception e) {} try { if (pstmt != null)
	 * pstmt.close(); } catch (Exception e) {} try { if (conn != null) conn.close();
	 * } catch (Exception e) {} }
	 * 
	 * return car; }
	 */

	
	public CarRepository() {
		Car car1= new Car("CAR0001","토레스", 32900000);
		car1.setOutColor(new String[] {"블랙"});
		car1.setInColor(new String[] {"화이트"});
		car1.setMotor(new String[] {"2WD"});
		car1.setOption(new String[] {"하이패스"});
		car1.setEngine("가솔린");
		car1.setReleaseDate("2025/12/12");
		car1.setFilename("CAR0001.png");
		
		Car car2 = new Car("CAR0002", "엑티언", 33950000);
		car2.setOutColor(new String[] {"블랙"});
		car2.setInColor(new String[] {"화이트"});
		car2.setMotor(new String[] {"AWD"});
		car2.setOption(new String[] {"터치스크린 내비게이션"});
		car2.setEngine("가솔린");
		car2.setReleaseDate("2025/12/12");
		car2.setFilename("CAR0002.png");
		
		Car car3 = new Car("CAR0003", "티볼리", 19000000);
		car3.setOutColor(new String[] {"블랙"});
		car3.setInColor(new String[] {"화이트"});
		car3.setMotor(new String[] {"2WD"});
		car3.setOption(new String[] {"애플 카플레이"});
		car3.setEngine("가솔린");
		car3.setReleaseDate("2025/12/12");
		car3.setFilename("CAR0003.png");
		
		listOfCars.add(car1);
		listOfCars.add(car2);
		listOfCars.add(car3);
		
		
	}
	public ArrayList<Car> getAllCars(){
		return listOfCars;
	}
}
