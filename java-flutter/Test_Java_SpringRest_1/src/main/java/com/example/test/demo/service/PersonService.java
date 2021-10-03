package com.example.test.demo.service;

import com.example.test.demo.payload.PersonRequest;
import com.example.test.demo.payload.PersonResponse;

import java.util.List;

public interface PersonService {

    public PersonResponse createUser(PersonRequest personRequest);
    public PersonResponse updateUser(PersonRequest personRequest);
    public boolean deletPerson(Integer id);
    public List<PersonResponse> getAll();

}
