class RedactorRails::PicturesController < ApplicationController
  before_action :require_user_authentication!

  def create
    @picture = RedactorRails.picture_model.new

    file = params[:file]
    @picture.data = nil#RedactorRails::Http.normalize_param(file, request)
    @picture.user_id = get_redactor_current_user.try(:id)
    @picture.assetable = get_redactor_current_user

    if @picture.save
      render json: { url: @picture.url(:content), id: @picture.id }
    else
      render json: { error: @picture.errors, message: @picture.errors.full_messages.join(', ') }
    end
  end

  private

  def require_user_authentication!
    (self.respond_to?(:redactor_authenticate_user!) && self.send(:redactor_authenticate_user!)) || true
  end

  def get_redactor_current_user
    (self.respond_to?(:redactor_current_user) && self.send(:redactor_current_user)) || (self.respond_to?(:current_user) && self.current_user) || (self.respond_to?(:current_resource_owner, true) && self.send(:current_resource_owner)) || nil
  end
end
