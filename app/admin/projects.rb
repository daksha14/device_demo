ActiveAdmin.register Project do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :title, :description, user_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  form title: 'New Project' do |f|
    inputs 'Details' do
      f.input :title
      f.input :description
      collected_data = User.all.map{|x| [x.email, x.id]}
      f.input :users, as: :check_boxes, collection: collected_data
    end
      actions
  end
  index do
    column :title
    column :description
    column :total_user do |f|
      f.users.count
    end
    actions
  end
end
