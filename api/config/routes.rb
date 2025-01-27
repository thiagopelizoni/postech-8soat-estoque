Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root "categorias#index"

  resources :produtos, param: :slug do
    collection do
      get 'nome/:nome', to: 'produtos#search_by_nome', as: :search_produtos_by_nome
      get 'ativos'
      get 'inativos'
    end
  end

  resources :categorias, param: :slug

  get "up" => "rails/health#show", as: :rails_health_check
end
