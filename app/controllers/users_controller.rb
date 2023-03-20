class UsersController<ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end
   def show
     
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/show.html.erb" })

   end
   def new 
    url_username = params.fetch("input_username")
    u = User.new
    u.username = url_username
    u.save
    redirect_to("/users/#{u.username}")  
   end

   def update
    url_username = params.fetch("username")
    new_username = params.fetch("input_username")
    u = User.where({ :username =>url_username }).at(0)

    u.username = new_username
    u.save
    redirect_to("/users/#{u.username}") 
   end
    
    
end
