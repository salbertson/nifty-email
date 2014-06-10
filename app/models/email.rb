class Email < ActiveRecord::Base
  before_create :generate_slug

  private

  def generate_slug
    self.slug = title.titleize.delete(" ").underscore.dasherize
  end
end
