package config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {

	@Override
	public void configureDefaultServletHandling(
			DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {	//controller에서 받아온 데이터 값을 registry에 저장하고
		registry.jsp("/WEB-INF/view/", ".jsp");	//registry.jsp라는 자체적으로 있는 메서드를 이용해 (앞쪽 경로 , 뒤쪽경로)를 설정해주고 해당하는 jsp파일을 open
													//이러면 주소창에는 안나오지만 실제 경로는 기본주소/WEB-INF/views/test/test.jsp의 jsp파일이 실행 됨
	}
}
