program hello_world2
implicit none

  call hello
  call hello

end

subroutine hello
implicit none
character*32 text
c
text = 'Hello World'
write (*,*) text
c
end
