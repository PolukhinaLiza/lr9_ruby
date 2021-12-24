#!env ruby
# frozen_string_literal: true

require 'selenium-webdriver'
require_relative 'pages/home.rb'

BASE_URL = 'http://localhost:3000'

driver = Selenium::WebDriver.for :chrome

home_page = HomePage.new BASE_URL, driver

home_page
  .open
  .fill_form_with('33')
  .submit_form

raise 'Поле результата содержит некорректные данные' if home_page.result == ""

driver.quit