class TweetsController < ApplicationController

    get '/tweets' do
        @tweets = Tweet.all
        erb :'/tweets/index' 
    end

    get '/tweets/new' do
        #if logged_in?
        @tweets = Tweet.all
        @users = User.all
        erb :'/tweets/new'
        #else
        #    redirect to "/tweets"
        #end
    end

    post '/tweets' do 
        @tweet = Tweet.new(params[:tweet])
        #@tweet.user_id = current_user.id
        if @tweet.save
        redirect to "tweets/#{@tweet.id}"
        else
            redirect to "tweets/new"
        end
    end

    get '/tweets/:id/edit' do
        #if logged_in?
            @tweet = Tweet.find(params[:id])
            #if @tweet.user_id != current_user.id
                #flash[:alert] = "Oops... The animal is not in your ZOO, you cannot edit it."
                #redirect to "/tweets"
            #else
                erb :"/tweets/edit"
            #end
        #else
            #flash[:alert] = "You need to log in to view this page. It is for registered zookepers only."
            #redirect to "/sessions/login"
        #end
    end

    get '/tweets/:id' do
        @tweet = Tweet.find_by_id(params[:id])
        @user = @tweet.user_id
        erb :'/tweets/show'
    end

    patch '/tweets/:id' do
        @tweet = Tweet.find_by_id(params[:id])
        #if logged_in? && current_user.id == @animal.zookeeper_id
            @tweet.update(params[:tweet])
            @tweet.save
            redirect to "/tweets/#{@tweet.id}"
        #else
        #    redirect to "/tweets"
        #end
    end

    delete '/tweets/:id' do
        @tweet = Tweet.find_by_id(params[:id])
        #if logged_in? && @animal.zookeeper_id == current_user.id
            @tweet.destroy
        #    flash[:alert] = "The animal has been deleted."
            redirect to '/tweets'
        #else
        #    redirect to "/sessions/login"
        #end
    end

end
