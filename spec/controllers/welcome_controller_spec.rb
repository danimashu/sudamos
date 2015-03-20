require 'spec_helper'

describe WelcomeController do

  describe "on GET to home" do
    before { get :home }
    it { should respond_with(:success) }
  end

  describe "on GET to homebike" do
    before { get :homebike }
    it { should respond_with(:success) }
  end

end
