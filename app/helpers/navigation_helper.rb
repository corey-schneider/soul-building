# DRY navigation links

module NavigationHelper
  def nav_link(text, path)
    content_tag(:li, class: 'nav-item px-2 ' + ('active' if current_page?(path)).to_s) do
      link_to text, path, class: 'nav-link'
    end
  end

  # For regular nav links on desktop
  def old_nav_link_to(text, path)
    if current_page?(path)
      link_to text, path, class: 'nav-link active'
    else
      link_to text, path, class: 'nav-link'
    end
  end

  # For 'mini' nav links on mobile devices
  def old_mini_nav_link_to(text, path)
    if current_page?(path)
      link_to text, path, class: 'block text-sm px-2 py-4 text-white bg-green-500 font-semibold'
    else
      link_to text, path, class: 'block text-sm px-2 py-4 hover:bg-green-500 transition duration-300'
    end
  end
end
