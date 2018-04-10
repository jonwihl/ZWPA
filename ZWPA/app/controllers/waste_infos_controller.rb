class WasteInfosController < ApplicationController
    before_action :set_waste_info, only: [:show, :edit, :update, :destroy]

    # GET /waste_infos
    # GET /waste_infos.json
    def index
        @waste_infos = WasteInfo.all
    end

    # GET /waste_infos/1
    # GET /waste_infos/1.json
    def show
        # @area_id = params[:area]
        # @waste_info = WasteInfo.area_waste(@area_id)
    end

    # GET /waste_infos/new
    def new
        @waste_info = WasteInfo.new
        @area_id = params[:area]
        @area = Area.find(@area_id)
        @audit = @area.audit_id
        @landfill = WasteInfo.area_waste(@area_id).waste_category('landfill').last(5)
        @compost = WasteInfo.area_waste(@area_id).waste_category('compost').last(5)
        @recycling = WasteInfo.area_waste(@area_id).waste_category('recycling').last(5)
        @reuse = WasteInfo.area_waste(@area_id).waste_category('reuse').last(5)
        @food_recovery = WasteInfo.area_waste(@area_id).waste_category('food recovery').last(5)
    end

    # GET /waste_infos/1/edit
    def edit
    end

    # POST /waste_infos
    # POST /waste_infos.json
    def create
        @area_id = params[:area]
        @waste_info = WasteInfo.new(waste_info_params)
        @waste_info.active = true
        @waste_info.timestamp = Date.current
        @waste_info.area_id = @area_id

        if @waste_info.anomaly.blank?
            @waste_info.anomaly = false
        end

        if @waste_info.true_category.blank?
            @waste_info.true_category = @waste_info.category
        end

        if @waste_info.save
            redirect_to new_waste_info_path(area: @area_id), notice: "The waste information has been added to the system"
        else
            flash[:error] = "This waste information could not be created."
            render "new"
        end
    end

    # PATCH/PUT /waste_infos/1
    # PATCH/PUT /waste_infos/1.json
    def update
        if @waste_info.update_attributes(waste_info_params)
            flash[:notice] = "The waste information has been updated."
            redirect_to @waste_info
        else
            render :action => 'edit'
        end
    end

    # DELETE /waste_infos/1
    # DELETE /waste_infos/1.json
    def destroy
        @waste_info.destroy
        flash[:notice] = "Successfully removed waste information from the system."
        redirect_to waste_infos_url
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_waste_info
            @waste_info = WasteInfo.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def waste_info_params
            params.require(:waste_info).permit(:category, :true_category, :weight, :notes, :anomaly, :timestamp, :active, :area_id, :waste_info_id, :material_type_id)
        end
end
