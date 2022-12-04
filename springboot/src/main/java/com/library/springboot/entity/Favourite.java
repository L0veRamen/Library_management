package com.library.springboot.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Favourite extends BaseEntity implements Serializable {
    private Integer userid;
    private Integer bookid;
    private boolean favourite;

}
