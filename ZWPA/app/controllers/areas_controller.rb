class AreasController < ApplicationController
    before_action :set_area, only: [:show, :edit, :update, :destroy, :complete]

    # GET /areas
    # GET /areas.json
    def index
        @audit = Audit.find(params[:audit])
        @areas = Area.for_audit(@audit.id)
        @landfill = Array.new
        @compost = Array.new
        @recycling = Array.new
        @reuse = Array.new
        @food_recovery = Array.new
        @all = Array.new
        for area in @areas
            @landfill += WasteInfo.area_waste(area.id).waste_category('landfill')
            @compost += WasteInfo.area_waste(area.id).waste_category('compost')
            @recycling += WasteInfo.area_waste(area.id).waste_category('recycling')
            @reuse += WasteInfo.area_waste(area.id).waste_category('reuse')
            @food_recovery += WasteInfo.area_waste(area.id).waste_category('food recovery')
            @all += WasteInfo.area_waste(area.id)
        end
    end

    # GET /areas/1
    # GET /areas/1.json
    def show
        @audit = Audit.find(params[:audit])
        @landfill = WasteInfo.area_waste(@area.id).waste_category('landfill')
        @compost = WasteInfo.area_waste(@area.id).waste_category('compost')
        @recycling = WasteInfo.area_waste(@area.id).waste_category('recycling')
        @reuse = WasteInfo.area_waste(@area.id).waste_category('reuse')
        @food_recovery = WasteInfo.area_waste(@area.id).waste_category('food recovery')
        @all = WasteInfo.area_waste(@area.id)
    end

    # GET /areas/new
    def new
        @audit = Audit.find(params[:audit])
        @existing_areas = Area.for_audit(@audit.id)
        @area = Area.new
    end

    # GET /areas/1/edit
    def edit
    end

    # POST /areas
    # POST /areas.json
    def create
        @area = Area.new(area_params)
        @area.start_date = Date.today
        @area.active = true
        @area.status = "in progress"
        if @area.save
            redirect_to new_waste_info_path(area: @area), notice: "#{@area.name} has been added to the system"
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

    def complete
        @audit = @area.audit_id
        @area.status = "complete"
        @area.end_date = Date.current
        @area.save
        # @area.update_attribute(:end_date, Date.current)
        # @area.update_attribute(:status, "complete")
        redirect_to audit_path(@audit)
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_area
            @area = Area.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def area_params
            params.require(:area).permit(:name, :active, :start_date, :end_date, :status, :audit_id)
        end
end
