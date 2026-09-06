package com.vruizart.portfolio.repository;

import com.vruizart.portfolio.entity.ContactMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.UUID;

public interface ContactMessageRepository extends JpaRepository<ContactMessage, UUID> {}
