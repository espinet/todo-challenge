Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createTask, function: Resolvers::CreateTask.new
  field :updateTask, function: Resolvers::UpdateTask.new
  field :destroyTask, function: Resolvers::DestroyTask.new
end
