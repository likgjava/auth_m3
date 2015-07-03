package com.likg.framework;

import java.lang.reflect.Method;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;

import com.likg.framework.annotation.DataSource;

/**
 * 实现动态切换数据源的切面
 * @author likaige
 * @create 2015年7月3日 下午3:27:34
 */
public class DataSourceAspect {
	
	private static Logger log = Logger.getLogger(DataSourceAspect.class);
	
	public void beforeDaoMethod(JoinPoint point) {
		Object target = point.getTarget();
		MethodSignature methodSignature = (MethodSignature) point.getSignature();
		String methodName = methodSignature.getName();

		Class<?>[] classz = target.getClass().getInterfaces();
		Class<?>[] parameterTypes = methodSignature.getMethod().getParameterTypes();
		try {
			Method m = classz[0].getMethod(methodName, parameterTypes);
			if (m != null && m.isAnnotationPresent(DataSource.class)) {
				DataSource data = m.getAnnotation(DataSource.class);
				DynamicDataSource.setRoute(data.value());
				System.out.println(data.value());
			}
		} catch (Exception e) {
			log.error(e);
		}
	}

}
