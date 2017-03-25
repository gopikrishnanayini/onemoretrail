ActiveAdmin.register Event do
permit_params :name, :organiser
    index do
        column :name
        column :organiser
       
    end
    form do |f|
    f.inputs "Students Details" do
      f.input :name
      f.input :organiser
     
    end
    f.actions
  end
 end
