# frozen_string_literal: true

require 'capybara/rspec/matchers/base'
require 'capybara/rspec/matchers/count_sugar'

module Capybara
  module RSpecMatchers
    module Matchers
      class HaveText < WrappedElementMatcher
        include CountSugar

        def element_matches?(el)
          el.assert_text(*@args)
        end

        def element_does_not_match?(el)
          el.assert_no_text(*@args)
        end

        def description
          "text #{format(text)}"
        end

        def format(content)
          content.inspect
        end

      private

        def text
          @args[0].is_a?(Symbol) ? @args[1] : @args[0]
        end
      end
    end
  end
end
