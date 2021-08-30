# DRY navigation links

module NavigationHelper

    # For regular nav links on desktop
    def nav_link_to(text, path)
        if current_page?(path)
            link_to text, path, class: 'py-4 px-5 text-gray-800 border-b-2 border-blue-400 font-semibold'
        else
            link_to text, path, class: 'py-4 px-5 text-gray-800 font-semibold hover:text-blue-600 transition duration-300'
        end
    end

    # For 'mini' nav links on mobile devices
    def mini_nav_link_to(text, path)
        if current_page?(path)
            link_to text, path, class: 'block text-sm px-2 py-4 text-white bg-green-500 font-semibold'
        else
            link_to text, path, class: 'block text-sm px-2 py-4 hover:bg-green-500 transition duration-300'
        end
    end

end