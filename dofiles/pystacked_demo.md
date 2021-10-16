creates a block of comments in the smcl file that will be interpreted 
in the dynamic document. this sign is distinguished from the normal comment 
signs, with one star. sdf


          . clear all


          . insheet using "/Users/kahrens/Dropbox (PP)/ddml/Data/prostate.data",  tab
          (11 vars, 97 obs)

          . set seed 124345

          . pystacked lpsa lcavol lweight age lbph svi lcp gleason pgg45, ///
                                                            type(regress) pyseed(243) method(rf)

          Single base learner: no stacking done.
          ---------------------------------------
            Method         |      Weight
          -----------------+---------------------
            rf             |      1.0000000



