ActiveAdmin.register Bookinghistory do

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
# end

  ## Created the custom booking histories filters
  filter :user, label: 'Users',:collection =>  proc { User.pluck(:id, :id)}
  filter :room , label: 'Rooms',:collection => proc {Room.pluck(:number,:number)}
  filter :date
  filter :timefrom
  filter :timeto

end
