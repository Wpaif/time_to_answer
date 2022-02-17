module UsersBackoffice::ProfileHelper
  def gender_select(user, current_gender)
    user.user_profile.gender.eql?(current_gender.to_s) ? 'btn-primary' : 'btn-default'
  end
end
