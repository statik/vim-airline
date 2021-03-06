call airline#init#bootstrap()

describe 'default'
  before
    let s:builder = airline#builder#new({'active': 1})
  end

  it 'should use the layout'
    let g:airline#extensions#default#layout = [
          \ [ 'c', 'a', 'b', 'warning' ],
          \ [ 'x', 'z', 'y' ]
          \ ]
    call airline#extensions#default#apply(s:builder, { 'winnr': 1, 'active': 1 })
    let stl = s:builder.build()
    Expect stl =~ 'airline_c_to_airline_a'
    Expect stl =~ 'airline_a_to_airline_b'
    Expect stl =~ 'airline_b_to_airline_warning'
    Expect stl =~ 'airline_x_to_airline_z'
    Expect stl =~ 'airline_z_to_airline_y'
  end
end

