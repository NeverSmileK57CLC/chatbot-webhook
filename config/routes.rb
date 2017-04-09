Rails.application.routes.draw do
	root "welcome#index"
  post "/webhook" => "webhook#index"
end
