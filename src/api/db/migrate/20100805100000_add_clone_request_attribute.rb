class AddCloneRequestAttribute  < ActiveRecord::Migration


  def self.up
    # set owner ship to Admin, but actually not even the Admin should change these
    p={}
    p[:role] = Role.find_by_title("maintainer")
    ans = AttribNamespace.find_by_name "OBS"

    at=AttribType.create( :attrib_namespace => ans, :name => "RequestCloned", :value_count=>1 )
    at.attrib_type_modifiable_bies.create(p)
  end


  def self.down
    AttribType.find_by_namespace_and_name("OBS", "RequestCloned").destroy()
  end

end
