package com.bluetrainsoftware.example.server;

import com.bluetrainsoftware.example.api.CounterSecuredService;
import com.bluetrainsoftware.example.model.Counter;

import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class CounterResource implements CounterSecuredService {
  private final CounterRepository repository;

  @Inject
  public CounterResource(CounterRepository repository) {
    this.repository = repository;
  }

  @Override
  public Counter getCounter() {
    return new Counter().amount(repository.counter);
  }

  @Override
  public Counter incCounter(Counter counter) {
    repository.counter += counter.getAmount();
    return getCounter();
  }

  @Override
  public Counter resetCounter() {
    repository.counter = 0;
    return getCounter();
  }
}
