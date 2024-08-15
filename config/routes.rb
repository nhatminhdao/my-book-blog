Rails.application.routes.draw do

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

  root to: "blogs#index"

  #------------------------------

  # Routes for the Follower resource:

  # CREATE
  post("/insert_follower", { :controller => "followers", :action => "create" })
          
  # READ
  get("/followers", { :controller => "followers", :action => "index" })
  
  get("/followers/:path_id", { :controller => "followers", :action => "show" })
  
  # UPDATE
  
  post("/modify_follower/:path_id", { :controller => "followers", :action => "update" })
  
  # DELETE
  get("/delete_follower/:path_id", { :controller => "followers", :action => "destroy" })

  #------------------------------

  # Routes for the Blog resource:

  # CREATE
  post("/insert_blog", { :controller => "blogs", :action => "create" })
          
  # READ
  get("/blogs", { :controller => "blogs", :action => "index" })
  
  get("/blogs/:path_id", { :controller => "blogs", :action => "show" })
  
  # UPDATE
  
  post("/modify_blog/:path_id", { :controller => "blogs", :action => "update" })
  
  # DELETE
  get("/delete_blog/:path_id", { :controller => "blogs", :action => "destroy" })

  #------------------------------

  devise_for :users
 
  # READ
  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_id", { :controller => "users", :action => "show" })

  
end
