[![Build Status](https://travis-ci.org/pikesley/mutilator.svg)](https://travis-ci.org/pikesley/mutilator)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/mutilator.svg)](https://gemnasium.com/pikesley/mutilator)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/mutilator.svg)](https://coveralls.io/r/pikesley/mutilator)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/mutilator.svg)](https://codeclimate.com/github/pikesley/mutilator)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

#Mutilator

##Astonishingly Pointless Bullshit as a Service

_v.0.0.1_

##Introduction

Ever see one of these things on Facebook or somewhere?

>  I cnduo't bvleiee taht I culod aulaclty uesdtannrd waht I was rdnaieg. Unisg the icndeblire pweor of the hmuan mnid, aocdcrnig to rseecrah at Cmabrigde Uinervtisy, it dseno't mttaer in waht oderr the lterets in a wrod are, the olny irpoamtnt tihng is taht the frsit and lsat ltteer be in the rhgit pclae. The rset can be a taotl mses and you can sitll raed it whoutit a pboerlm. Tihs is bucseae the huamn mnid deos not raed ervey ltteer by istlef, but the wrod as a wlohe. Aaznmig, huh? Yaeh and I awlyas tghhuot slelinpg was ipmorantt! See if yuor fdreins can raed tihs too.

Well, I built it as a webservice. Actually, I built a [gem](https://github.com/pikesley/wordbot) for it first with the intention of creating some sort of annoying Twitter bot, but it seemed it would work well like this too.

###Content negotiation

Mutilator will respond to the following _Accept_ values with appropriate content:

####`application/json`

Content will be returned as a JSON object thus:

    {
      "source": "This sentence is just a test",
      "mutilated": "Tihs secnntee is just a tset"
    }

####`text/plain`

Content will be returned as plain text thus:

    This snctneee is just a test  

####`text/html`

Content will be returned as an HTML page with a Twitter Bootstrap Jumbotron containing the mutilated text.

###API

####`/:text`

Will return mutilated text.

###Notes

I regret nothing.
