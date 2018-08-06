module TwtrsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_twtrs_path
    elsif action_name == 'edit'
      twtr_path
    end
  end
end
