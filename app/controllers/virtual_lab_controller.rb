class VirtualLabController < ApplicationController
  include Generator
  
  def show_diagram
    set_field_params(width = 600)
    @points = generates
  end
end
