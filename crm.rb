# new crm file used only for web app crm
require_relative 'contact'
require 'sinatra'
# require "pry"


get '/' do
end


#
#    get '/' do
# erb (:index)
#    end

   get '/index' do
erb (:index)
   end


  get '/about_me' do
erb (:about_me)
    end

get '/contacts' do
@all_contacts = Contact.all
# p @all_contacts
 erb(:contacts)
end


  # params[:id] contains the id from the URL
  get '/contacts/:id' do
    @contact = Contact.find_by(id: params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
  end

   after do
     ActiveRecord::Base.connection.close
   end
