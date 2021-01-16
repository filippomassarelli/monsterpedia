module Api 
    module V1 
        class MonstersController < ApplicationController

            before_action :find_monster, only: [:show, :update, :destroy]

            def index
                monsters = Monster.order('created_at DESC');
                render json: {status: 'SUCCESS', message:'Loaded monsters', data:monsters}, status: :ok 
            end

            def show
                render json: {status: 'SUCCESS', message:'Loaded monster', data:monster}, status: :ok 
            end

            def create
                monster = Monster.new(monster_params)

                if monster.save
                    render json: {status: 'SUCCESS', message:'Saved monster', data:monster}, status: :ok 
                else
                    render json: {status: 'ERROR', message:'Monsters not saved', data:monster.errors}, status: :unprocessable_entity
                end   
            end

            def update
                if @monster.update(monster_params)
                    render json: {status: 'SUCCESS', message:'Updated monster', data:@monster}, status: :ok 
                else
                    render json: {status: 'ERROR', message:'Monsters not updated', data:monster.errors}, status: :unprocessable_entity
                end

            end

            def destroy
                @monster.destroy
                render json: {status: 'SUCCESS', message:'Deleted monster', data:@monster}, status: :ok 
            end

            private 

            def monster_params
                params.permit(:name, :tribe, :quote)
            end

            def find_monster
                @monster = Monster.find(params[:id])
            end

        end
    end
end
