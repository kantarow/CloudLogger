class SeriesController < ApplicationController
  before_action :set_series, only: [:show, :edit, :update, :destroy]
  before_action :set_data_logger, only: [:show, :edit, :update, :destroy, :create]

  def index
    @series = Series.all
    @data_logger = DataLogger.find_by(id: params[:data_logger_id])
  end

  # GET /series/1
  # GET /series/1.json
  def show
  end

  # GET /series/new
  def new
    @series = Series.new
    @data_logger = DataLogger.find(params[:data_logger_id])
  end

  # GET /series/1/edit
  def edit
  end

  # POST /series
  # POST /series.json
  def create
    @series = @data_logger.series.new(series_params)

    respond_to do |format|
      if @series.save
        format.html { redirect_to data_logger_series_path(@data_logger, @series), notice: 'Series was successfully created.' }
        format.json { render :show, status: :created, location: @series }
      else
        format.html { render :new }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Series was successfully updated.' }
        format.json { render :show, status: :ok, location: @series }
      else
        format.html { render :edit }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to data_logger_series_index_url, notice: 'Series was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    def set_data_logger
      @data_logger = DataLogger.find_by(id: params[:data_logger_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def series_params
      params.require(:series).permit(:name)
    end
end
