class AreasController < ApplicationController
    before_action :set_area, only: [:show, :edit, :update, :destroy]

    # GET /areas
    # GET /areas.json
    def index
        @areas = Area.all
    end

    # GET /areas/1
    # GET /areas/1.json
    def show
    end

    # GET /areas/new
    def new
        @area = Area.new
    end

    # GET /areas/1/edit
    def edit
    end

    # POST /areas
    # POST /areas.json
    def create
        @area = Area.new(area_params)
        @area.active = true
        if @area.save
            redirect_to areas_url, notice: "#{@area.name} has been added to the system"
        else
            flash[:error] = "This area could not be created."
            render "new"
        end
    end

    # PATCH/PUT /areas/1
    # PATCH/PUT /areas/1.json
    def update
        if @area.update_attributes(area_params)
            flash[:notice] = "#{@area.name} has been updated."
            redirect_to @area
        else
            render :action => 'edit'
        end
    end

    # DELETE /areas/1
    # DELETE /areas/1.json
    def destroy
        @area.destroy
        flash[:notice] = "Successfully removed #{@area.name} from the system."
        redirect_to areas_url
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_area
          @area = Area.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def area_params
          params.require(:area).permit(:name, :active, :audit_id)
      end
end
