require 'rails_helper'

RSpec.describe "Blogs", :type => :request do
  describe "GET /blogs" do
    it "works! (now write some real specs)" do
      get blogs_path
      expect(response.status).to be(200)
    end
  end
end
