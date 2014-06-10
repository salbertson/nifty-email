class Email < ActiveRecord::Base
  before_create :generate_slug
  before_save :generate_html

  private

  def generate_slug
    self.slug = title.titleize.delete(" ").underscore.dasherize
  end

  def generate_html
    self.html_body = markdown_renderer.render(content)
  end

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
  end
end
