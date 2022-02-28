class InvitationsController < Devise::InvitationsController
  private

  # This is called when creating invitation.

  def invite_resource
    super { |user| user.organisation = current_organisation }
  end
end
