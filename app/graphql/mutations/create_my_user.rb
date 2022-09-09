module Mutations
    class CreateMyUser < BaseMutation
        class AuthProviderSignupData < Types::BaseInputObject
            argument :credentials, Types::AuthProviderCredentialsInput, required: false
        end

        argument :name, String, required: true
        argument :auth_provider, AuthProviderSignupData, required: false
        
        type Types::MyUserType

        def resolve(name: nil, auth_provider: nil)
            MyUser.create!(
                name: name,
                email: auth_provider&.[](:credentials)&.[](:email),
                password: auth_provider&.[](:credentials)&.[](:password)
            )
        end
    end
end
