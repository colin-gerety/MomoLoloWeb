class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable

  def is_super_user?
     self.email == SUPER_ADMIN_EMAIL
  end

  def get_unapproved
    get_admins(false)
  end

  def get_approved
    get_admins(true)
  end

  def change_approval(admin_ids, value)
    Rails.logger.debug("Inside change approval admin_ids = #{admin_ids.inspect}")
    if (!self.is_super_user?) 
      return nil
    end
    (admin_ids || []).each do |a|
      admin = Admin.where(id: a).first
      if !admin.blank?
        Rails.logger.debug("Changing #{admin.name} approved = #{value.to_s}")
        admin.approved = value
        admin.save
        Rails.logger.debug("after save #{admin.inspect}")
      end
    end 
  end

  def active_for_authentication?
    super && (self.approved? || self.is_super_user?)
  end

  def inactive_message
    if !self.approved?
      :not_approved
    else
      super
    end
  end

private
  
  def get_admins(approval_status)
    if (!self.is_super_user?) 
      return nil
    end
    Admin.where(approved: approval_status)
  end
end

