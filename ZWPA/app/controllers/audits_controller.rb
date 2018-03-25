class AuditsController < ApplicationController
  before_action :set_audit, only: [:show, :edit, :update, :destroy]

  def index
    @audits = Audit.all
    @clients = Client.all
  end

  def show
  end

  def new
    @audit = Audit.new
  end

  def edit
  end

  def create
    @audit = Audit.new(audit_params)
    if @audit.save
      redirect_to @audit, notice: "The audit has been added to the system"
    else
      flash[:error] = "This audit could not be created."
      render "new"
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
    flash[:notice] = "Successfully removed #{@audit.proper_name} from system."
    redirect_to audits_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audit
      @audit = Audit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audit_params
      params.require(:audit).permit(:name, :type, :start_date, :end_date, :active, :references, :references, :references)
    end
end
