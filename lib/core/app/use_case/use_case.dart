abstract class UseCase<Entity, Params> {
  Future<Entity> call(Params params);
}
