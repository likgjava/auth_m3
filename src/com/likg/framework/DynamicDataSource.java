package com.likg.framework;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {
	
	public static final String MASTER = "master";
	public static final String SLAVE = "slave";
	
	//利用ThreadLocal解决线程安全问题
	private static ThreadLocal<String> local = new ThreadLocal<String>();

	@Override
	protected Object determineCurrentLookupKey() {
		String dataSource = local.get();
		if(dataSource == null){
			dataSource = MASTER;
		}
		setRoute(MASTER); //还原到主库
		return dataSource;
	}
	
	
	public static void setRoute(String route) {
		if (route == null || route.equals("")) {
			route = MASTER;
		}
		local.set(route);
	}
	
	public static Object getRoute() {
		return local.get();
	}

	public static void remoteRoute() {
		local.remove();
	}

}
