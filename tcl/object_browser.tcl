# generate menu tree for objects from a textfile with nested Tcl lists (using {}).

package require pd_menus

namespace eval category_menu {
}

proc category_menu::load_menutree {} {
    set f [open [file join $::sys_guidir object_tree.tcl]]
    set menutree [read $f]
    close $f
    unset f        
    return $menutree
}

proc menu_send_item {w x y item} {
    if {$item eq "Message"} { 
        pdsend "$w msg $x $y"
    } elseif {$item eq "Number atom box"} { 
        pdsend "$w floatatom $x $y 5 0 0 0 - - - 0"
    } elseif {$item eq "Symbol atom box"} { 
        pdsend "$w symbolatom $x $y 10 0 0 0 - - - 0"
    } elseif {$item eq "List box"} { 
        pdsend "$w listbox $x $y 20 0 0 0 - - - 0"
    }  elseif {$item eq "Bang"} { 
        pdsend "$w obj $x $y bng"
    }   elseif {$item eq "Toggle"} { 
        pdsend "$w obj $x $y tgl"
    }   elseif {$item eq "Number2"} { 
        pdsend "$w obj $x $y nbx"
    }   elseif {$item eq "Vertical slider"} { 
        pdsend "$w obj $x $y vsl"
    }   elseif {$item eq "Horizontal slider"} { 
        pdsend "$w obj $x $y hsl"
    }   elseif {$item eq "Vertical radio"} { 
        pdsend "$w obj $x $y vradio"
    }   elseif {$item eq "Horizontal radio"} { 
        pdsend "$w obj $x $y hradio"
    }   elseif {$item eq "VU meter"} { 
        pdsend "$w obj $x $y vu"
    }   elseif {$item eq "Canvas"} { 
        pdsend "$w obj $x $y cnv"
    }   elseif {$item eq "Graph"} { 
        pdsend "$w graph $x $y"
    }   elseif {$item eq "Array"} { 
        pdsend "$w menuarray $x $y"
    }   else { pdsend "$w obj $x $y $item" }
}

proc category_menu::create {mymenu} {
    set menutree [load_menutree]
    $mymenu add separator
    foreach categorylist $menutree {
        set category [lindex $categorylist 0]
        menu $mymenu.$category
        $mymenu add cascade -label $category -menu $mymenu.$category
        foreach subcategorylist [lrange $categorylist 1 end] {
            set subcategory [lindex $subcategorylist 0]
            menu $mymenu.$category.$subcategory
            $mymenu.$category add cascade -label $subcategory -menu $mymenu.$category.$subcategory
            foreach item [lindex $subcategorylist end] {
                # replace the normal dash with a Unicode minus so that Tcl does not
                # interpret the dash in the -label to make it a separator
                $mymenu.$category.$subcategory add command \
                    -label [regsub -all {^\-$} $item {−}] \
                    -command "menu_send_item \$::focused_window \$::popup_xcanvas \$::popup_ycanvas {$item}"
            }
        }
    }
}

category_menu::create .popup

::pdwindow::post "object-browser-test\n"
