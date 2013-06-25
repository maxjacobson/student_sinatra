require 'sinatra/base'
require_relative './lib/models/student'
require 'sqlite3'
require_relative './lib/concerns/persistable'
# require 'pry'

# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base
    # get '/' do
    #   "hello world!"
    # end

    # def initialize
    #   @random_numbers
    # end 

    
    # @random_numbers
    get '/hello-world' do
      @random_numbers = (1..20).to_a

      erb :hello
    end 

    get '/artists' do
      @artists = ["The Smiths", "The Cure", "New Order"]
      erb :artists
    end

    get '/students' do
      @students = Student.all

      erb :'students/students'
    end
    
    get '/students/:id' do |id|
      @student = Student.find(id)
      erb :'students/profile'
    end


  end
end
