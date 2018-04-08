class AuditsController < ApplicationController
    before_action :set_audit, only: [:show, :edit, :update, :destroy]

    def index
        @audits = Audit.all
        @clients = Client.all
    end

    def show
        @areas = Area.for_audit(@audit.id)
        unless @audit.questionnaire_id.nil?
            @questionnaire_status = Questionnaire.find(@audit.questionnaire_id).status
        else
            @questionnaire_status = 0
        end
    end

    def new
        @audit = Audit.new
    end

    def edit
    end

    def create
        @audit = Audit.new(audit_params)
        @audit.start_date = Date.today
        @audit.end_date = nil
        respond_to do |format|
            if @audit.save
                format.html { redirect_to @audit, notice: "The audit has been added to the system" }
                format.js
            else
                format.html { render action: 'new' }
            end
        end
    end

    def update
        if @audit.update_attributes(audit_params)
            flash[:notice] = "#{@audit.name} is updated."
            redirect_to @audit
        else
            render :action => 'edit'
        end
    end

    def destroy
        @audit.destroy
        flash[:notice] = "Successfully removed #{@audit.name} from system."
        redirect_to audits_url
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_audit
            @audit = Audit.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def audit_params
            params.require(:audit).permit(:name, :audit_type, :start_date, :end_date, :active, :client_id, :user_id, :questionnaire_id)
        end
end
