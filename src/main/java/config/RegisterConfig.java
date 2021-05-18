package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import controller.RegisterController;
import register.RegisterDao;

@Configuration
@EnableTransactionManagement
public class RegisterConfig {

	@Autowired
	private DataSource dataSource;
	
	@Bean
	//dataSource소스의 메서드를 의존받아 RegisterDto객체 생성
	public RegisterDao registerDao(){
		return new RegisterDao(dataSource);
	}
	
	@Bean
	//RegisterController생성자 생성
	public RegisterController registerController() {
		return new RegisterController(registerDao());
	}
	
	
}
