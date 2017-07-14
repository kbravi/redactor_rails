Rails.application.routes.draw do
  mount RedactorRails::Engine => "/" if RedactorRails.mount
end

RedactorRails::Engine.routes.draw do
  scope module: "redactor_rails" do
    post '/redactor_rails/pictures', :to => 'pictures#create'
    post '/redactor_rails/documents', :to => 'documents#create'
  end
end
