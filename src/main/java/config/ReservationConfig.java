package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import controller.ReservationController;
import reservation.ReservationDao;

@Configuration
@EnableTransactionManagement
public class ReservationConfig {

	@Autowired
	private DataSource dataSource;
	
	@Bean
	//dataSource소스의 메서드를 의존받아 ReservationDao객체 생성
	public ReservationDao reservationDao(){
		return new ReservationDao(dataSource);
	}
	
	@Bean
	//ReservationController생성자 생성
	public ReservationController reservationController() {
		return new ReservationController(reservationDao());
	}
	
	
}
