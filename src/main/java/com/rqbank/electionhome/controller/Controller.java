package com.rqbank.electionhome.controller;

import com.rqbank.eelection.config.msgloader.Messages;
import com.rqbank.electionhome.service.ElectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;

@org.springframework.stereotype.Controller
public class Controller {
    @Value("${docBase}")
    String docBase;

    @Autowired
    ElectionService electionService;

    @RequestMapping(value = "/terms", method = RequestMethod.GET)
    public String terms(Model model) {
        return "terms";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String loadPage(Model model,@RequestParam(value = "error",required = false)String error) {
        if ("FILENOTFOUND".equals(error))
            model.addAttribute("errorMessage", "File Not Found");
        model.addAttribute("elections", electionService.getAllActives());
        return "index";
    }

    public static void main(String []args){
        System.out.println(Messages.getMessage("FileNotFound","fa"));
    }

    @RequestMapping(value = "/files", method = RequestMethod.GET)
    public String download(HttpServletResponse response, @RequestParam("filename")String filename) {
        try {
            File file = new File(docBase + "" + filename);
            FileInputStream fileIn = new FileInputStream(file);
            ServletOutputStream out = response.getOutputStream();
            byte[] outputByte = new byte[4096];
            while (fileIn.read(outputByte, 0, 4096) != -1) {
                out.write(outputByte, 0, 4096);
            }
            fileIn.close();
            out.flush();
            out.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/?error=FILENOTFOUND";
    }
}
