class RedactorRails::DocumentsController < ApplicationController
  before_action :require_user_authentication!

  def create
    @document = RedactorRails.document_model.new

    file = params[:file]
    @document.data = RedactorRails::Http.normalize_param(file, request)
    @document.user_id = get_redactor_current_user.try(:id)
    @document.assetable = get_redactor_current_user

    if @document.save
      render json: { url: @document.url, name: @document.filename, id: @document.id }
    else
      render json: { error: @document.errors, message: @document.errors.full_messages.join(', ') }
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
