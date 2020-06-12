package org.zerock.aop;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class SampleAdvice {
	private static final Logger logger = LoggerFactory.getLogger(SampleAdvice.class);
	
	@Before("execution(* org.zerock.service.MessageService*.*(..))")
	public void startLog(JoinPoint jp) {
		logger.info("zxczxczxc");
		logger.info(jp.getSignature().toString());	//�޼ҵ� ���� ���
		logger.info(jp.getTarget().toString()); //target��ü ��� MessageServiceImpl���
		logger.info(jp.getThis().toString());
		logger.info(Arrays.toString(jp.getArgs()));
	}
	
	@Around("execution(* org.zerock.service.MessageService*.*(..))")
	public Object around(ProceedingJoinPoint pjp) throws Throwable {
		logger.info("===========================");
		
		Object result = pjp.proceed();
		
		logger.info("===================== =====");
		return result;
	}
}
 