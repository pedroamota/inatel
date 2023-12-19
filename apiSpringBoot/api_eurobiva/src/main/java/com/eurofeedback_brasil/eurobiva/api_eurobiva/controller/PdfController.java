package com.eurofeedback_brasil.eurobiva.api_eurobiva.controller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

@RestController
@RequestMapping("/pdf")
public class PdfController {

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED) //Seguindo especificações de codigo do HTTP
    public ResponseEntity<String> upload(@RequestParam MultipartFile file){
        String path = "C:/Users/Administrador/Documents/Eurobiva/file.pdf";
        try{
            Files.copy(file.getInputStream(), Path.of(path), StandardCopyOption.REPLACE_EXISTING);
            return new ResponseEntity<>(path, HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<>("ERRO!", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
