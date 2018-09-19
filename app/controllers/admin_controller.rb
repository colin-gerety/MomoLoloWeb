class AdminController < ApplicationController

  before_action :authenticate_admin!, :except => [:denied]

  # GET /admins
  # GET /baristas.jsons
  def index
    @admins = Admin.all
  end

  # POST /admin/aprove_admins
  # POST /admin/aprove_admins.json
  def approve_admins
    Rails.logger.debug "INSIDE admin/approve_admins"
    current_admin.change_approval(params['approve'], true)
    current_admin.change_approval(params['disapprove'], false)
    @approved = current_admin.get_approved
    @unapproved = current_admin.get_unapproved
    respond_to do |format|
        format.html { render :template => "admin/approve_admins" }
    end
  end

  def denied
    respond_to do |format|
      format.html { render :template => "admin/denied" }
    end
  end

private

end
