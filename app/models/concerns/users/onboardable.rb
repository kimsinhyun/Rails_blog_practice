require 'active_support/concern'

module Users
  module Onboardable
    extend ActiveSupport::Concern

    included do
      # 온보딩을 위한 기능
      cattr_accessor :form_steps do
        %w[sign_up set_name set_address find_users]
      end
      attr_accessor :form_step


      with_options if: -> { required_for_step?('set_name') } do |step|
        step.validates :first_name, presence: true
        step.validates :last_name, presence: true
      end

      validates_associated :address, if: -> { required_for_step?('set_address') }

      def form_step
        @form_step ||= 'sign_up'
      end

      def required_for_step?(step)
        return true if form_step.nil?
        return true if form_steps.index(step.to_s) <= form_steps.index(form_step.to_s)
      end
    end
  end
end
