Rails.application.routes.draw do
  get("/", { :controller =>"users", :action => "index" })

  get("/users", { :controller =>"users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller =>"photos", :action =>"show" })

  get("/delete_photo/:toast_id" , { :controller =>"photos", :action=>"baii" })

  get("/insert_photo", { :controller =>"photos", :action =>"create" })

  get("/insert_user_record", { :controller =>"users", :action => "new" })

  get("/insert_comment_record", { :controller =>"photos", :action => "show" })

  get("/insert_comment/:c_id", { :controller =>"photos", :action => "book" })

  get("/update_photo/:modify_id", { :controller =>"photos", :action =>"update" })

  get("/update_user/:username", { :controller => "users", :action => "update" })


  end
