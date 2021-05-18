package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import QnABoard.BoaredCheck;
import QnABoard.QnABoardDao;
import QnABoard.QnABoardVO;
import controller.QnAController;

@Configuration
@EnableTransactionManagement
public class QnABoardConfig {


	@Autowired
	private DataSource dataSource;
	
	@Bean
	//dataSource소스의 메서드를 의존받아 QnABoardDto객체 생성
	public QnABoardDao qnaBoardDao(){

		return new QnABoardDao(dataSource);	//생성자 생성
	}
	
	//QnAController객체 생성 qnaBoardDao의존
	@Bean
	public	QnAController qnaController() {
		QnAController qnaController = new QnAController(qnaBoardDao());	//생성자 생성
		return qnaController;
	}

	//BoaredCheck객체 생성
	@Bean
	public	BoaredCheck boaredCheck() {
		BoaredCheck boaredCheck = new BoaredCheck();	//생성자 생성
		return boaredCheck;
	}

	//BoaredCheck객체 생성
	@Bean
	public	QnABoardVO qnaBoardVO() {
		QnABoardVO qnaBoardVO = new QnABoardVO();	//생성자 생성
		return qnaBoardVO;
	}
	
}
