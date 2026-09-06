package com.vruizart.portfolio.entity;

import jakarta.persistence.*;
import java.util.UUID;

@Entity
@Table(name = "artist_profile")
public class ArtistProfile extends BaseAuditableEntity {
    @Id
    @GeneratedValue
    private UUID id;

    @Column(nullable = false, length = 100)
    private String name;
    @Column(length = 150)
    private String subtitle;
    @Column(columnDefinition = "text")
    private String bio;
    @Column(columnDefinition = "text")
    private String statement;
    @Column(name = "profile_image_url", length = 255)
    private String profileImageUrl;
    @Column(name = "signature_image_url", length = 255)
    private String signatureImageUrl;
    @Column(length = 100)
    private String instagram;
    @Column(length = 100)
    private String facebook;
    @Column(length = 100)
    private String youtube;
    @Column(length = 150)
    private String email;

    public UUID getId() { return id; }
    public String getName() { return name; }
    public String getSubtitle() { return subtitle; }
    public String getBio() { return bio; }
    public String getStatement() { return statement; }
    public String getProfileImageUrl() { return profileImageUrl; }
    public String getSignatureImageUrl() { return signatureImageUrl; }
    public String getInstagram() { return instagram; }
    public String getFacebook() { return facebook; }
    public String getYoutube() { return youtube; }
    public String getEmail() { return email; }
}
