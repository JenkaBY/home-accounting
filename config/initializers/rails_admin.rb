RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end

  config.authorize_with do
    unless current_user.admin?
      redirect_to(
          main_app.finances_path,
          alert: t('not_perrmited')
      )
    end
  end
  config.current_user_method { current_user }


  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard # mandatory
    index # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      list do
        exclude_fields :created_at, :updated_at
      end
    end
  end

  config.model 'User' do
    include_fields :id, :name, :email, :admin, :last_sign_in_at

    edit do
      include_fields :password, :password_confirmation
    end

    show do
      include_all_fields
    end
  end

  config.model 'Type' do
    exclude_fields :created_at, :updated_at

    edit do
      include_fields :title
    end

    show do
      include_all_fields
    end
  end

end


