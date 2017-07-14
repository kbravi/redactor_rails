module RedactorRails
  module AssetBase
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods
      def self.extended(base)
        base.class_eval do
          self.table_name = "redactor_assets"

          belongs_to :assetable, :polymorphic => true

          if defined?(ActiveModel::ForbiddenAttributesProtection) && base.ancestors.include?(ActiveModel::ForbiddenAttributesProtection)
            # Ok
          elsif defined?(ActiveModel::MassAssignmentSecurity) && base.ancestors.include?(ActiveModel::MassAssignmentSecurity)
            attr_accessible :data, :assetable_type, :assetable_id, :assetable
          end
        end
      end
    end

    module InstanceMethods
      def has_dimensions?
        respond_to?(:width) && respond_to?(:height)
      end

      def image?
        RedactorRails::IMAGE_TYPES.include?(data_content_type)
      end

      def image
        url
      end

      def thumb
        url(:thumb)
      end

      def as_json_methods
        [:image, :thumb]
      end

      def as_json(options = nil)
        options = {
          :methods => as_json_methods,
          :root => false
        }

        super options
      end
    end
  end
end
