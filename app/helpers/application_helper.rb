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

    def set_cloth_size(sizes)
      sizes.slice(:unanswered, :XXS, :XS, :S, :M, :L, :XL, :"2XL", :"3XL", :"4XL")
    end

    def set_shoe_size(sizes)
      sizes.except(:XXS, :XS, :S, :M, :L, :XL, :"2XL", :"3XL", :"4XL")
    end

    def buyer_cost_shipping_method(shipping_methods)
      shipping_methods.slice(:mitei, :yuu, :cat, :pack)
    end
end
