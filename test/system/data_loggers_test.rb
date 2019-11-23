require "application_system_test_case"

class DataLoggersTest < ApplicationSystemTestCase
  setup do
    @data_logger = data_loggers(:one)
  end

  test "visiting the index" do
    visit data_loggers_url
    assert_selector "h1", text: "Data Loggers"
  end

  test "creating a Data logger" do
    visit data_loggers_url
    click_on "New Data Logger"

    fill_in "Name", with: @data_logger.name
    click_on "Create Data logger"

    assert_text "Data logger was successfully created"
    click_on "Back"
  end

  test "updating a Data logger" do
    visit data_loggers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @data_logger.name
    click_on "Update Data logger"

    assert_text "Data logger was successfully updated"
    click_on "Back"
  end

  test "destroying a Data logger" do
    visit data_loggers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Data logger was successfully destroyed"
  end
end
