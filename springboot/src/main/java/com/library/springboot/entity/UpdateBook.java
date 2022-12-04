package com.library.springboot.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class UpdateBook extends BaseEntity implements Serializable {

    private String name;
    private String description;
    private boolean favourite;
    private String cover;
    private String author;
    private String publisher;
    private String category;
    private String bookNo;

    private String bookid;
    private Integer userid;
    private List<String> categories;

    private boolean toread;
    private boolean reading;
    private boolean finishread;

    private String readstatus;



}
