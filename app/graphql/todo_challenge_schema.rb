TodoChallengeSchema = GraphQL::Schema.define do
  query(Types::QueryType)
  mutation(Types::MutationType)

  use GraphQL::Batch
end
