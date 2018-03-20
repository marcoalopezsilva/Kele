# I guess the next lines are only required if we use Roadmap from outside the Kele class
require 'httparty'
require 'json'

module Roadmap

  include HTTParty

  def get_roadmap(chain_id)
    roadmap_path = "/roadmaps/" + chain_id.to_s
    response = self.class.get(roadmap_path, headers: {"authorization" => @auth_token })
    @roadmap = JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    checkpoint_path = "/checkpoints/" + checkpoint_id.to_s
    response = self.class.get(checkpoint_path, headers: {"authorization" => @auth_token })
    @checkpoint = JSON.parse(response.body)
  end

end
