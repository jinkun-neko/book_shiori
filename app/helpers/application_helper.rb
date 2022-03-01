module ApplicationHelper

def title(page_title = '')
    shiori_title = "shiori app"
        if page_title.empty?
            shiori_title
        else
            page_title + "📕" + shiori_title
        end
    end
end
