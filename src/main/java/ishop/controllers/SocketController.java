package ishop.controllers;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

@Controller
public class SocketController {
    @MessageMapping("/admin")
    @SendTo("/")
    public String greeting(String message) throws Exception {
        Thread.sleep(1000); // simulated delay
        return new String("/");


        //TODO
    }
}
