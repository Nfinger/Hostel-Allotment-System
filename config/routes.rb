Rails.application.routes.draw do

  get 'admin_sessions/new'

  get 'sessions/new'
  #get 'allchecklist', to:'static_pages#checklist'
  get 'borders/new'
  patch '/borders/:id/update', to:'borders#update' ,as:'update'
  get '/borders/:id/edit', to:'borders#edit', as:'edit'
  get '/borders/:id' , to:'borders#show', as:'profile'
  root 'static_pages#home'
  get 'signup' ,to:'borders#new'
  post 'signup' ,to:'borders#create'
  post 'ungroup',to:'borders#ungroup'

  get 'hello' ,to:'borders#hello'

  
  get '/checklist/:year', to: 'borders#checklist', as: 'checklist'
  resources :borders


  get 'login', to:'sessions#new'
  post 'login' , to:'sessions#create'
  delete 'logout', to:'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #for admin
  get 'adminlogin', to:'admin_sessions#new'
  post 'adminlogin', to:'admin_sessions#create'
  delete 'adminlogout', to:'admin_sessions#destroy'
  resources :admins
  get 'admins/:id', to:'admins#show',as:'adminprofile'
  get '/:hostelname/list',to:'admins#borderslist', as:'borderslist'
  get 'download',to:'admin#download'
  get 'preference',to:'admins#checkpreference'

  #generatelist
  post 'generate', to: 'preferences#create'
  
  get 'setdatetime', to:'admins#setdatetimepage'
  post 'setdatetime' , to:'preferences#setdatetime'

  #room allotment
  get 'newallotement',to:'room_allotements#start'
  get 'roomallotement',to:'room_allotements#show'
  get 'roomallotementhello',to:'room_allotements#hello'
  post 'roomallotement',to:'room_allotements#create'
  get 'allotement',to:'room_allotements#allotement'

  #settings
  get 'setting', to:'settings#show'
  post 'newhostel', to:'settings#newhostel'
  post 'import', to:'settings#import'

  post 'import_student_result', to:'settings#import_student_result'

  post 'create_profile', to:'settings#create_profile'

  post 'add' ,to: 'room_allotements#add'
  post 'remove' ,to: 'room_allotements#remove'
end
