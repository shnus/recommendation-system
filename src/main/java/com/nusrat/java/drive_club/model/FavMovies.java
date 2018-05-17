package com.nusrat.java.drive_club.model;

import lombok.Builder;
import lombok.Value;

import java.io.Serializable;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Nusrat on 5/27/2017.
 */
@Builder
@Value
public class FavMovies implements Serializable {
    public FavMovies(){

    }
    List<Movie> movies = new LinkedList<>();

    String id = "555";
}
