# == Route Map
#
#                    Prefix Verb   URI Pattern                                                 Controller#Action
#                      root GET    /                                                           welcome#home
#          new_user_session GET    /users/sign_in(.:format)                                    devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                    devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                   devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                               devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                              devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                   devise/passwords#update
#                           PUT    /users/password(.:format)                                   devise/passwords#update
#                           POST   /users/password(.:format)                                   devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                     devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                    devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                       devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                            devise/registrations#update
#                           PUT    /users(.:format)                                            devise/registrations#update
#                           DELETE /users(.:format)                                            devise/registrations#destroy
#                           POST   /users(.:format)                                            devise/registrations#create
#     conversation_messages GET    /conversations/:conversation_id/messages(.:format)          messages#index
#                           POST   /conversations/:conversation_id/messages(.:format)          messages#create
#  new_conversation_message GET    /conversations/:conversation_id/messages/new(.:format)      messages#new
# edit_conversation_message GET    /conversations/:conversation_id/messages/:id/edit(.:format) messages#edit
#      conversation_message GET    /conversations/:conversation_id/messages/:id(.:format)      messages#show
#                           PATCH  /conversations/:conversation_id/messages/:id(.:format)      messages#update
#                           PUT    /conversations/:conversation_id/messages/:id(.:format)      messages#update
#                           DELETE /conversations/:conversation_id/messages/:id(.:format)      messages#destroy
#             conversations GET    /conversations(.:format)                                    conversations#index
#                           POST   /conversations(.:format)                                    conversations#create
#          new_conversation GET    /conversations/new(.:format)                                conversations#new
#         edit_conversation GET    /conversations/:id/edit(.:format)                           conversations#edit
#              conversation GET    /conversations/:id(.:format)                                conversations#show
#                           PATCH  /conversations/:id(.:format)                                conversations#update
#                           PUT    /conversations/:id(.:format)                                conversations#update
#                           DELETE /conversations/:id(.:format)                                conversations#destroy
# 

Rails.application.routes.draw do
  root 'welcome#home'

  devise_for :users

  # To start conversation
  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
