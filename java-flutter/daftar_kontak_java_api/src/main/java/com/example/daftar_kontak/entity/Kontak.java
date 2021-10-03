package com.example.daftar_kontak.entity;

import javax.persistence.*;

@Table(name = "kontak")
@Entity
public class Kontak {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "nama")
    private String nama;

    @Column(name = "no_handphone")
    private String noHandphone;

    @Column(name = "email")
    private String email;

    public Kontak() {
    }

    public Kontak(Long id, String nama, String noHandphone, String email) {
        this.id = id;
        this.nama = nama;
        this.noHandphone = noHandphone;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNoHandphone() {
        return noHandphone;
    }

    public void setNoHandphone(String noHandphone) {
        this.noHandphone = noHandphone;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}