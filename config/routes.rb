Sudamos::Application.routes.draw do
  scope(path_names: { new: "nuevo", edit: "editar" }) do
    root to: "welcome#home"

    devise_for :users, controllers: { omniauth_callbacks: "user/omniauth_callbacks" },
      path: "", path_names: { sign_in: "entrar", sign_out: "salir", sign_up: "registrarse" }

    match "/pages/:id" => "pages#show", as: :static, via: :get
    get "home", to: "welcome#home"
    get "homebike", to: "welcome#homebike", path: "bicicletas"
    get "sitemap", to: "sitemap#sitemap"

    resources :adverts, only: [:index, :show], path: "anuncios" do
      collection do
        get "/en-:state_search_term_eq(/page/:page)", action: :index, as: "state_search"
        get "de-:sport_search_term_eq", action: :index, as: "sport_search"
        get "en-:state_search_term_eq/de-:sport_search_term_eq", to: "adverts#index", as: "state_sport_search"
        post "searcher"
        get "page/:page", action: :index
      end
      resources :contacts, only: :create, path: "contactos"
      resources :attachments, only: :show, path: "imagenes"
      resources :abuses, only: :create, path: "abusos"
    end
    resources :articles, only: [:index, :show], path: "articulos"
    resources :feedbacks, only: [:new, :create], path: "opiniones"
    resources :users, only: :show, path: "usuarios" do
      resources :contacts, only: :create, path: "contactos"
    end
    resources :subscribers, only: :create

    namespace :user, path: "usuario" do
      root to: "adverts#index"
      resources :adverts, except: [:show, :destroy], path: "anuncios" do
        member do
          get "renew", path: "renovar"
          delete "retire", path: "retirar"
        end
        resources :attachments, only: [:index, :create, :destroy], path: "imagenes" do
          get "main", on: :member, path: "principal"
        end
        resources :advert_contacts, only: :index, path: "contactos"
      end
      resources :contacts, only: :index, path: "contactos", as: :kontacts do
        put "read", on: :member, path: "leido"
      end
      resource :user, only: [:edit, :update], path: "usuario"
    end

    namespace :admin do
      resources :articles, except: :show
      resources :users, only: :index do
        post "become", on: :member
      end
    end
  end
end
