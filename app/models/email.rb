class Email < ActiveRecord::Base
  before_create :generate_slug
  before_save :generate_html

  private

  def generate_slug
    self.slug = title.titleize.delete(" ").underscore.dasherize
  end

  def generate_html
    content_html = markdown_renderer.render(content)
    html_body = template_html.gsub(/\{\{ content \}\}/, content_html)
    premailer = Premailer.new(html_body, :with_html_string => true)

    self.html_body = premailer.to_inline_css
  end

  def markdown_renderer
    @markdown_renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new)
  end

  def template_html
    @template_html ||= File.read('app/assets/template.html')
  end
end
