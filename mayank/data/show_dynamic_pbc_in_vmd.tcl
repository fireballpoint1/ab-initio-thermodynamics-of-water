set filename [lindex $argv 0]
    
# load the coordinates into vmd
mol new $filename waitfor all
    
# open the file to parse the lattice vectors
set file [open $filename]
    
set i 0
    
while {[gets $file line] >= 0} {
  # get the lines containing Lattice="
  if {[regexp {Lattice=\"[ 0-9\.\-eE]*} $line lattice]} {  
    # extract the numbers from the line into v_arr
    set vectors [regexp -all -inline {\S+} [lindex [split $line \"] 1]]
    set j 0     
    foreach v $vectors {
      set v_arr($j) $v
      incr j
    }
    # set the pbc for the i-th frame
    # uncomment the second line if the cell is not orthorhombic
    pbc set "{$v_arr(0) $v_arr(4) $v_arr(8)}" -first $i -last $i
    #pbc set "{{$v_arr(0) $v_arr(1) $v_arr(2)} {$v_arr(3) $v_arr(4) $v_arr(5)} {$v_arr(6) $v_arr(7) $v_arr(8)}}" -namd -first $i -last $i
    incr i
  }
}
    
close $file