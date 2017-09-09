module ApplicationHelper
  def nav_link(link_path, &block)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: 'nav-item') do
      link_to link_path, class: "nav-link #{class_name}" do
        capture(&block)
      end
    end
  end
end
