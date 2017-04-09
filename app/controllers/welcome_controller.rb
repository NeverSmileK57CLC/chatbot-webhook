class WelcomeController < ApplicationController
	def index
		render plain: "ChatBot"
	end
end
