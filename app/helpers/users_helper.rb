module UsersHelper
  def user_role(x)
    if x == true
      x = I18n.t('user_relate.role_admin')
    else
      x = I18n.t('user_relate.role_member')
    end
  end
end
