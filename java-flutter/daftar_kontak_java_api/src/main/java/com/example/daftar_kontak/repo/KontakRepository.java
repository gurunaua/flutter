package com.example.daftar_kontak.repo;

import com.example.daftar_kontak.entity.Kontak;
import org.springframework.data.jpa.repository.JpaRepository;

public interface KontakRepository extends JpaRepository<Kontak, Long> {
}