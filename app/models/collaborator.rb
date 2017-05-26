class Collaborator < ApplicationRecord
  belongs_to :wiki
  belongs_to :user
  
  def self.available(wiki,current_user)
    # Anyone who is not the wiki owner
    possible_collaborators = User.all.where.not(id: current_user.id)
    # Does this wiki already have collaborators
    already_taken = wiki.collaborators.map { |collaborator| User.find_by_id(collaborator.user_id) }
    possible_collaborators - already_taken
  end
end