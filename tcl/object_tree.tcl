{add\ object
    {guis
        {Message Number\ atom\ box Symbol\ atom\ box List\ box Bang Toggle Number2 Vertical\ slider Horizontal\ slider Vertical\ radio Horizontal\ radio VU\ meter Canvas Graph Array}}
    {message\ management
        {bang trigger route swap print float int valeu symbol makefilename send receive}}
    {list\ management
        {pack unpack list\ append list\ prepend list\ store list\ split list\ trim list\ length list\ fromsymbol list\ tosymbol}}
    {arrays/tables
        {tabread tabread4 tabwrite soundfiler table array\ define array\ size array\ sum array\ get array\ set array\ quantile array\ random array\ max array\ min}}
    {text\ management
        {qlist textfile text\ define text\ get text\ set text\ insert text\ delete text\ size text\ tolist text\ fromlist text\ search text\ sequence}}
    {file\ management
        {file\ handle file\ define file\ mkdir file\ which file\ glob file\ stat file\ isdirectory file\ isfile file\ size file\ copy file\ move file\ delete file\ split file\ splitex file\ join file\ splitname}}
    {time
        {delay pipe metro line timer cputime realtime}}
    {logic
        {select change spigot moses until}}
    {math
        {expr clip random + - * / max min > >= < <= == != div mod && || & | << >> sin cos tan atan atan2 wrap abs sqrt exp log pow}}
    {acoustic\ conversions
        {mtof ftom rmstodb dbtorms powtodb dbtopow}}
    {midi/osc
        {midiin midiout notein noteout ctlin ctlout pgmin pgmout bendin bendout touchin touchout polytouchin polytouchout sysexin midirealtimein makenote stripnote poly oscparse oscformat}}
    {misc
        {openpanel savepanel key keyup keyname netsend netreceive fudiparse fudiformat bag trace}}
    {general\ audio\ tools
        {snake~\ in snake~\ out adc~ dac~ sig~ line~ vline~ threshold~ env~ snapshot~ vsnapsot~ bang~ samphold~ samplerate~ send~ receive~ throw~ catch~ readsf~ writesf~ print~}}
    {signal\ math
        {fft~ ifft~ rfft~ irfft~ expr~ fexpr~ +~ -~ *~ /~ max~ min~ clip~ sqrt~ rsqrt~ wrap~ pow~ exp~ log~ abs~}}
    {signal\ acoustic\ conversions
        {mtof~ ftom~ rmstodb~ dbtorms~ powtodb~ dbtopow~}}
    {audio\ generators/tables
        {noise~ phasor~ cos~ osc~ tabosc4~ tabplay~ tabwrite~ tabread~ tabread4~ tabsend~ tabreceive~}}
    {audio\ filters
        {vcf~ hip~ lop~ slop~ bp~ biquad~ rpole~ rzero~ rzero_rev~ cpole~ czero~ czero_rev~}}
    {audio\ delay
        {delwrite~ delread~ delread4~}}
    {patch/subpatch
        {loadbang declare savestate clone pdcontrol pd inlet inlet~ outlet outlet~ namecanvas block~ switch~}}
    {data\ structures
        {struct drawpolygon filledpolygon drawcurve filledcurve drawnumber drawsymbol drawtext plot scalar pointer get set element getsize setsize append}}
    {extra
        {sigmund~ bonk~ choice hilbert~ complex-mod~ loop~ lrshift~ pd~ stdout rev1~ rev2~ rev3~ bob~ output~}}

}