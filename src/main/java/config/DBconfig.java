package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.MainController;

@Configuration
public class DBconfig {
		//db 연결 셋팅
		@Bean(destroyMethod = "close")
		public DataSource dataSource() {
			DataSource ds = new DataSource();
			ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
			ds.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
			ds.setUsername("test");
			ds.setPassword("1234");
			ds.setInitialSize(10);
			ds.setMaxActive(1000);
			ds.setTestWhileIdle(true);
			ds.setMinEvictableIdleTimeMillis(60000 * 3);
			ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
			return ds;
	}
		
	@Bean
	public MainController mainController() {
		return new MainController();
	}
}


