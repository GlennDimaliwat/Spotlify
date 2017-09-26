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
        year_category = released_at.year
        
        if year_category >= 2000
            "two_thousands"
        elsif year_category >= 1990
            "ninetees"
        elsif year_category >= 1980
            "eightees"
        else
            "default"
        end
    end

end
