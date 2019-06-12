# frozen_string_literal: true

module ApplicationHelper
  MARKDOWN_OPTIONS = { autolink: true, space_after_headers: true, fenced_code_blocks: true }.freeze

  def markdown(text)
    markdown = Redcarpet::Markdown.new(HTMLWithCoderay, MARKDOWN_OPTIONS)
    markdown.render(text).html_safe
  end

  def readme_to_markdown
    markdown(File.read(Rails.root + 'README.md'))
  end

  def badge_status(status)
    return "<span class='tag is-danger'>Bloqueado</span>".html_safe if status.eql? true
    return "<span class='tag is-success'>Ativo</span>".html_safe if status.eql? false
  end
end
