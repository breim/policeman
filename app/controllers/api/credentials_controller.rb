# frozen_string_literal: true

module Api
  class CredentialsController < ApiController
    before_action :doorkeeper_authorize!

    def me
      render json: current_resource_owner
    end
  end
end
