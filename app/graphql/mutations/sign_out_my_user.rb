# module Mutations
#     class SignOutMyUser < BaseMutation
#         null true 

#         argument :token, String, required: true

#         field :token, String, null: false
#         field :message, String, null: false

#         def resolve(token: nil)
#             session.clear
#             if session.clear
#                 {
#                     token: nil
#                 }
#             else 
#                 {
#                     session: token
#                 }
#             end
#         end
#     end
end
