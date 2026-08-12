package com.example.camelstarter;

import org.apache.camel.builder.RouteBuilder;
import org.springframework.stereotype.Component;

@Component
public class MyRoute extends RouteBuilder {

    @Override
    public void configure() throws Exception {
        from("timer:hello-java?period=5000")
                .setBody().constant("Hello World from Camel!")
                .to("log:myLogger?showAll=true&multiline=true");
    }
}