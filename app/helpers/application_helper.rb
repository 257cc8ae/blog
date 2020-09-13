module ApplicationHelper
    def webp_png
        if request.headers['HTTP_ACCEPT'].include?("image/webp")
            ".webp"
        else
            ".png"
        end
    end
    def webp_jpg
        if request.headers['HTTP_ACCEPT'].include?("image/webp")
            ".webp"
        else
            ".png"
        end
    end
end
