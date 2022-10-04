class UsersController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] ="You are not admin"
    redirect_back(fallback_location: root_path)
  end
    def index
        @users=User.all
    end


    def show


    end


    def destroy
        
        @user = User.find(params[:user_id])
       
        @user.destroy
    
        flash[:danger] = "User and all articles created by user have been deleted"
    
        redirect_to users_path
    end
    
    def update
 
      @user=User.find(params[:id])
      @user.update(user_params)

      if @user.save
        puts "Hellloasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        redirect_to users_path
      else
        puts "Hellloasssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        format.xml { render :xml => user_changeplan_path(user), :status => :unprocessable_entity }
      end
    end

    def changeplan
    
        @user=User.find(params[:user_id])
        
    end
 

    
     private

     def user_params
      params.require(:user).permit(:user_name, :userplan)
    end



end