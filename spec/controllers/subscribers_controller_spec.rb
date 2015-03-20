require 'spec_helper'

describe SubscribersController do
  describe "on POST to create" do
    before { post :create, subscriber: { email: "daniel@gmail.com" } }
    it { should respond_with(:redirect) }
  end
end
