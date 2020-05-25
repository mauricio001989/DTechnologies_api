puts 'create user'
user_1 = User.create(name: 'mao', email: 'mao@gggg.com', document: '123')
user_2 = User.create(name: 'cami', email: 'cami@gggg.com', document: '456')

puts 'create project'
project_1 = Project.create(name:'Project 1',user: user_1)
project_2 = Project.create(name:'Project 2',user: user_2)
Project.create(name:'Project 3',user: user_1)

puts 'create tast'
Task.create(deadline: Time.zone.today + 5, project: project_1, description:"descripción de la actividad 1")
Task.create(deadline: Time.zone.today + 5, project: project_2, description:"descripción de la actividad 2")
