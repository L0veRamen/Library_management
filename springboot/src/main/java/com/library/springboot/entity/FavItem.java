package com.library.springboot.entity;

import lombok.Data;

@Data
public class FavItem {
    private Integer id;
    private Integer userid;
    private Integer bookid;
    private boolean favourite;
}
