class Resource < ActiveRecord::Base

  before_save :default_plan_to_test

  private

  def default_plan_to_test
    self.plan ||= "test"
  end
end
