module HomeHelper
  def show_container?(element)
    current_page?(root_path) ? '' : element.to_s
  end
end
