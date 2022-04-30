abstract class Mapper<Entity, Model> {
  Entity toEntity(Model object);
  Model fromEntity(Entity object);
}
