class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :setup_data

    def index
        render json: @data
    end

    #Show a single book
    def show
        if @data[params[:id].to_i] == nil
            render plain: "#{params[:id]} is not a valid option."
        else
            render json: @data[params[:id].to_i]
        end
    end

    #Create a new book
    def create
        @data << {:title => params[:title], :author => params[:author]}
        redirect_to "/"
    end

    #Update a book
    def update
       @data[params[:id].to_i] = {:title => params[:title], :author => params[:author]}
       redirect_to "/"
    end

    #Remove a book
    def destroy
        @data.delete_at(params[:id].to_i)
        redirect_to "/"
    end

    private
    def setup_data
        session[:books] = [
            { title: "Harry Potter", author: "J.K Rowling" },
            { title: "Name of the wind", author: "Patrick Rothfuss" }
        ] unless session[:books]

        @data = session[:books]
    end

end