require 'sinatra/base'
require_relative './lib/models/student'
require 'sqlite3'
require 'pp'
require_relative './lib/concerns/persistable'
# require 'pry'

# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base
    get '/' do
      redirect '/students'
    end

    get '/students' do
      @students = Student.all

      erb :'students/students'
    end

    get '/students/' do
      redirect '/students'
    end

    get '/students/create' do
      erb :'students/create'
      # once we submit the create, it goes to the next thing
    end

    post '/students/create/process' do
      pp params
      student = Student.new
      params.each do |key, value|
        student.send("#{key}=", value)

      end
      student.save
      redirect "/students/#{student.id}"
    end
    
    get '/students/:id' do
      @student = Student.find(params[:id])
      erb :'students/profile'
    end

    get '/students/:id/edit' do
      @student = Student.find(params[:id])
      pp @student
      erb :'students/edit'
    end

    post '/students/edit/process' do
      params[:id] = params[:id].to_i
      student = Student.find(params[:id])
      params.each do |key, value|
        # will this change id from an integer to text?
        student.send("#{key}=", value)
      end
      student.save
      redirect "/students/#{params[:id]}" # or whatever
    end

  end
end
