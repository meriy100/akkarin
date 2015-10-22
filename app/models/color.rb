class Color < ActiveHash::Base
  self.data = [
    {:id =>  1, :name => "Red",       value: 'red'},
    {:id =>  2, :name => "Blue",      value: 'blue'},
    {:id =>  3, :name => "Tea",       value: 'tea'},
    {:id =>  4, :name => "Orange",    value: 'orange'},
    {:id =>  5, :name => "Yellow",    value: 'yellow'},
    {:id =>  6, :name => "Green",     value: 'green'},
    {:id =>  7, :name => "Sky",       value: 'sky'},
    {:id =>  8, :name => "Purple",    value: 'purple'},
    {:id =>  9, :name => "RedPurple", value: 'redpurple'},
    {:id => 10, :name => "Boot",      value: 'boot'},
  ]
end
