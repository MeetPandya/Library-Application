ActiveAdmin.register Booking do
permit_params :user_id, :room_id, :date, :timefrom, :timeto, :members
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
#


  #### Created the custom form to insert the booking details
  form do |f|
    f.inputs "Booking Details" do
      f.input :user, label: 'Users' ,:as => :select, :collection => User.pluck(:id, :id)
      f.input :room ,label:'Rooms',:as => :select, :collection => Room.pluck(:id, :id)
      f.input :date
      f.input :timefrom
      f.input :timeto
    end
    f.actions
  end


  ### Created the custom search options for active admin
  filter :user, label: 'Users',:collection =>  proc { User.pluck(:id, :id)}
  filter :room , label: 'Rooms',:collection => proc {Room.pluck(:number,:number)}
  filter :date
  filter :timefrom
  filter :timeto
end
