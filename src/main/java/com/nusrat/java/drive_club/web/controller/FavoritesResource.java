package com.nusrat.java.drive_club.web.controller;

import com.nusrat.java.drive_club.model.FavMovies;
import com.nusrat.java.drive_club.model.Movie;
import org.glassfish.jersey.server.mvc.Viewable;

import javax.annotation.ManagedBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

/**
 * Created by Nusrat on 5/27/2017.
 */
@ManagedBean
@Path("/favorites")
public class FavoritesResource {
    @Context
    private HttpServletRequest servletRequest;

    @Context
    private HttpServletResponse servletResponse;

    @Context
    UriInfo uri;

    @GET
    @Produces(MediaType.TEXT_HTML)
    public Response loginPage() {
        FavMovies favMovies = FavMovies.builder().build();
        favMovies.getMovies().add(Movie.builder()
                .id(1)
                .title("Toy")
                .overview("Very nice film")
                .original_language("ru")
                .release_date("2017-05-27")
                .poster_path("4YnLxYLHhT4UQ8i9jxAXWy46Xuw.jpg")
                .vote_average("55")
                .build());
        favMovies.getMovies().add(Movie.builder()
                .id(2)
                .title("Toy2")
                .overview("Best movie ever")
                .original_language("en")
                .release_date("2017-05-27")
                .poster_path("4YnLxYLHhT4UQ8i9jxAXWy46Xuw.jpg")
                .vote_average("95")
                .build());
        favMovies.getMovies();
        servletRequest.setAttribute("movies",favMovies);
        return Response.ok(new Viewable("/favorites/index.jsp")).build();
    }
}
