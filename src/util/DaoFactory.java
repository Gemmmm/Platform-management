package util;

import dao.PlatformDaoImpl;


public class DaoFactory {
	public static PlatformDaoImpl getDaoImpl() {
		return new PlatformDaoImpl();
	}

}
