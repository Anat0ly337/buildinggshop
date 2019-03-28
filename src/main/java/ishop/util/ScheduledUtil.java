package ishop.util;

import org.springframework.stereotype.Component;

import java.util.Calendar;
import java.util.Date;

@Component
public class ScheduledUtil {
    @org.springframework.scheduling.annotation.Scheduled(fixedDelay = 4900)
    public void run(){
        Calendar calendar = Calendar.getInstance();
        if (Constants.calendars.size()==0){

            Constants.calendars.put(calendar.getTime(),1);
        }
        System.out.println("Schedule class"+""+ new Date());
        Constants.ipCount++;
        System.out.println(Constants.ipCount);


        if (calendar.getTime().getMinutes()==45 && calendar.getTime().getSeconds() == 0) {
            Constants.calendars.put(calendar.getTime(),Constants.ipCount);

            Constants.ipCount=0;
        }
        System.out.println(Constants.calendars);
    }
}
