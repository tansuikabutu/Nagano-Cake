Rails.application.routes.draw do
  #rootパス
root 'homes#top'

# 顧客用サイトのrouting
devise_for :members, controllers: {
    registrations: 'members/registrations',
    passwords: 'members/passwords',
    sessions: 'members/sessions'}

get 'homes/top' => 'homes#top', as: 'member_top'
get 'homes/about' => 'homes#about', as: 'member_about'
resources :members, only: [:edit, :show, :update,]
  get 'members/:id/unsubscribe' => 'members#unsubscribe', as: 'member_unsubscribe'
  patch 'members/:id/unsubscribe' => 'members#unsubscribe_done', as: 'member_unsubscribe_done'
  put "/members/:id/unsubscribe" => "members#unsubscribe_done", as: 'members_unsubscribe_done'
resources :orders, only: [:index, :create, :show, :new]
  get 'orders/entry' => 'orders#entry', as: 'order_entry'
  get 'orders/check' => 'orders#check', as: 'order_check'
  get 'orders/thanks' => 'orders#thanks', as: 'order_thanks'
resources :items, only: [:index, :show]
resources :delivery_addresses, only: [:index, :create, :show, :edit, :update, :destroy]
resources :genres, only: [:show]

#カートアイテムを全て削除メソッドのために追加
resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
        delete 'destroy_all'
    end
end

# 管理者用サイトのrouting
devise_scope :admins do
    devise_for :admins, controllers: {
        registrations: 'admins/registrations',
        passwords: 'admins/passwords',
        sessions: 'admins/sessions'
    }
end

namespace :admins do
    get 'homes/top' => 'homes#top', as:'top'
    resources :members, only: [:index, :edit, :show, :update] do
      member do
        patch :toggle
      end
    end

    resources :items, only: [:index, :create, :new, :edit, :show, :update]
    resources :orders, only: [:index, :create, :show, :update]
    resources :order_items, only: [:index, :create, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    get 'search' => 'searches#search', as: 'search'
end

end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

