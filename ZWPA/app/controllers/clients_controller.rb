class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :edit, :update, :destroy, :archive, :reactivate]

    def index
        @clients = Client.all
    end

    def show
    end

    def new
        @client = Client.new
    end

    def edit
    end

    def create
        @client = Client.new(client_params)
        @client.active = true
        respond_to do |format|
            if @client.save
                format.html { redirect_to clients_url, notice: "The client has been added to the system" }
                format.js
            else
                format.html { render action: 'new' }
            end
        end

    end

    def update
        if @client.update_attributes(client_params)
            flash[:notice] = "#{@client.name} is updated."
            redirect_to @client
        else
            render :action => 'edit'
        end
    end

    def destroy
        @client.destroy
        flash[:notice] = "Successfully removed #{@client.proper_name} from system."
        redirect_to clients_url
    end

    def archive
        if @client.active
            @client.active = false
            @client.save
            flash[:notice] = "Successfully archived #{@client.proper_name}."
            redirect_to clients_url
        else
            flash[:notice] = "#{@client.proper_name} is already archived."
            redirect_to clients_url  
        end
    end

    def reactivate
        unless @client.active
            @client.active = true
            @client.save
            flash[:notice] = "Successfully reactivated #{@client.proper_name}."
            redirect_to clients_url
        else
            flash[:notice] = "#{@client.proper_name} is already active."
            redirect_to clients_url  
        end
    end

    private
        def set_client
            @client = Client.find(params[:id])
        end

        def client_params
            params.require(:client).permit(:name, :street_1, :street_2, :city, :state, :zip, :contact_phone, :contact_email, :contact_title, :contact_first_name, :contact_last_name, :active)
        end
end
