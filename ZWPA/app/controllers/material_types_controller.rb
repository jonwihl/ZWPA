class MaterialTypesController < ApplicationController
    before_action :set_material_type, only: [:show, :edit, :update, :destroy]

    # GET /material_types
    # GET /material_types.json
    def index
        @material_types = MaterialType.all
    end

    # GET /material_types/1
    # GET /material_types/1.json
    def show
    end

    # GET /material_types/new
    def new
        @material_type = MaterialType.new
    end

    # GET /material_types/1/edit
    def edit
    end

    # POST /material_types
    # POST /material_types.json
    def create
        @material_type = MaterialType.new(material_type_params)
        @material_type.active = true
        if @material_type.save
            redirect_to material_types_url, notice: "The material type has been added to the system"
        else
            flash[:error] = "This material type could not be created."
            render "new"
        end
    end

    # PATCH/PUT /material_types/1
    # PATCH/PUT /material_types/1.json
    def update
        if @material_type.update_attributes(material_type_params)
            flash[:notice] = "#{@material_type.name} has been updated."
            redirect_to @material_type
        else
            render :action => 'edit'
        end
    end

    # DELETE /material_types/1
    # DELETE /material_types/1.json
    def destroy
        @material_type.destroy
        flash[:notice] = "Successfully removed #{@material_type.name} from the system."
        redirect_to material_types_url
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_material_type
            @material_type = MaterialType.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def material_type_params
            params.require(:material_type).permit(:name, :category, :active)
        end
end
