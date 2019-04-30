Rails.application.routes.draw do
  post '/short_link', to: 'shortenings#create'
  get '/:short_link_code', to: 'shortenings#get_redirect'
end
