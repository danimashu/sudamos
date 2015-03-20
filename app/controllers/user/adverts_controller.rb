class User::AdvertsController < User::Base
  include ActionView::Helpers::DateHelper

  set_tab :adverts, :user
  actions :all, except: [:show, :destroy]

  def create
    create! do |success, failure|
      success.html { redirect_to [:user, resource, :attachments] }
    end
  end

  def renew
    if resource.renew!
      flash[:notice] = t("flash.adverts.renew.notice")
    else
      flash[:alert] = t("flash.adverts.renew.alert",
        until: distance_of_time_in_words_to_now(resource.renewed_at + RENEW_INTERVAL.seconds))
    end
    redirect_to [:user, :adverts]
  end

  def retire
    resource.retire!
    redirect_to [:user, :adverts], notice: t("flash.adverts.retire.notice")
  end

  def collection
    end_of_association_chain.active
  end

  protected

  def begin_of_association_chain
    current_user
  end

end
