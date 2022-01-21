package org.convertator;

import org.convertator.view.MainView;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ConvertatorApplication {
//@Deprecated("ddd")
    public static void main(String[] args) {
    	int i=0;
    	
    	
        SpringApplication.run(ConvertatorApplication.class, args);
        MainView view = new MainView();
        view.setVisible(true);
    }


}
