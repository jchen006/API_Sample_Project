require 'googlebooks' # unless you're using Bundler


class BooksController < ApplicationController

	def index
		books = GoogleBooks.search('The Great Gatsby')
		@first_book = books.first
	end 

	def new 
	end


end
