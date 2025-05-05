package com.olawale.renderapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RenderController {
    @GetMapping("hello")
    public String sayhello(){
        return "Hello from render based stringboot app";
    }
}
