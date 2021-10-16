

webuse nlswork, clear
xtset idcode year

global controls age-south  

pdslasso ln_w union ( c.($controls)##c.($controls) i.ind_code i.occ_code ), ///
            cluster(idcode) fe
