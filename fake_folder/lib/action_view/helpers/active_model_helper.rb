require "active_support/core_ext/module/attribute_accessors"
require "active_support/core_ext/enumerable"

module ActionView
  # = Active Model Helpers
  module Helpers
    module ActiveModelHelper
    end

    module ActiveModelInstanceTag
      def object
        @active_model_object ||= begin
          object = super
          object.respond_to?(:to_model) ? object.to_model : object
        end
      end

      def content_tag(*)
        error_wrapping(super)
      end

      def tag(type, options, *)
        tag_generate_errors?(options) ? error_wrapping(super) : super
      end
    end
  end
end
