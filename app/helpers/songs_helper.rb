module SongsHelper

    # Format e.g. 127 as 2:07
    # 89 as 1:29
    # 127 as 2:07
    def format_duration(seconds)
        mm = seconds / 60
        ss = '%02d' % (seconds % 60)
        "#{mm}:#{ss}"
    end

    def format_color_scheme(released_at)
        year_category = released_at.strftime("%Y")
        
        if year_category.starts_with?("198")
            "eightees"
        elsif year_category.starts_with?("199")
            "ninetees"
        elsif year_category.starts_with?("20")
            "two_thousands"
        else
            "default"
        end
    end

end
