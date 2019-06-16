module ApplicationHelper
    def embedded_svg filename, options={}
        file = File.read(Rails.root.join('app', 'assets', 'images', filename))
        doc = Nokogiri::HTML::DocumentFragment.parse file
        svg = doc.at_css 'svg'
        if options[:class].present?
          svg['class'] = options[:class]
        end
        doc.to_html.html_safe
    end
    def search_result_title
      if params[:keyword].blank? && params[:q].blank? || @items.length == 0
        "新着商品"
      elsif params[:keyword].present?
        "#{params[:keyword]}の検索結果"
      elsif params[:q].present?
        "検索結果"
      end
    end
end
