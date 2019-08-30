class ActivityController < ApplicationController

    get '/activities' do
        @routes = current_user.routes.all
        erb :"/activities/index"
    end 

    get '/activities/new' do 
        erb :'/activities/new'
    end 

    post '/activities' do
        @routes = current_user.routes.create(name: params["name"], grade: params["grade"], location: params["location"])
        redirect '/activities'
    end

    get '/activities/:id' do
        fetch_route
        erb :'activities/show'
    end 

    get '/activities/:id/edit' do 
        fetch_route
        if current_user == @route.user
            erb :'activities/edit'
        else 
            redirect '/activities'
        end 
            
    end 

    patch '/activities/:id' do
        fetch_route
        @route.name = params[:name]
        @route.grade = params[:grade]
        @route.location = params[:location]
        @route.save 
        redirect to '/activities'
    end 

    delete '/activities/:id' do 
        fetch_route
        @route.destroy
        redirect to '/activities'
    end 

    private
 
  def fetch_route
    @route = Route.find_by_id(params[:id])
  end
end 