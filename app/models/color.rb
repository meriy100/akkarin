class Color < ActiveHash::Base
  self.data = [
    {:id => 1, :name => "Red", value: 'red'},
    {:id => 2, :name => "Blue", value: 'blue'},
    {:id => 3, :name => "Tea", value: 'tea'}
  ]
end
