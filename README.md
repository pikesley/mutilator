[![Build Status](https://travis-ci.org/pikesley/mutilator.svg)](https://travis-ci.org/pikesley/mutilator)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/mutilator.svg)](https://gemnasium.com/pikesley/mutilator)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/mutilator.svg)](https://coveralls.io/r/pikesley/mutilator)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/mutilator.svg)](https://codeclimate.com/github/pikesley/mutilator)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg)](https://github.com/badges/badgerbadgerbadger)

#Mutilator

##Astonishingly Pointless Bullshit as a Service

_v.0.1.0_

##Introduction

Ever see one of these things on Facebook or somewhere?

>  I cnduo't bvleiee taht I culod aulaclty uesdtannrd waht I was rdnaieg. Unisg the icndeblire pweor of the hmuan mnid, aocdcrnig to rseecrah at Cmabrigde Uinervtisy, it dseno't mttaer in waht oderr the lterets in a wrod are, the olny irpoamtnt tihng is taht the frsit and lsat ltteer be in the rhgit pclae. The rset can be a taotl mses and you can sitll raed it whoutit a pboerlm. Tihs is bucseae the huamn mnid deos not raed ervey ltteer by istlef, but the wrod as a wlohe. Aaznmig, huh? Yaeh and I awlyas tghhuot slelinpg was ipmorantt! See if yuor fdreins can raed tihs too.

Well, I built it as a webservice. Actually, I built a [gem](https://github.com/pikesley/wordbot) for it first with the intention of creating some sort of annoying Twitter bot, but it seemed it would work like this too.

###Content negotiation

Mutilator will respond to the following _Accept_ values with appropriate content:

####`text/csv`

Content will be returned as comma-separated values thus:

    source,mutilated
    This sentence is just a test,Tihs secnntee is just a tset

####`text/html`

Content will be returned as an HTML page with a Twitter Bootstrap Jumbotron containing the mutilated text ([example](https://mutilator.herokuapp.com/It%20is%20interesting%20to%20contemplate%20a%20tangled%20bank,%20clothed%20with%20many%20plants%20of%20many%20kinds,%20with%20birds%20singing%20on%20the%20bushes,%20with%20various%20insects%20flitting%20about,%20and%20with%20worms%20crawling%20through%20the%20damp%20earth,%20and%20to%20reflect%20that%20these%20elaborately%20constructed%20forms,%20so%20different%20from%20each%20other,%20and%20dependent%20upon%20each%20other%20in%20so%20complex%20a%20manner,%20have%20all%20been%20produced%20by%20laws%20acting%20around%20us.%20These%20laws,%20taken%20in%20the%20largest%20sense,%20being%20Growth%20with%20reproduction;%20Inheritance%20which%20is%20almost%20implied%20by%20reproduction;%20Variability%20from%20the%20indirect%20and%20direct%20action%20of%20the%20conditions%20of%20life,%20and%20from%20use%20and%20disuse;%20a%20Ratio%20of%20Increase%20so%20high%20as%20to%20lead%20to%20a%20Struggle%20for%20Life,%20and%20as%20a%20consequence%20to%20Natural%20Selection,%20entailing%20Divergence%20of%20Character%20and%20the%20Extinction%20of%20less%20improved%20forms.%20Thus,%20from%20the%20war%20of%20nature,%20from%20famine%20and%20death,%20the%20most%20exalted%20object%20which%20we%20are%20capable%20of%20conceiving,%20namely,%20the%20production%20of%20the%20higher%20animals,%20directly%20follows.%20There%20is%20grandeur%20in%20this%20view%20of%20life,%20with%20its%20several%20powers,%20having%20been%20originally%20breathed%20by%20the%20Creator%20into%20a%20few%20forms%20or%20into%20one;%20and%20that,%20whilst%20this%20planet%20has%20gone%20circling%20on%20according%20to%20the%20fixed%20law%20of%20gravity,%20from%20so%20simple%20a%20beginning%20endless%20forms%20most%20beautiful%20and%20most%20wonderful%20have%20been,%20and%20are%20being%20evolved.)).

####`application/json`

Content will be returned as a JSON object thus:

    {
      "source": "This sentence is just a test",
      "mutilated": "Tihs secnntee is just a tset"
    }

####`text/plain`

Content will be returned as plain text thus:

    This snctneee is just a test  

####`application/xml`

Content will be returned as an XML document thus (this may be completely bogus, what I understand about XML would fit on the back of a fag packet):

      <?xml version="1.0" encoding="UTF-8"?>
      <mutilation>
        <source>This sentence is just a test</source>
        <mutilated>Tihs secnntee is just a tset</mutilated>
      </mutilation>

###API

####`/:text`

Will return mutilated text.

###Notes

I regret nothing.
