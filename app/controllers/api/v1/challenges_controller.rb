module Api
  module V1
    class ChallengesController < ApplicationController
      before_action :authenticate_user!,only: %i[create update destroy],
      before_action :set_challenge,only: %i[show update destroy]
      def index
        @challenges = Challenge.all
        render json: @challenges
      end

      def create
        @challenge = Challenge.new(challenges_params)
        if @challenge.save
          render json: { message: "challenge added successfully", data: @challenge }
        else
          render json: { message: "Failed to add challenge", data: @challenge.errors }
        end
      end

      def show
        if @challenge
          render json: { message: 'challenge found', data: @challenge }
        else
          render json: { message: 'challenge not found',data: @challenge.errors }
        end
      end

      def update
        if @challenge.update(challenges_params)
          render json: { message: 'challenge updated', data: @challenge }
        else
          render json: { message: 'challenge not updated', data: @challenge.errors }
        end
      end

      def destroy
        if @challenge.destroy
          render json: { message: 'challenge deleted', data: @challenge }
        else
          render json: { message: 'challenge not deleted', data: @challenge.errors }
        end
      end

      private
      def set_challenge
        @challenge = Challenge.find(params{:id})
      def challenges_params
        params.require(:challenge).permit(:title, :description, :start_date, :end_date)
      end
    end
  end
end
