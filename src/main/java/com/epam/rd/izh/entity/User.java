package com.epam.rd.izh.entity;

import com.epam.rd.izh.utils.Role;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)

    @Column(name = "user_id")
    private Long userId;
    @Column(name = "email")
    private String email;
    @Column(name = "password")
    private String password;
    @Column(name = "phone")
    private String phone;
    @Column(name = "billing_address")
    private String billingAddress;
    @Enumerated(value = EnumType.STRING)
    @Column(name = "role")
    private Role role;

}
