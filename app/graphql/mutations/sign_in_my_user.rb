module Mutations 
    class SignInMyUser < BaseMutation
        null true
        argument :credentials, Types::AuthProviderCredentialsInput, required: false

        field :token, String, null: true
        field :my_user, Types::MyUserType, null: true

        def resolve(credentials: nil)
            # basic validation
            return unless credentials

            user = MyUser.find_by email: credentials[:email]
            
            # ensure we have the correct user
            return unless user
            return unless user.authenticate(credentials[:password])

            # use Ruby on Rails - ActiveSuppport::MessageEncryptor, to build a token
            crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
            token = crypt.encrypt_and_sign("user-id:#{user.id}")

            { user: user, token: token }
        end
    end
end
