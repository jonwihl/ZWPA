class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy, :archive, :reactivate]
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
            redirect_to clients_url, notice: "The user has been added to the system"
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
        if @user.active
            @user.active = false
            @user.save
            flash[:notice] = "Successfully archived #{@user.proper_name}."
            redirect_to users_url
        else
            flash[:notice] = "#{@user.proper_name} is already archived."
            redirect_to users_url
        end
    end

    def reactivate
        unless @user.active
            @user.active = true
            @user.save
            flash[:notice] = "Successfully reactivated #{@user.proper_name}."
            redirect_to users_url
        else
            flash[:notice] = "#{@user.proper_name} is already active."
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
