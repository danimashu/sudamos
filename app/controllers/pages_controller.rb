class PagesController < HighVoltage::PagesController
  before_action :setting_tab
  layout "basic"

  protected

  def setting_tab
    set_tab params[:id].to_sym, :public
  end
end
