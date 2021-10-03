package com.example.daftar_kontak.payload;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
public class KontakRest {

    private Long id;

    private String nama;

    @JsonProperty("no_hp")
    private String noHandphone;

    private String email;

    public KontakRest(Long id, String nama, String noHandphone, String email) {
        this.id = id;
        this.nama = nama;
        this.noHandphone = noHandphone;
        this.email = email;
    }
}