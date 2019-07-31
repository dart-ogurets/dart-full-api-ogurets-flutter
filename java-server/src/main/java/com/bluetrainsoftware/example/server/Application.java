package com.bluetrainsoftware.example.server;

import cd.connect.jersey.JerseyHttp2Server;
import cd.connect.jersey.common.CommonConfiguration;
import cd.connect.jersey.common.JerseyExceptionMapper;
import cd.connect.lifecycle.ApplicationLifecycleManager;
import cd.connect.lifecycle.LifecycleStatus;
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

    CommonConfiguration.basic(config);

    JerseyHttp2Server.start(config, BASE_URI);

    log.info("Application started. (HTTP/2 enabled!) -> {}", BASE_URI);

    ApplicationLifecycleManager.updateStatus(LifecycleStatus.STARTED);

    Thread.currentThread().join();
  }
}
