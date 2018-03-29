class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new
  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    if @questionnaire.save
      redirect_to @questionnaire, notice: "The questionnaire has been saved."
    else
      flash[:error] = "The questionnaire could not be saved."
      render "new"
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    if @questionnaire.update_attributes(questionnaire_params)
      flash[:notice] = "The questionnaire has been updated."
      redirect_to @questionnaire
    else
      render :action => 'edit'
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    flash[:notice] = "Successfully removed the questionnaire from system."
    redirect_to questionnaires_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(:square_footage, :max_occupancy, :num_floors, :management_structure, :waste_disposal_system, :solid_waste_system, :waste_management_costs, :loading_dock, :freight_elevators, :location_info, :trash_hauler, :trash_hauler_contract, :trash_hauler_copy, :record_of_waste_vol, :solid_waste_storage, :solid_waste_containers, :solid_waste_info, :recycling_mandated, :recycling_program, :recycling_program_stream, :recycling_program_info, :buy_recycling_policy, :buy_recycling_policy_info, :discontinued_recycling_info, :compost_waste_current, :compost_waste_past, :compost_program_info, :toner, :cfls, :batteries, :peripherals, :cell_phones, :tvs, :corded_equipment, :furniture, :linens, :construction_debris, :pallets, :zero_waste_policy, :leed_certified, :recertify_leed, :true_zero_waste_audit, :prc_waste_audit)
    end
end
