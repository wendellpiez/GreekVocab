# GreekVocab

Flash cards for Ancient Greek vocabulary practice

Available in two forms (so far): a single PDF for double-sided printing on card stock, or two PDFs, one each for front and back, set up to print two sides by printing all fronts, then all backs.

## Step 1: acquire card stock

There are many manufacturers of card stock for producing 3.5" x 2" cards, which is what they are, in sets of ten, five rows of two, on a single 8 1/2" x 11" page. This page is laid out with 1/2" margins at top and bottom and 3/4" inch on either size, achieving the necessary sizing.

You could also conceivably make these by printing on plain paper or card and then trimming down.


## Step 2: If your printer does two sides, print once in duplex, flipping on the short edge

You are in luck. The file you want is [Dickinson-core-cards.pdf](Dickinson-core-cards.pdf)

## Step 2a: If not, printing twice

Inkjet printers and many laser jets will not flip a page, so you must flip them yourself. You can achieve the same effect - a full set of cards, flipping vertically - by printing the fronts on a stack of pages, then flipping vertically and printing again on the other side.

The files you want are [Dickinson-core-card-fronts.pdf](Dickinson-core-card-fronts.pdf) and  [Dickinson-core-card-backs.pdf](Dickinson-core-card-backs.pdf).

Print the fronts. Then take your stack of pages and flip it vertically (as a stack). Print the backs.

Experiment with plain paper before using your fancy stock. Note that to print only (say) the first 30 cards, you need pages 1-3 of the fronts, but (on the other side) pages 51-53 of the backs (i.e. the last three pages not the first three), because the pages for the backs go backwards. (So you do not have to reorder the pages for printing the card backs.) Note also that the cards are reversed again on the page (going from bottom up), so fronts and backs line up for a page flipped vertically, on the short edge.

## How is this done

The data for these cards was acquired from 
[Dickinson College's amazing collection of resources for language study](http://dcc.dickinson.edu/). Please check them out. This republication of this resource is an example of share-alike: please (re)use it in that spirit.

Other files in this repo represent intermediate transformation steps in the production pipeline between the web resource, and the printed (peedee-effed) page. Basically it's a simple set of rearrangements, with intermediate results shown, starting from the project HTML page. The first step extracts and cleans up the data. A second step arranges all this into an ordered set of fronts and backs. A third step does the rendering. In a next version, steps 2 and 3 should be inverted. (So first rendering the cards as cards, then page/layout). A commercial FO processor was used, because that's what it took to get the fonts. Presumably the same set of stylesheets could produce cards for Ancient Greek Vocab in languages besides English -- though as always, YMMV.

Please feel free to send email to the account if you like this.


