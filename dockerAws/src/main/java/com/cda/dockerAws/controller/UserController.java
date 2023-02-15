package com.cda.dockerAws.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

   @GetMapping("/")
    public  String index() {
       System.out.println("hello");
       return  "index";
   }



}
