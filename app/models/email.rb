class Email < ActiveRecord::Base
  before_create :generate_slug
  before_save :render_html
  before_save :render_text

  validates :name, presence: true

  private

  def generate_slug
    self.slug = name.titleize.delete(" ").underscore.dasherize
  end

  def render_html
    premailer = Premailer.new(html, :with_html_string => true)
    self.rendered_html = premailer.to_inline_css
  end

  def render_text
    # premailer = Premailer.new(text, :with_html_string => true)
    # self.rendered_text = premailer.to_plain_text
    self.rendered_text = text
  end
end
