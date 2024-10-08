class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result

    render({ :template => "users/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    @the_user = matching_users.at(0)

    render({ :template => "users/show" })
  end

  def update
    the_id = params.fetch("path_id")
    the_user = User.where({ :id => the_id }).at(0)

    the_user.username = params.fetch("query_username")
    the_user.first_name = params.fetch("query_first_name")
    the_user.last_name = params.fetch("query_last_name")
    the_user.bio = params.fetch("query_bio")
    the_user.email = params.fetch("query_email")
    the_user.avatar_url = params.fetch("query_avatar_url")
 
    if the_user.valid?
        the_user.save
        redirect_to("/users/#{the_user.id}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{the_user.id}", { :alert => the_user.errors.full_messages.to_sentence + "."})
    end
    
    # if the_user.valid?
    #   if User.where({ :username => the_user.username }).first == nil && the_user.username != current_user.username
    #     the_user.save
    #     redirect_to("/users/#{the_user.id}", { :notice => "User updated successfully."} )
    #   else
    #     redirect_to("/users/#{the_user.id}", { :alert => "Username has already been taken."} )
    #   end
    # else
    #   redirect_to("/users/#{the_user.id}", { :alert => the_user.errors.full_messages.to_sentence + "."})
    # end

  end

  # def destroy
  #   the_id = params.fetch("path_id")
  #   the_user = User.where({ :id => the_id }).at(0)

  #   the_user.destroy

  #   redirect_to("/users", { :notice => "User deleted successfully."} )
  # end
  
end
