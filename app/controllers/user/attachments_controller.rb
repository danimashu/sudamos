class User::AttachmentsController < User::Base
  set_tab :adverts, :user
  actions :index, :create, :destroy
  belongs_to :advert

  def index
    @attachment = parent.attachments.new
    index!
  end

  def create
    @attachment = parent.attachments.new(params[:attachment])

    transloadit_assignments

    create! do |_success, failure|
      failure.html { render "index" }
    end
  rescue => e
    Rollbar.error(e)
    redirect_to [:user, parent, :attachments],
                alert: t("flash.attachments.create.alert")
  end

  def main
    resource.main_image!
    redirect_to [:user, parent, :attachments],
                notice: t("flash.attachments.main.notice")
  end

  protected

  def decoded_transloadit_json
    return if params[:transloadit].blank?
    ActiveSupport::HashWithIndifferentAccess.new(
      ActiveSupport::JSON.decode params[:transloadit]
    )
  end

  def transloadit_assignments
    decoded_response = decoded_transloadit_json

    @attachment.transloadit_response = params[:transloadit]
    @attachment.lg_url = decoded_response[:results][:lg].first[:url]
    @attachment.md_url = decoded_response[:results][:md].first[:url]
    @attachment.sm_url = decoded_response[:results][:sm].first[:url]
  end
end
