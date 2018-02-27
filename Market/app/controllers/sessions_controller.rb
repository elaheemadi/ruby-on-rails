class SessionsController < ApplicationController
  def new
  end
  def create
  user = User.find_by( :emaile => params[:email])
  puts user.password_digest
  if user && user.authenticate(params[:password])
   session[:user_id] = user.id
   flash[:success]= "Welcom to Market with Ruby"
   redirect_to root_path
  
   else
   flash.now[:danger]= "Your email or password is not correct"
   render 'new'
 end
 end
 def destroy
  session[:user_id]=nil
  flash[:danger]="Good bye"
  redirect_to root_path
  end

end