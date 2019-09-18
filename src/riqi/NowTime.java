package riqi;
import java.util.Date;
import java.text.SimpleDateFormat;

public class NowTime {
	public static String nowtime() 
	{ 
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM");//设置日期格式
		return df.format(new Date());
	}

}