package com.example.test.demo.service.imp;

import com.example.test.demo.service.PersonService;
import com.example.test.demo.dao.PersonDao;
import com.example.test.demo.model.Address;
import com.example.test.demo.model.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.test.demo.payload.PersonRequest;
import com.example.test.demo.payload.PersonResponse;

import java.util.ArrayList;
import java.util.List;


@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    PersonDao personDao;

    @Override
    public PersonResponse createUser(PersonRequest personRequest) {
        Person person = new Person();
        person.setName(personRequest.getName());
        person.setEmail(personRequest.getEmail());
        person.setPhoneNumber(personRequest.getPhoneNumber());
        Address address = new Address();
        address.setCity(personRequest.getAddressCity());
        address.setCountry(personRequest.getAddressCountry());
        address.setState(personRequest.getAddressState());
        address.setStreet(personRequest.getAddressStreet());
        address.setPostalCode(personRequest.getAddressPostalCode());
        person.setAddress(address);
        address.setPerson(person);
        Person person1 = personDao.save(person);
        PersonResponse  personResponse = new PersonResponse(
                person1.getId(), person1.getName(), person1.getPhoneNumber(), person1.getEmail(),
                person1.getAddress().getStreet(), person1.getAddress().getCity(), person1.getAddress().getState(),
                person1.getAddress().getPostalCode(), person1.getAddress().getCountry()
        );

        return personResponse;
    }

    @Override
    public PersonResponse updateUser(PersonRequest personRequest) {
        Person person = new Person();
        person.setId(personRequest.getId());
        person.setName(personRequest.getName());
        person.setPhoneNumber(personRequest.getPhoneNumber());
        person.setEmail(personRequest.getEmail());
        Address address = new Address();
        address.setCity(personRequest.getAddressCity());
        address.setCountry(personRequest.getAddressCountry());
        address.setState(personRequest.getAddressState());
        address.setStreet(personRequest.getAddressStreet());
        address.setPostalCode(personRequest.getAddressPostalCode());
        person.setAddress(address);
        address.setPerson(person);
        Person person1 = personDao.save(person);
        PersonResponse  personResponse = new PersonResponse(
                person1.getId(), person1.getName(), person1.getPhoneNumber(), person1.getEmail(),
                person1.getAddress().getStreet(), person1.getAddress().getCity(), person1.getAddress().getState(),
                person1.getAddress().getPostalCode(), person1.getAddress().getCountry()
        );
        return personResponse;
    }

    @Override
    public boolean deletPerson(Integer id) {
        Person byId = personDao.getById(Long.valueOf(id));
        personDao.delete(byId);
        return true;
    }

    @Override
    public List<PersonResponse> getAll() {
        List<Person> persons = personDao.findAll();
        List<PersonResponse> personResponses = new ArrayList<>();
        persons.forEach(person1->{
            personResponses.add(new PersonResponse(
                    person1.getId(), person1.getName(), person1.getPhoneNumber(), person1.getEmail(),
                    person1.getAddress().getStreet(), person1.getAddress().getCity(), person1.getAddress().getState(),
                    person1.getAddress().getPostalCode(), person1.getAddress().getCountry()
            ));
        });
        return personResponses;
    }
}
