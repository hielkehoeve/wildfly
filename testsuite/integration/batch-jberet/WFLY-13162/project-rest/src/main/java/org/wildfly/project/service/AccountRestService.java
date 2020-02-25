package org.wildfly.project.service;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;


@Path("/account")
@Stateless
@LocalBean
@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
public class AccountRestService {
    @GET
    @Path("banaan")
    public Response get() {
        return Response.ok().build();
    }
}
