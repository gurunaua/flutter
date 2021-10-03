package com.example.daftar_kontak.controller;

import com.example.daftar_kontak.entity.Kontak;
import com.example.daftar_kontak.payload.KontakRest;
import com.example.daftar_kontak.payload.Rs;
import com.example.daftar_kontak.repo.KontakRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
public class KontakController {

    @Autowired
    KontakRepository repository;

    @GetMapping("/kontaks")
    public ResponseEntity<Object> getAllKontaks() {
        try {

            List<Kontak> kontaks = repository.findAll();

            if (kontaks.isEmpty()) {
                return Rs.response(Rs.MESSAGE_NO_DATA, HttpStatus.OK, null);
            }

            List<KontakRest> data = kontaks.stream().map(
                    x -> new KontakRest(x.getId(), x.getNama(), x.getNoHandphone(), x.getEmail())
            ).collect(Collectors.toList());
            return Rs.response("Successfully retrieved data!", HttpStatus.OK, data);

        } catch (Exception e) {
            return Rs.response(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR, null);
        }
    }

    @GetMapping("/kontaks/{id}")
    public ResponseEntity<Object> getKontakById(@PathVariable("id") long id) {
        Optional<Kontak> KontakData = repository.findById(id);

        if (KontakData.isPresent()) {
            final Kontak x = KontakData.get();
            return Rs.response("Successfully retrieved data!", HttpStatus.OK,
                    new KontakRest(x.getId(), x.getNama(), x.getNoHandphone(), x.getEmail()));

        } else {
            return Rs.response(Rs.MESSAGE_NO_DATA, HttpStatus.OK, null);

        }
    }

    @PostMapping("/kontaks")
    public ResponseEntity createKontak(@RequestBody KontakRest newKontak) {
        try {
            Kontak kontak = new Kontak();
            kontak.setNama(newKontak.getNama());
            kontak.setEmail(newKontak.getEmail());
            kontak.setNoHandphone(newKontak.getNoHandphone());
            Kontak x = repository.save(kontak);
            return Rs.response("Successfully retrieved data!", HttpStatus.OK,
                    new KontakRest(x.getId(), x.getNama(), x.getNoHandphone(), x.getEmail())
                    );
        } catch (Exception e) {
            e.printStackTrace();
            return Rs.response(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR, null);
        }
    }

    @PutMapping("/kontaks/{id}")
    public ResponseEntity updateKontak(@PathVariable("id") long id, @RequestBody KontakRest newKontak) {
        Kontak x =
                repository.findById(id).map(
                        kontak -> {
                            kontak.setNama(newKontak.getNama());
                            kontak.setEmail(newKontak.getEmail());
                            kontak.setNoHandphone(newKontak.getNoHandphone());
                            return repository.save(kontak);

                        }
                ).orElseGet(() -> {
                    return null;
                });
        if (x == null)
            return Rs.response(Rs.MESSAGE_NO_DATA_PROCESS, HttpStatus.OK, null);
        else {
            return Rs.response(Rs.MESSAGE_UPDATED, HttpStatus.OK,
                    new KontakRest(x.getId(), x.getNama(), x.getNoHandphone(), x.getEmail())
                    );
        }
    }

    @DeleteMapping("/kontaks/{id}")
    public ResponseEntity deleteKontak(@PathVariable("id") long id) {
        try {
            repository.deleteById(id);
            return Rs.response(Rs.MESSAGE_DELETED, HttpStatus.OK, null);
        } catch (Exception e) {
            return Rs.response(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR, null);
        }
    }

    @DeleteMapping("/kontaks")
    public ResponseEntity deleteAllKontaks() {
        try {
            repository.deleteAll();
            return Rs.response(Rs.MESSAGE_DELETED, HttpStatus.OK, null);
        } catch (Exception e) {
            return Rs.response(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR, null);
        }

    }

}
