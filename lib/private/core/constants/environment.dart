enum EnvironmentType {
  dev,
  mock,
  prod,
}

mixin class AppEnvironment {
  EnvironmentType get type => EnvironmentType.mock;
}