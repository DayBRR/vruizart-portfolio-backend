package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "contact_message")
public class ContactMessage {
    @Id @GeneratedValue
    private UUID id;
    @Column(nullable = false, length = 100)
    private String name;
    @Column(nullable = false, length = 150)
    private String email;
    @Column(length = 150)
    private String subject;
    @Column(nullable = false, columnDefinition = "text")
    private String message;
    @Column(name = "is_read", nullable = false)
    private boolean read = false;
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    protected ContactMessage() {}

    public ContactMessage(String name, String email, String subject, String message) {
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
    }

    @PrePersist
    void prePersist() { if (createdAt == null) createdAt = LocalDateTime.now(); }

    public UUID getId() { return id; }
}
