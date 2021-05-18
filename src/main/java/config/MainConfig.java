package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import review.Pagination;
import review.ReviewDao;
import review.ReviewVO;

@Configuration
@EnableWebMvc
public class MainConfig {
	
	@Autowired
	private DataSource dataSource;
	
	@Bean
	public ReviewDao reviewDao() {
		return new ReviewDao(dataSource);
	}
	
	@Bean
	public ReviewVO reviewVO() {
		return new ReviewVO();
	}
	
	@Bean
	public Pagination pagination() {
		return new Pagination();
	}

}
