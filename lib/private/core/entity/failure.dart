abstract class Failure {
  abstract final String description;

  const Failure();
}

class ResquestError extends Failure {
  @override
  final String description;

  const ResquestError(this.description);
}