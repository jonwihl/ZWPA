class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :archive]
  # authorize_resource - TODO

  def index
    @users = User.alphabetical
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.active = true
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "The user has been added to the system"
    else
      flash[:error] = "This user could not be created."
      render "new"
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "#{@user.proper_name} is updated."
      redirect_to @user
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Successfully removed #{@user.proper_name} from system."
    redirect_to users_url
  end

  def archive
    @user.active = false
    if @user.save
      flash[:notice] = "Successfully archived #{@user.proper_name}."
      redirect_to users_url
    else
      flash[:notice] = "Could not archive #{@user.proper_name}."
      redirect_to users_url
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :active)
    end
end
