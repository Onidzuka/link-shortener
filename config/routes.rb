Rails.application.routes.draw do
  root to: 'shortened_urls#new'

  get 's/:unique_key', to: 'link_translators#show', as: :link_translator

  resources :shortened_urls, only: [:new, :create, :show, :edit, :update]
end
