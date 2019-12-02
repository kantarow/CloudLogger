class DatumController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    @datum = Series.find(params[:series_id]).datum.new(datum_params)
    if @datum.save!
      render json: { status: :created, location: @datum }
    else
      render json: { errors: @datum.errors, status: :unprocessable_entity }
    end
  end

  private
    def datum_params
      params.require(:datum).permit(:value)
    end
end
