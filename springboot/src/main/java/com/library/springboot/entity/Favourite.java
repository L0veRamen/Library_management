package com.library.springboot.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Favourite extends BaseEntity implements Serializable {
    private String name;
    private String description;
    private String cover;
    private boolean favourite;
    private String author;
    private String publisher;
    private String category;
    private String bookNo;

}
