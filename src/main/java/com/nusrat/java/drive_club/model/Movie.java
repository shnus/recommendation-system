package com.nusrat.java.drive_club.model;

import lombok.Builder;
import lombok.Value;

/**
 * Created by Nusrat on 5/27/2017.
 */
@Value
@Builder
public class Movie {
    int id;
    String title;
    String overview;
    String release_date;
    String original_language;
    String poster_path;
    String vote_average;

}
