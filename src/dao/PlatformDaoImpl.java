package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import util.DBUtil;
import util.UserException;

import model.Platform;

public class PlatformDaoImpl implements IPlatformDao
{

	public void add(Platform platform) {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select count(*) from t_user where platformid = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, platform.getPlatformid());
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("平台已存在") ;
				}
			}
			
			sql = "insert into t_user(platformid,password,platformname,platformtechnology,platformpizhunnum,platformdate) values (?,?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,platform.getPlatformid());
			preparedStatement.setString(2,platform.getPassword());
			preparedStatement.setString(3,platform.getPlatformname());
			preparedStatement.setString(4,platform.getPlatformtechnology());
			preparedStatement.setString(5,platform.getPlatformpizhunnum());
			preparedStatement.setString(6,platform.getPlatformdate());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	public void delete(int id) {
		// TODO 自动生成的方法存根
		
	}

	public void update(Platform platform) {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "update t_user set platformid=?, password=? ,platformname=? , platformdate=? , platformpizhunnum=? , platformtechnology=? , platformjibie=? , platformadress=? , platformxingtai=? , gongjiandujian=? , jingjinji=? , jingjihangye=? , mainxueku=? , danweiname=? , danweidaima=? , danweifaren=? , danweiphone=? , danweileixing=? , gongjiandanwei=? , yzname=? , yzsex=? , yzbirth=? , yzzhicheng=? , yzzhuanye=? , yzxueli=? , yzxuewei=? , yzphonenum=? , yzofficialnum=? , yzemail=? , platwebname=? , webadress=? , tongxunadress=? , youbian=? where id=?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, platform.getPlatformid());
			preparedStatement.setString(2, platform.getPassword());
			preparedStatement.setString(3, platform.getPlatformname());
			preparedStatement.setString(4, platform.getPlatformdate());
			preparedStatement.setString(5, platform.getPlatformpizhunnum());
			preparedStatement.setString(6, platform.getPlatformtechnology());
			preparedStatement.setString(7, platform.getPlatformjibie());
			preparedStatement.setString(8, platform.getPlatformadress());
			preparedStatement.setString(9, platform.getPlatformxingtai());
			preparedStatement.setString(10, platform.getGongjiandujian());
			preparedStatement.setString(11, platform.getJingjinji());
			preparedStatement.setString(12, platform.getJingjihangye());
			preparedStatement.setString(13, platform.getMainxueku());
			preparedStatement.setString(14, platform.getDanweiname());
			preparedStatement.setString(15, platform.getDanweidaima());
			preparedStatement.setString(16, platform.getDanweifaren());
			preparedStatement.setString(17, platform.getDanweiphone());
			preparedStatement.setString(18, platform.getDanweileixing());
			preparedStatement.setString(19, platform.getGongjiandanwei());
			preparedStatement.setString(20, platform.getYzname());
			preparedStatement.setString(21, platform.getYzsex());
			preparedStatement.setString(22, platform.getYzbirth());
			preparedStatement.setString(23, platform.getYzzhicheng());
			preparedStatement.setString(24, platform.getYzzhuanye());
			preparedStatement.setString(25, platform.getYzxueli());
			preparedStatement.setString(26, platform.getYzxuewei());
			preparedStatement.setString(27, platform.getYzphonenum());
			preparedStatement.setString(28, platform.getYzofficialnum());
			preparedStatement.setString(29, platform.getYzemail());
			preparedStatement.setString(30, platform.getPlatwebname());
			preparedStatement.setString(31, platform.getWebadress());
			preparedStatement.setString(32, platform.getTongxunadress());
			preparedStatement.setString(33, platform.getYoubian());
			preparedStatement.setInt(34, platform.getId());
			
			System.out.println("id"+platform.getId());
			
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}

	public Platform load(int id) {
		// TODO 自动生成的方法存根
		return null;
	}

	public Platform load(String platformid) {
		// TODO 自动生成的方法存根
		return null;
	}

	public Platform load(String platformid, String password) {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from t_user  where platformid = ?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Platform platform = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, platformid);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				platform = new Platform();
				platform.setId(resultSet.getInt("id"));
				platform.setPlatformid(resultSet.getString("platformid"));				
				platform.setPassword(resultSet.getString("password"));
				platform.setPlatformtechnology(resultSet.getString("platformtechnology"));
				platform.setPlatformname(resultSet.getString("platformname"));
				platform.setPlatformpizhunnum(resultSet.getString("platformpizhunnum"));
				platform.setPlatformdate(resultSet.getString("platformdate"));
			}
			if (platform == null) {
				throw new UserException("平台不存在");
			}
			if(!password.equals(platform.getPassword().trim()))
			{
				throw new UserException("密码不正确");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  platform;
	}

	public List<Platform> load( String plaformtech,String platformjibie,String jingjinji,String gongjiandujian) {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		
		String sql = "select * from t_user where platformtechnology =? and platformjibie =? and jingjinji =? and gongjiandujian =?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<Platform> platforms = new ArrayList<Platform>();
		Platform platform = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,plaformtech);
			preparedStatement.setString(2,platformjibie);
			preparedStatement.setString(3,jingjinji);
			preparedStatement.setString(4,gongjiandujian);
			System.out.println(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				platform = new Platform();
				platform.setId(resultSet.getInt("id"));
				platform.setPlatformid(resultSet.getString("platformid"));
				platform.setPlatformname(resultSet.getString("platformname"));
				platform.setPassword(resultSet.getString("password"));
				platform.setPlatformdate(resultSet.getString("platformdate"));
				platform.setPlatformpizhunnum(resultSet.getString("platformpizhunnum"));
				platform.setPlatformtechnology(resultSet.getString("platformtechnology"));
				platforms.add(platform);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  platforms;
	}
	public List<Platform> load() {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		String sql = "select * from t_user ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<Platform> platforms = new ArrayList<Platform>();
		Platform platform = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				platform = new Platform();
				platform.setId(resultSet.getInt("id"));
				platform.setPlatformid(resultSet.getString("platformid"));
				platform.setPlatformname(resultSet.getString("platformname"));
				platform.setPassword(resultSet.getString("password"));
				platform.setPlatformdate(resultSet.getString("platformdate"));
				platform.setPlatformpizhunnum(resultSet.getString("platformpizhunnum"));
				platform.setPlatformtechnology(resultSet.getString("platformtechnology"));
				platforms.add(platform);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  platforms;
	}

	public int load1(String plaformtech) {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		int n=0;
		//准备sql语句
		String sql = "select count(*) from t_user where platformtechnology =?";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, plaformtech);
			//接收结果集
			resultSet = preparedStatement.executeQuery();
			//遍历结果集
			while(resultSet.next()) {
				n=resultSet.getInt(1);
			}
			n=resultSet.getInt(1);
		   System.out.println(n);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭资源
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return n;
	}

	public List<Platform> load2(String plaformtech) {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		
		String sql = "select * from t_user where platformtechnology =? ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<Platform> platforms = new ArrayList<Platform>();
		Platform platform = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,plaformtech);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				platform = new Platform();
				platform.setId(resultSet.getInt("id"));
				platform.setPlatformid(resultSet.getString("platformid"));
				platform.setPlatformname(resultSet.getString("platformname"));
				platform.setPassword(resultSet.getString("password"));
				platform.setPlatformdate(resultSet.getString("platformdate"));
				platform.setPlatformpizhunnum(resultSet.getString("platformpizhunnum"));
				platform.setPlatformtechnology(resultSet.getString("platformtechnology"));
				platforms.add(platform);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  platforms;
	}

	public List<Platform> load3(String platformadress) {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		
		String sql = "select * from t_user where platformadress =? ";
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<Platform> platforms = new ArrayList<Platform>();
		Platform platform = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1,platformadress);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				platform = new Platform();
				platform.setId(resultSet.getInt("id"));
				platform.setPlatformid(resultSet.getString("platformid"));
				platform.setPlatformname(resultSet.getString("platformname"));
				platform.setPassword(resultSet.getString("password"));
				platform.setPlatformdate(resultSet.getString("platformdate"));
				platform.setPlatformpizhunnum(resultSet.getString("platformpizhunnum"));
				platform.setPlatformtechnology(resultSet.getString("platformtechnology"));
				platforms.add(platform);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  platforms;
	}

	public List<Platform> load4(String sql1) {
		// TODO 自动生成的方法存根
		Connection connection = DBUtil.getConnection();
		//准备sql语句
		
		String sql = "select * from t_user where "+sql1;
		System.out.println(sql);
		//创建语句传输对象
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		//集合中只能放入user对象
		List<Platform> platforms = new ArrayList<Platform>();
		Platform platform = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				platform = new Platform();
				platform.setPlatformid(resultSet.getString("platformid"));
				platform.setPlatformname(resultSet.getString("platformname"));
				platform.setPassword(resultSet.getString("password"));
				platform.setPlatformdate(resultSet.getString("platformdate"));
				platform.setPlatformjibie(resultSet.getString("platformjibie"));
				platform.setJingjinji(resultSet.getString("jingjinji"));
				platform.setGongjiandujian(resultSet.getString("gongjiandujian"));
				platform.setPlatformtechnology(resultSet.getString("platformtechnology"));
				platforms.add(platform);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  platforms;
	}

	

}
