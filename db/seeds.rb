user_1 = User.create(name: 'mao', email: 'mao@gggg.com', document: '123')
user_2 = User.create(name: 'cami', email: 'cami@gggg.com', document: '456')

Project.create(name:'Project 1',user: user_1)
Project.create(name:'Project 2',user: user_2)
