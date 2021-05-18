package config;

import java.util.Properties;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import controller.LoginController;
import login.LoginDAO;
import login.OAuthToken;

@Configuration
@EnableWebMvc
public class LoginConfig {

	@Autowired
	private DataSource dataSource;
	
	@Bean
	public LoginController loginController() {
		return new LoginController();
	}
	
	@Bean
	public LoginDAO loginDAO() {
		return new LoginDAO(dataSource);
	}
	
	@Bean
	public OAuthToken qauthToken() {
		return new OAuthToken();
	}
	
	@Bean public static JavaMailSender mailSender(){
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587); // 구글 포트번호
		mailSender.setUsername("cocu7710@gmail.com"); // 관리자 구글 이메일 주소 내 아이디
		mailSender.setPassword("ehdals7712@"); // 관리자 구글 비밀번호	 내 비밀번호
		
		Properties javaMailProperties = new Properties();
		
		javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.debug", "true");
 
        mailSender.setJavaMailProperties(javaMailProperties);
        
		return mailSender;
	}

}
