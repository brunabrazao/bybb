# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

org_member_role = Role.create({ name: 'OrgMember', description: 'Can join an org, read and create some items' })
org_admin_role = Role.create({ name: 'OrgAdmin',
                               description: 'Can read and create items. Can manage their own org and kick off reviews cycles' })
super_admin_role = Role.create({ name: 'SuperAdmin', description: 'Can perform any CRUD operation on any resource' })

org_one = Organisation.create({ title: 'BYBB', short_description: 'The main org', licenses: 100 })
org_two = Organisation.create({ title: 'Sample', short_description: 'Another one', licenses: 10 })

user_one = User.create({ email: 'john@example.com', password: '123456', password_confirmation: '123456',
                         role_id: org_member_role.id, organisation_id: org_one.id })
user_two = User.create({ email: 'mary@example.com', password: '123456', password_confirmation: '123456',
                         role_id: org_admin_role.id, organisation_id: org_two.id })
user_three = User.create({  email: 'chris@example.com', password: '123456', password_confirmation: '123456',
                            role_id: org_admin_role.id, organisation_id: org_two.id, manager_id: user_two.id })
user_four = User.create({  email: 'brunaa@gmail.com', password: '123456', password_confirmation: '123456',
                           role_id: super_admin_role.id, organisation_id: org_one.id, manager_id: user_one.id })

user_one.manager_id = user_four.id
user_one.save
user_two.manager_id = user_three.id
user_two.save
