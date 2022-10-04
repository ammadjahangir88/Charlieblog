class GroupsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] ="You are not admin"
    redirect_back(fallback_location: root_path)
  end
  def index
    @group=Group.all
  end

  def show
    @group= Group.find(params[:id])
  end


  def new

    @group=Group.new

  end

  def create

    @group = Group.new(group_params)

    @group.user=current_user
    @join = @group.user_groups.build(:user_id => current_user.id)
    respond_to do |format|
      if @group.save
        # session[:user_id] = @user.id
        format.html { redirect_to user_group_path(current_user,@group), notice: "Welcome to Alphablog " }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end

  end
  def join
    @group= Group.find(params[:group_id])
    @join = @group.user_groups.build(:user_id => current_user.id)
    respond_to do |format|
      if @join.save
        CrudNotificationMailer.ongroupcreatenotification(@group).deliver_now
        format.html { redirect_to(user_group_path(current_user,@group), :notice => "You have joined this group.") }
        
      else
        format.html { redirect_to(user_group_path(current_user,@group), :notice => "You have alreadu joined this group.") }
        format.xml { render :xml => user_group_path(current_user,@group), :status => :unprocessable_entity }
      end
    end
  end
  def joingroup
    
    @group= Group.find(params[:group_id])
    @join = @group.user_groups.build(:user_id => current_user.id)
    @join.request=false

    respond_to do |format|
      if @join.save
        format.html { redirect_to(user_group_path(current_user,@group), :notice => "Request sent succesfully") }
        
      else
        format.html { redirect_to(user_group_path(current_user,@group), :notice => "You have alreadu joined this group.") }
        format.xml { render :xml => user_group_path(current_user,@group), :status => :unprocessable_entity }
      end
    end



  end
  def approve
    @group= Group.find(params[:group_id])
  
  end


  def view
    @group= Group.find(params[:group_id])
  end

  def accept
    user_group = UserGroup.find_by(user_id: params[:user_id], group_id: params[:group_id])
    user_group.request= true
    user_group.save
    redirect_to user_group_approve_path
  end


  def delete
    user_group = UserGroup.find_by(user_id: params[:user_id], group_id: params[:group_id])
    user_group.destroy
    redirect_to user_group_approve_path
  end
    
  def destroy

  end
  private
  def group_params
    params.require(:group).permit(:name,:grouptype,:image)
  end
end
