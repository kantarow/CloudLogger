class DataLoggersController < ApplicationController
  protect_from_forgery :except => [:add_data]
  before_action :set_data_logger, only: [:show, :edit, :update, :destroy, :add_data]

  # GET /data_loggers
  # GET /data_loggers.json
  def index
    @data_loggers = DataLogger.all
  end

  # GET /data_loggers/1
  # GET /data_loggers/1.json
  def show
  end

  # GET /data_loggers/new
  def new
    @data_logger = DataLogger.new
    4.times { @data_logger.series.build }
  end

  # GET /data_loggers/1/edit
  def edit
  end

  # POST /data_loggers
  # POST /data_loggers.json
  def create
    @data_logger = User.first.data_loggers.new(data_logger_params)

    respond_to do |format|
      if @data_logger.save
        format.html { redirect_to @data_logger, notice: 'Data logger was successfully created.' }
        format.json { render :show, status: :created, location: @data_logger }
      else
        format.html { render :new }
        format.json { render json: @data_logger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_loggers/1
  # PATCH/PUT /data_loggers/1.json
  def update
    respond_to do |format|
      if @data_logger.update(data_logger_params)
        format.html { redirect_to @data_logger, notice: 'Data logger was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_logger }
      else
        format.html { render :edit }
        format.json { render json: @data_logger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_loggers/1
  # DELETE /data_loggers/1.json
  def destroy
    @data_logger.destroy
    respond_to do |format|
      format.html { redirect_to data_loggers_url, notice: 'Data logger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_data
    add_data_params.to_h.each do |series, data|
      @data_logger.series.find_by(name: series).datum.create(data)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_logger
      @data_logger = DataLogger.find(params[:data_logger_id] || params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_logger_params
      params.require(:data_logger).permit(
        :name,
        { series_attributes: [:id, :name] }
      )
    end

    def add_data_params
      params.require(:series).permit(
        @data_logger.series.map {|s| [[ s.name.to_sym, [ :x, :y ]]].to_h }
      )
    end
end
