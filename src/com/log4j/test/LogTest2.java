package com.log4j.test;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class LogTest2 {

	public static void main(String[] args) {
		Log logger = LogFactory.getLog(LogTest2.class);
		
		logger.debug("debug test");
		logger.info("info test");
		logger.warn("warn test");
		logger.error("error test");
		logger.fatal("fatal test");
	}

}
