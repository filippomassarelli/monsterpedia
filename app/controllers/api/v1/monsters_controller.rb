module Api 
    module V1 
        class MonstersController < ApplicationController
            def Index
                monsters = Monster.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded monsters', data:monsters}, status: :ok 
            end
        end
    end
end
