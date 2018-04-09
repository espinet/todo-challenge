Types::TaskType = GraphQL::ObjectType.define do
  name 'TaskType'

  field :id, !types.ID
  field :title, !types.String
  field :description, types.String
  field :status, !types.String
  field :dueDate, Types::DateTimeType do
    resolve -> (task, _, _) { task.due_date }
  end
  field :categories, types[types.String] do
    resolve -> (task, _, _) do
      AssociationLoader.for(Task, :categories).load(task).then do |categories|
        categories.map(&:name)
      end
    end
  end
  field :subtasks, types[Types::TaskType] do
    resolve -> (task, _, _) do
      AssociationLoader.for(Task, :subtasks).load(task).then { |tasks| tasks }
    end
  end
end
