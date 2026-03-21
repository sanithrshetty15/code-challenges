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
            puts 'starting'
            puts params
            puts 'Done'
                challenge = Challenge.new(title: 'Sanith R Shetty', description: "Ruby is wonderful", start_date: Date.today ,end_date: Date.tomorrow)
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
        end
    end
end