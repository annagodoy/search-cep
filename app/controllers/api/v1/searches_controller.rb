module Api
  module V1
    class SearchesController < ApplicationController
      before_action :authenticate_user!

      def search_cep
        if @user
          response = CepSearch.call(search_params.merge(user: @user))

          if response.success?
            render json: SearchSerializer.new(response.search).serialized_json
          else
            render json: { error: response.error }, status: 422
          end
        else
          render json: { error: :unauthorized }, status: 401
        end
      end

      private

      def search_params
        params.permit(:cep, :token)
      end
    end
  end
end