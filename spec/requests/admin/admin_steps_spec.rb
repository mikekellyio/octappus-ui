require 'rails_helper'

RSpec.describe "Admin::Steps", type: :request do
  describe "GET /admin_steps" do
    it "works! (now write some real specs)" do
      Step.create title: "A step"
      get admin_steps_path
      expect(response).to have_http_status(200)
    end
  end
end
