class MyAuthorsEdgeType < GraphQL::Types::Relay::BaseEdge
    node_type(Types::MyAuthorType)
end

class Types::MyAuthorsConnection < GraphQL::Types::Relay::BaseConnection
    field :total_count, Integer, null: false
    def total_count
        object.nodes.size
    end
    edge_type(MyAuthorsEdgeType)
end
