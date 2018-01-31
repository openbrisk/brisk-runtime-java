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
		router.get("/healthz").handler(null);
		router.get("/runtime/v1").handler(null);
		router.post("/runtime/v1").handler(null);
	}

	private void start() {
		
	}

    public static void main( String[] args ) {
		Server server = new Server();
		server.configure();
		server.start();
    }
}
