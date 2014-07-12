class Email < ActiveRecord::Base
  belongs_to :user

  before_create :generate_slug
  before_save :render_html
  before_save :render_text

  validates :name, presence: true

  def rendered_html(attributes = {})
    html = super()
    attributes.each do |name, value|
      html.gsub!(/{{ #{name} }}/, value)
    end
    html
  end

  def rendered_text(attributes = {})
    text = super()
    attributes.each do |name, value|
      text.gsub!(/{{ #{name} }}/, value)
    end
    text
  end

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
