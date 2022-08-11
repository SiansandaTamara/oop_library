require_relative 'app'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

def main
  app = App.new
  app.run
end

main
