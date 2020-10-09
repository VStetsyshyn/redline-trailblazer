super_admin = User.create(email: 'super_admin@example.com', password: '1234567890', password_confirmation: '1234567890')
client = Client.create(name: 'Best Client')
project = Project.create(name: 'MVP', user_id: super_admin.id, client_id: client.id)

# Project Permission
Permission.create(action: 'show', resource_class: 'Project', resource_id: project.id, user_id: super_admin.id)
Permission.create(action: 'update', resource_class: 'Project', resource_id: project.id, user_id: super_admin.id)
Permission.create(action: 'delete', resource_class: 'Project', resource_id: project.id, user_id: super_admin.id)

# Client Permission
Permission.create(action: 'show', resource_class: 'Client', resource_id: client.id, user_id: super_admin.id)

# Resource Action Permission
Permission.create(action: 'create', resource_class: 'Project', user_id: super_admin.id)

regular_admin = User.create(email: 'regular_admin@example.com', password: '1234567890', password_confirmation: '1234567890')

# Project Permission
Permission.create(action: 'show', resource_class: 'Project', resource_id: project.id, user_id: regular_admin.id)
Permission.create(action: 'update', resource_class: 'Project', resource_id: project.id, user_id: regular_admin.id)

# Resource Action Permission

Permission.create(action: 'create', resource_class: 'Project', user_id: regular_admin.id)
