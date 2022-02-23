# customizing resourceful routes
# overriding new and edit segments using path_names
resources :photos, controller: 'images', path_names: { new: 'make', edit: 'change' }, param: :title
