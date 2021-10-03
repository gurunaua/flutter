package com.example.test.demo.payload;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PersonResponse {

    private long id;
    private String name;
    private String phoneNumber;
    private String email;

    @JsonProperty("address__street")
    private String addressStreet;

    @JsonProperty("address__city")
    private String addressCity;

    @JsonProperty("address__state")
    private String addressState;

    @JsonProperty("address__postal_code")
    private String addressPostalCode;

    @JsonProperty("address__country")
    private String addressCountry;

    public PersonResponse(long id, String name, String phoneNumber, String email, String addressStreet, String addressCity, String addressState, String addressPostalCode, String addressCountry) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.addressStreet = addressStreet;
        this.addressCity = addressCity;
        this.addressState = addressState;
        this.addressPostalCode = addressPostalCode;
        this.addressCountry = addressCountry;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddressStreet() {
        return addressStreet;
    }

    public void setAddressStreet(String addressStreet) {
        this.addressStreet = addressStreet;
    }

    public String getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity;
    }

    public String getAddressState() {
        return addressState;
    }

    public void setAddressState(String addressState) {
        this.addressState = addressState;
    }

    public String getAddressPostalCode() {
        return addressPostalCode;
    }

    public void setAddressPostalCode(String addressPostalCode) {
        this.addressPostalCode = addressPostalCode;
    }

    public String getAddressCountry() {
        return addressCountry;
    }

    public void setAddressCountry(String addressCountry) {
        this.addressCountry = addressCountry;
    }
}
