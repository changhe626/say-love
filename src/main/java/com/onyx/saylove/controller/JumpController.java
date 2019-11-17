package com.onyx.saylove.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JumpController {

    private final static String DIR = "love/";

    @GetMapping("chengcheng")
    public String cheng() {
        return DIR + "chengcheng";
    }


}
