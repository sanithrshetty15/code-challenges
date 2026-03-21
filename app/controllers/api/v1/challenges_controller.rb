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
                #create single challenge

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
        end
    end
end