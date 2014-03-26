class VisitorsController < ApplicationController

  def new
    # Rails.logger.debug 'DEBUG: entering new method'
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Signed up #{@visitor.email}."
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def secure_params
    params.require(:visitor).permit(:email)
  end

end

# in a controller, just use logger. In a model use Rails.logger
