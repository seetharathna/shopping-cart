class UsersController < ApplicationController
  layout 'main'
 #before_filter :check_logged_in,:except => :new

   
 
   def new
     @user = User.new
   end
  
       
   def create
     @user = User.new(params[:user])

     if @user.save
       flash[:notice] = "Registration successful."
       UserMailer.deliver_message(@user)
       redirect_to  :controller => 'guides',:action => 'index'
     else
       render :action => 'new'
     end

   end
  
   def edit
     @user = current_user
   end
  
   def update
     @user = current_user

     if @user.update_attributes(params[:user])
       flash[:notice] = "Successfully updated profile."
       redirect_to root_url
     else
       render :action => 'edit'
     end

   end

end
