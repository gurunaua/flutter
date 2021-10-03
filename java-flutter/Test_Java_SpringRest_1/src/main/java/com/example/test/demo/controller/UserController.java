package com.example.test.demo.controller;


import com.example.test.demo.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.example.test.demo.payload.PersonResponse;
import com.example.test.demo.payload.ResponseApi;
import com.example.test.demo.payload.PersonRequest;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = "/person")
public class UserController {

    @Autowired
    PersonService userService;

    @PostMapping
    public ResponseApi post(@Valid @RequestBody PersonRequest request) {

        ResponseApi response = new ResponseApi();

        try {
            PersonResponse responseO = userService.createUser(request);
            response.setData(responseO);
            response.setSuccess(true);
            response.setMessage("Save data success");
        }catch (Exception e){
            response.setMessage("error internal "+e.getMessage());
            response.setSuccess(false);
        }

        return response;
    }


    @GetMapping
    public ResponseApi get() {
        ResponseApi response = new ResponseApi();

        try {
            List<PersonResponse> all = userService.getAll();
            response.setData(all);
            response.setMessage("List");
            response.setSuccess(true);
        }catch (Exception e){
            response.setMessage("error internal");
            response.setSuccess(false);
        }

        return response;
    }

    @PutMapping
    public ResponseApi update(@RequestBody PersonRequest request) {

        ResponseApi response = new ResponseApi();

        try {
            PersonResponse responseO = userService.updateUser(request);
            response.setData(responseO);
            response.setMessage("Save data success");
        }catch (Exception e){
            response.setMessage("error internal");
            response.setSuccess(false);
        }

        return response;
    }

    @DeleteMapping(value = "/{id}")
    public ResponseApi delete(@PathVariable Integer id) {

        ResponseApi response = new ResponseApi();

        try {
            boolean responseO = userService.deletPerson(id);
            response.setSuccess(true);
            response.setMessage("Save data success");
        }catch (Exception e){
            e.printStackTrace();
            response.setMessage("error internal");
            response.setSuccess(false);
        }

        return response;
    }

}
