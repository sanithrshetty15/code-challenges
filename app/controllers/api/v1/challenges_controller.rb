module Api
    module V1
        class ChallengesController < ApplicationController
           # GET    /api/v1/challenges
            def index
                # show all challenge
                @Challenges = Challenge.all
                render json: @Challenges
            end

            #POST   /api/v1/challenges   
            def create
                challenge = Challenge.new(challenges_params)
                if challenge.save
                    render json: {message: "challenge added successfully", data: challenge }
                else 
                    render json: {message: "Failed to add challenge", data: challenge.errors}
                end
            end


             #GET    /api/v1/challenges/:id
            def show
                challenge = Challenge.find(params{:challenge_id})
                if challenge
                    render json: {message: 'challenge found' , data: challenge}
                else
                    render json: { message: 'challenge not found',data: challenge.errors}
            end


            #PATCH  /api/v1/challenges/:id
            #PUT    /api/v1/challenges/:id
            def update
                challenge = Challenge.find(params{:id})
                if challengee.update{challenges_params}
                    render json: {message: 'challenge updated' , data: challenge}
                else
                    render json: { message: 'challenge not updated',data: challenge.errors}
                end
            end


            # DELETE /api/v1/challenges/:id
            def destroy
                challenge = Challenge.find(params{:id})
                if challengee.destroy{challenges_params}
                    render json: {message: 'challenge deleted' , data: challenge}
                else
                    render json: { message: 'challenge not deleted',data: challenge.errors}
                end

   

            end
            private

            def challenges_params
                params.required(:challenge).permit(:title, :description , :start_date , :end_date)
            end
        end
    end
end