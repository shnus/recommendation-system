package com.nusrat.java.drive_club.model;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Tolerate;

import javax.security.auth.Subject;
import java.io.Serializable;
import java.time.LocalDate;

/**
 * Created by Nusrat on 2/12/2017.
 */
@Data
@Builder
public class User implements Serializable {
    private long id;
    String firstName;
    String lastName;
    LocalDate birthDate;
    String gender;
    String bio;
    String location;
    String loginName;
    String passwordHash;
    String image_b64;

    @Tolerate
    public User(){
    }

    public String getName() {
        return firstName+" "+lastName;
    }

    public boolean implies(Subject subject) {
        return false;
    }
}
