package com.pwx.video_sharing.common.util.datasource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

public class DynamicDataSource extends AbstractRoutingDataSource {

    public static final String DATA_SOURCE_A = "dataSourceOne";
    public static final String DATA_SOURCE_B = "dataSourceTwo";
    private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();
    
    public static void setCustomerType(String customerType) {
        contextHolder.set(customerType);
    }

    public static String getCustomerType() {
        return contextHolder.get();
    }

    public static void clearCustomerType() {
        contextHolder.remove();
    }

    @Override
    protected Object determineCurrentLookupKey() {

            return getCustomerType();
    }
    
    
	/*@Override
	protected Object determineCurrentLookupKey() {
		return DatabaseContextHolder.getCustomerType();
	}*/

}