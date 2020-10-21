# frozen_string_literal: true

# Default users
User.create({ email: 'guest@email.com', password: '111111', role: '0' })
User.create({ email: 'user@email.com', password: '111111', role: '1' })
User.create({ email: 'admin@email.com', password: '111111', role: '2' })