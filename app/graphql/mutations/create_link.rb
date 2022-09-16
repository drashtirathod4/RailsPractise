class Mutations::CreateLink < Mutations::BaseMutation
    argument :description, String, required: true
    argument :url, String, required: true

    type Types::LinkType
    
    def resolve(description: nil, url: nil)
        Link.create!(
          description: description,
          url: url,
          my_user: context[:current_user]
        )
    end
end
