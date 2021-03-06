package com.nusrat.java.drive_club.web.controller;

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
 * Created by Nusrat on 5/23/2017.
 */

@ManagedBean
@Path("/search")
public class SearchResource {
    @Context
    private HttpServletRequest servletRequest;

    @Context
    private HttpServletResponse servletResponse;

    @Context
    UriInfo uri;

    @GET
    @Produces(MediaType.TEXT_HTML)
    public Response searchPage() {
        return Response.ok(new Viewable("/search/index.jsp")).build();
    }
}
