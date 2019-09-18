package Init;

import dao.PlatformDaoImpl;
import riqi.NowTime;
import model.Platform;

public class Initdata {
	public static void main(String[] args)
	{
		Platform platform =new Platform();
		PlatformDaoImpl platformDaoImpl=new PlatformDaoImpl();
		int j;
		for(int i=2;i<200;i++)
		{
			platform.setPlatformid("user"+i);
			platform.setPlatformname("user"+i+"");
			String technology=null;
			j=i%3;
			if(j==0)
				technology="重点实验室";
			if(j==1)
				technology="工程技术研究中心";
			if(j==2)
				technology="产业技术研究院";
		    platform.setPlatformtechnology(technology);
		 	platform.setPassword(i+"");
		 	platform.setPlatformdate(NowTime.nowtime());
		 	platform.setPlatformpizhunnum(i+"");
		 	 String platformjibie=null;
		 	j=i%2;
			if(j==0)
				platformjibie="国家级";
			if(j==1)
				platformjibie="省级";
			platform.setPlatformjibie(platformjibie);
			 String gongjiandujian=null;
			 	j=i%2;
				if(j==1)
					gongjiandujian="国家级";
				if(j==0)
					gongjiandujian="省级";
				platform.setGongjiandujian(gongjiandujian);
				 String jingjinji=null;
				 	j=i%2;
					if(j==0)
						jingjinji="国家级";
					if(j==1)
						jingjinji="省级";
					platform.setJingjinji(jingjinji);
				
		 	platformDaoImpl.add(platform);
		}
	}

}
