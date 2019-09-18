package dao;

import java.util.List;
import model.Platform;

public interface IPlatformDao {
	public void add(Platform platform);
	public void delete(int id);
	public void update(Platform platform);
	public Platform load(int id);
	public Platform load(String platformid);
	public Platform load(String platformid,String password);
	public List<Platform> load( String plaformtech,String platformjibie,String jingjinji,String gongjiandujian); 
	public int load1(String plaformtech);
	public List<Platform> load();
	public List<Platform> load2(String plaformtech);
	public List<Platform> load3(String plaformadress);
	public List<Platform> load4(String sql1);
}
