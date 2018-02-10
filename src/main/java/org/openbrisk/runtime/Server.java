package org.openbrisk.runtime;

import java.io.File;
import java.net.URL;
import java.net.URLClassLoader;

import io.vertx.core.Vertx;
import io.vertx.ext.web.Router;
import io.vertx.ext.web.RoutingContext;
import io.vertx.ext.web.handler.BodyHandler;

public class Server
{
	private Vertx vertx;
	private Router router;

	public Server() {
		super();

		this.vertx = Vertx.vertx();
		this.router = Router.router(vertx);
	}

	private void configure() {
		router.get("/healthz").handler(routingContext -> {
			// TODO: Logging
			routingContext.response()
				.putHeader("Content-type", "text/plain")
				.putHeader("Connection", "close")
				.setStatusCode(200)
				.end();
		});
	}

	private void start() {
		vertx.createHttpServer()
        	.requestHandler(router::accept)
            .listen(8080, __ -> System.out.println("Listening on port 8080 ..."));
	}

    public static void main( String[] args ) {
		Server server = new Server();
		server.configure();
		server.start();
    }
}
