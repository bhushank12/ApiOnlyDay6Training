require "rails_helper"
require "rspec_api_documentation"

resource "Users" do
  get "/v1/users" do
    example "Listing users" do
      User.create(first_name: "a", last_name: "b")
      do_request

      expect(status).to eq(200)
    end
  end

  post "/v1/users" do
    parameter :first_name, "Will contain the first name of user", scope: :user
    parameter :last_name, "Will contain the last name of user", scope: :user, required: true

    let!(:first_name) { "bhushan" }
    let!(:last_name) { "kalode" }
    let!(:raw_post) { params.as_json }

    example "Creating user" do
      do_request

      expect(status).to eq(200)
    end
  end
end