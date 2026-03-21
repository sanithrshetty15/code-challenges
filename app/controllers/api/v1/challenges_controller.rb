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
                #show single challenge
            end


            #PATCH  /api/v1/challenges/:id
            #PUT    /api/v1/challenges/:id
            def update
                 #update single challenge
            end


            # DELETE /api/v1/challenges/:id
            def destroy
                 #delete single challenge
            end
            private

            def challenges_params
                params.required(:challenge).permit(:title, :description , :start_date , :end_date)
            end
        end
    end
end