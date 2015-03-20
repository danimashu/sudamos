class Attachment < ActiveRecord::Base
  attr_protected :advert_id, :main
  attr_accessor :image

  validates :advert_id, presence: true
  validate :max_attachments

  belongs_to :advert, counter_cache: true

  default_scope { order("id ASC") }

  def main_image!
    self.advert.attachments.update_all main: false
    self.reload.update_attribute :main, true
  end

  protected

  def max_attachments
    if self.advert.present? && self.advert.attachments_count >= MAX_ATT
      errors.add :base, I18n.t("errors.messages.max_attachments")
    end
  end
end
