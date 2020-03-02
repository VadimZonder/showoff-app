class WelcomeController < ApplicationController
  protect_from_forgery prepend: true

  def index
    ##Development or Deployment____________
    @url =  request.original_url
    if @url.include? 'c9users.io'
        @deployment = false
    else
        @deployment = true

    end
    require "open-uri"
    require 'rest-client'

    ###chnange whne recieve working credentials
    @client_id= "277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe"
    @client_secret = "d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352"
    @access_token =  cookies[:access_token]
    #will cause an error if access_token is nil
    if !@access_token.nil?
        @authorization = "Bearer "+@access_token
    end

   @allWidgetsUrl = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/1/widgets?"+
   "client_id="+@client_id+
   "&client_secret="+@client_secret


###All Visible Widets______________________________________________________________________________
    @searchTerm = ""
@urlSerachTermVisible ='https://showoff-rails-react-production.herokuapp.com/api/v1/users/1/widgets?
client_id='+@client_id+'&client_secret='+@client_secret+'&term='+@searchTerm

@urlAllWidgetsVisible ='https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?
client_id='+@client_id+'&client_secret='+@client_secret

  @allWidgetsResponceSample = RestClient.get(@urlAllWidgetsVisible,
  {
  content_type: 'application/json',
    authorization: @authorization
  }
)

#display auth message

   @objectCounter =1
    @jsonParseAllWidgets = JSON.parse (@allWidgetsResponceSample) ##change to the actual json string
   # @nameResultsArray = @jsonParseAllWidgets["data"]["widgets"][0]["name"]
   arrayCount = @jsonParseAllWidgets["data"]["widgets"].count-1
  #@nameResultsArray = @jsonParseAllWidgets["data"]["widgets"][1]["name"]
  @nameResultsArray = []
  @descriptionResulsArray = []
  @fNameResulsArray = []
  @lNameResulsArray = []
   while arrayCount != -1 do
        @nameResultsArray =  @nameResultsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["id"])
       @nameResultsArray = @nameResultsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["id"])
       @nameResultsArray =  @nameResultsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["name"])
       @nameResultsArray = @nameResultsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["description"])
       @nameResultsArray =  @nameResultsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["kind"])

       @nameResultsArray =  @nameResultsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["name"])
       @nameResultsArray =  @nameResultsArray.push(@jsonParseAllWidgets["data"]["widgets"][arrayCount-1]["user"]["images"]["small_url"])

       arrayCount = arrayCount - 1
   end
  end
end
