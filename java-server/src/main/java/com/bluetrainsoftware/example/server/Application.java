package com.bluetrainsoftware.example.server;

import org.glassfish.jersey.grizzly2.httpserver.GrizzlyHttpServerFactory;
import org.glassfish.jersey.internal.inject.AbstractBinder;
import org.glassfish.jersey.server.ResourceConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Singleton;
import java.net.URI;

public class Application {
  private static final Logger log = LoggerFactory.getLogger(Application.class);

  public static void main(String[] args) throws Exception {
    URI BASE_URI = URI.create(String.format("http://0.0.0.0:%s/",
      System.getProperty("server.port", "8076")));

    ResourceConfig config = new ResourceConfig()
      .register(CounterResource.class)
      .registerInstances(new AbstractBinder() {
        protected void configure() {
          bind(CounterRepository.class).to(CounterRepository.class).in(Singleton.class);
        }
      });

    GrizzlyHttpServerFactory.createHttpServer(BASE_URI, config, true);

    // we are missing server lifecycle, shutdown hooks etc you would normally expect in a k8s cluster
    // and well behaved app

    log.info("Application started. -> {}", BASE_URI);

    Thread.currentThread().join();
  }
}
