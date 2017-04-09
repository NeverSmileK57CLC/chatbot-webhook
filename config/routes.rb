Rails.application.routes.draw do
  post "/webhook" => "webhook#index"
end
