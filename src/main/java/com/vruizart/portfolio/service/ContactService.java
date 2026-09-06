package com.vruizart.portfolio.service;

import com.vruizart.portfolio.dto.ContactMessageRequest;
import com.vruizart.portfolio.dto.ContactMessageResponse;
import com.vruizart.portfolio.entity.ContactMessage;
import com.vruizart.portfolio.repository.ContactMessageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ContactService {

    private final ContactMessageRepository repository;

    @Transactional
    public ContactMessageResponse create(ContactMessageRequest request) {
        ContactMessage saved = repository.save(new ContactMessage(
                request.name().trim(),
                request.email().trim(),
                request.subject() == null ? null : request.subject().trim(),
                request.message().trim()
        ));

        return new ContactMessageResponse(
                saved.getId(),
                "Mensaje recibido correctamente"
        );
    }
}
