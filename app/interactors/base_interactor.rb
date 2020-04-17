# frozen_string_literal: true

# Define BaseInteractor from https://medium.com/reflektive-engineering/validators-for-interactors-a0632494e3d5
class BaseInteractor
  include Interactor
  include ActiveModel::Validations
  
  # For any class that inherits this class, a `before` hook is registered, which raises ArgumentError if the reqired parameters are not passed in during invocation.
  def self.inherited(subclass)
    subclass.class_eval do
      def self.requires(*attributes)
        validates_each attributes do |record, attr_name, value| #from ActiveModel::Validations
            raise ArgumentError.new("Required attribute #{attr_name} is missing") if value.nil?
          end
        delegate *attributes, to: :context
      end

      before do
        context.fail!(errors: errors) unless valid? # runs every validation
      end

      def read_attribute_for_validation(method_name)
        context.public_send(method_name)
      end
    end
  end
end