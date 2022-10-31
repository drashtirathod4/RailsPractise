module Types
    class LinkType < Types::BaseObject
        field :id, ID, null: false
        field :url, String, null: false
        field :description, String, null: false
        field :posted_by, MyUserType, null: true, method: :my_user
    end
end
