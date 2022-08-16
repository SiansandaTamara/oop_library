require_relative 'select_options'

class App
  def initialize
    # it create an instance of option
    @options = Options.new
  end

  def run
    puts 'WELCOME TO THE LIBRARY APP! '
    loop do
      @options.menu_options
      operation = gets.chomp
      exit if operation == '7'

      @options.choose_option operation
    end
    puts 'thank you for using the app'
  end
end
