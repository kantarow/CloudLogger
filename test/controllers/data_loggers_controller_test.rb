require 'test_helper'

class DataLoggersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_logger = data_loggers(:one)
  end

  test "should get index" do
    get data_loggers_url
    assert_response :success
  end

  test "should get new" do
    get new_data_logger_url
    assert_response :success
  end

  test "should create data_logger" do
    assert_difference('DataLogger.count') do
      post data_loggers_url, params: { data_logger: { name: @data_logger.name } }
    end

    assert_redirected_to data_logger_url(DataLogger.last)
  end

  test "should show data_logger" do
    get data_logger_url(@data_logger)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_logger_url(@data_logger)
    assert_response :success
  end

  test "should update data_logger" do
    patch data_logger_url(@data_logger), params: { data_logger: { name: @data_logger.name } }
    assert_redirected_to data_logger_url(@data_logger)
  end

  test "should destroy data_logger" do
    assert_difference('DataLogger.count', -1) do
      delete data_logger_url(@data_logger)
    end

    assert_redirected_to data_loggers_url
  end
end
