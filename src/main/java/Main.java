import java.time.LocalTime;

public class Main {
	public static void main(String args[]){
		String message;
		int hour = LocalTime.now().getHour();
		if (hour < 12) {
		    message = "Good morning, Vishal, Welcome to COMP367";
		} else {
		    message = "Good afternoon, Vishal, Welcome to COMP367";
		}

		}
}
