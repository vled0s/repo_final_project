package com.epam.rd.izh.utils;

public enum Permission {

    DATA_READ("read"),
    DATA_WRITE("write");

    private String permission;

    Permission(String permission) {
        this.permission = permission;
    }

    public String getPermission() {
        return permission;
    }
}
