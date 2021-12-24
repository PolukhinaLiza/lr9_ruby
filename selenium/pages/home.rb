# frozen_string_literal: true

require_relative 'page.rb'

class HomePage < Page
  def initialize(base_url, driver)
    super
    @path = '/'
  end

  def open
    super
    @form = driver.find_element :tag_name, 'form'
    self
  end

  def fill_form_with(text)
    input = form.find_element name: :value
    input.send_keys text
    self
  end

  def submit_form
    submit = form.find_element name: :commit
    submit.click
    self
  end

  def result
    sleep(1)
    result = driver.find_element :name, 'result'
    result.text
  end

  protected

  attr_reader :path

  private

  attr_reader :form
end