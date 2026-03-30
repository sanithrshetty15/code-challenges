module Api
  module V1
    class ChallengesController < ApplicationController
      before_action :authenticate_user!, only: %i[create update destroy]
      before_action :set_challenge, only: %i[show update destroy]
      before_action :authorize_admin, only: %i[create update destroy]

      # GET /api/v1/challenges
      def index
        @challenges = Challenge.all
        render json: @challenges, status: :ok
      end

      # POST /api/v1/challenges
      def create
        @challenge = current_user.challenges.build(challenge_params)

        if @challenge.save
          render json: {
            message: "Challenge created successfully",
            data: @challenge
          }, status: :created
        else
          render json: {
            message: "Failed to create challenge",
            errors: @challenge.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      # GET /api/v1/challenges/:id
      def show
        render json: {
          message: "Challenge found",
          data: @challenge
        }, status: :ok
      end

      # PATCH/PUT /api/v1/challenges/:id
      def update
        if @challenge.update(challenge_params)
          render json: {
            message: "Challenge updated successfully",
            data: @challenge
          }, status: :ok
        else
          render json: {
            message: "Failed to update challenge",
            errors: @challenge.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/challenges/:id
      def destroy
        if @challenge.destroy
          render json: {
            message: "Challenge deleted successfully"
          }, status: :ok
        else
          render json: {
            message: "Failed to delete challenge",
            errors: @challenge.errors.full_messages
          }, status: :unprocessable_entity
        end
      end

      private

      def authorize_admin
        return unless current_user.email == 'admin@gmail.com'
          render json: { message: 'Forbidden action.'}
        end
      end

      # Find challenge
      def set_challenge
        @challenge = Challenge.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { message: "Challenge not found" }, status: :not_found
      end

      # Strong parameters
      def challenge_params
        params.require(:challenge).permit(:title, :description, :start_date, :end_date)
      end
    end
  end
end