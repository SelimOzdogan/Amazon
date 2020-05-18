require "rails_helper"

RSpec.describe "Products", type: :request do
  describe "#new" do
    context "without a signed in user" do
      it "redirect them to the login page" do
        get :new
        expect(response).to(redirect_to(new_session_path))
      end
    end
  end
end
