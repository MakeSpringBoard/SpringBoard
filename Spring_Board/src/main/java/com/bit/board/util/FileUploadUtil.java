package com.bit.board.util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploadUtil {

	private final ServletContext servletContext;

    @Autowired
    public FileUploadUtil(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String saveFile(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            return null;
        }

        String originalFilename = file.getOriginalFilename();
        String uploadPath = servletContext.getRealPath("/resources/images/");
        Path targetLocation = Paths.get(uploadPath).resolve(originalFilename);
        Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

        return "/resources/images/" + originalFilename;
    }
}

