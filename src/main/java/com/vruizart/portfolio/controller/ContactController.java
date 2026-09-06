package com.vruizart.portfolio.controller;

import com.vruizart.portfolio.dto.ContactMessageRequest;
import com.vruizart.portfolio.dto.ContactMessageResponse;
import com.vruizart.portfolio.service.ContactService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/public/contact")
public class ContactController {
    private final ContactService service;

    public ContactController(ContactService service) { this.service = service; }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ContactMessageResponse create(@Valid @RequestBody ContactMessageRequest request) {
        return service.create(request);
    }
}
