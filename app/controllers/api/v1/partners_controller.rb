module Api
  module V1
    class PartnersController < ApplicationController
      def index
        partners = MatchingPartnersQuery.new(index_params).call

        render json: partners,
          only: [:name, :experience, :lat, :lon, :operating_radius, :rating],
          status: :ok

      end

      private

      def index_params
        params.permit(:service, :lat, :lon, :floor_area, :phone)
      end
    end
  end
end
