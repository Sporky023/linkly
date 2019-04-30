Rails.application.routes.draw do
  post '/short_link', to: 'shortenings#create'
end
