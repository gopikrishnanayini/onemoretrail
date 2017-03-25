ActiveAdmin.register Student do
permit_params :name, :branch, :dob
    index do
        column :name
        column :branch
        column :dob
        
    end
    form do |f|
    f.inputs "Students Details" do
      f.input :name
      f.input :branch
      f.input :dob
    
    end
    f.actions
  end
 end
 