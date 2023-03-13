# generate menu tree for objects from a textfile with nested Tcl lists (using {}).
# coded by Alexandre Porres and Seb Shader

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

proc category_menu::send_item {w x y item} {
    switch $item {
        "Message" {
            pdsend "$w msg $x $y"
        }
        "Number atom box" {
            pdsend "$w floatatom $x $y 5 0 0 0 - - - 0"
        }
        "Symbol atom box" {
            pdsend "$w symbolatom $x $y 10 0 0 0 - - - 0"
        }
        "List box" {
            pdsend "$w listbox $x $y 20 0 0 0 - - - 0"
        }
        "Comment" {
            pdsend "$w text $x $y"
        }
        "Bang" {
            pdsend "$w obj $x $y bng"
        }
        "Toggle" {
            pdsend "$w obj $x $y tgl"
        }
        "Number2" {
            pdsend "$w obj $x $y nbx"
        }
        "Vertical slider" {
            pdsend "$w obj $x $y vsl"
        }
        "Horizontal slider" {
            pdsend "$w obj $x $y hsl"
        }
        "Vertical radio" {
            pdsend "$w obj $x $y vradio"
        }
        "Horizontal radio" {
            pdsend "$w obj $x $y hradio"
        }
        "VU meter" {
            pdsend "$w obj $x $y vu"
        }
        "Canvas" {
            pdsend "$w obj $x $y cnv"
        }
        "Graph" {
            pdsend "$w graph $x $y"
        }
        "Array" {
            pdsend "$w menuarray $x $y"
        }
        default {
            pdsend "$w obj $x $y $item"
        }
    }
}

proc category_menu::create {cmdstring code result op} {
    set mymenu [lindex $cmdstring 1]
    set x [lindex $cmdstring 3]
    set y [lindex $cmdstring 4]
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
                    -command "::category_menu::send_item \$::focused_window $x $y {$item}"
            }
        }
    }
}

trace add execution ::pdtk_canvas::create_popup leave category_menu::create