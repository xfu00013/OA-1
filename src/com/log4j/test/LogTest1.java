package com.log4j.test;

import org.apache.log4j.Logger;

public class LogTest1 {

	public static void main(String[] args) {
		Logger logger = Logger.getLogger(LogTest1.class);
		
		logger.debug("debug test");
		logger.info("info test");
		logger.warn("warn test");
		logger.error("error test");
		logger.fatal("fatal test");
	}

}
