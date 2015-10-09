class Color < ActiveHash::Base
  self.data = [
    {:id => 1, :name => "Red", value: '#FF0000'},
    {:id => 2, :name => "Blue", value: '#0000FF'}
  ]
end
