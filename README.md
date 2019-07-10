# GreekVocab

Flash cards for Ancient Greek vocabulary practice

Available in two forms (so far): a single PDF for double-sided printing on card stock, or two PDFs, one each for front and back, set up to print two sides by printing all fronts, then all backs.

## Step 1: acquire card stock

There are many manufacturers of card stock for producing 3.5" x 2" cards, which is what these are, in sets of ten to a page, in five rows of two, with the margins set to make 8 1/2" x 11" (1/2" margins at top and bottom and 3/4" inch on either size). Most office supply stores have them. This set of flaschards fits onto 53 pages, front and back, for 524 cards plus a few 'jokers'.

You could also conceivably make these by printing on plain paper or card and then trimming down.

## Step 2: If your printer does two sides, print once in duplex, flipping on the short edge

You are in luck. The file you want is [Dickinson-core-cards.pdf](Dickinson-core-cards.pdf). Be sure and set the printer to flip along the short (top/bottom) edge: you can lose a lot of paper or stock flipping the more usual way (on the long edge).

## Step 2a: If not, printing twice

You can achieve the same effect on card stock using a printer that does not print two-sided- a full set of cards, flipping vertically - by printing the fronts on a stack of pages, then flipping vertically and printing the backs on the other side.

The same data in two separate files can be found in  [Dickinson-core-card-fronts.pdf](Dickinson-core-card-fronts.pdf) and  [Dickinson-core-card-backs.pdf](Dickinson-core-card-backs.pdf).

Print the fronts. Then take your stack of pages and flip it vertically (as a stack). Print the backs. You may need to adjust your printer settings. Again, testing with plain paper is advisable before laying toner on the fancy bond. Note that on the back pages, the cards are reversed on the page (to go bottom up), so fronts and backs line up for a page flipped vertically, on the short edge (which will be, once cut into cards, the long-top-bottom edge).

## How is this done

The data for these cards was acquired from 
[Dickinson College's amazing collection of resources for language study](http://dcc.dickinson.edu/) specifically the 
[Dickinson Core Vocabulary](http://dcc.dickinson.edu/greek-core-list). Please check out this impressive set of resources. This vocabulary resource alone can hardly be over-valued, while the site as a whole is a vindication (were any needed) of the "Digital Humanities" (so called or by any name). The republication of this resource in flashcard form is an example of share-alike: please (re)use it in that spirit.

Other files in this repo represent intermediate transformation steps in the production pipeline between the web resource, and the printed (PDFed) page. Basically it's a simple set of rearrangements, with intermediate results shown, starting from the HTML delivered by the project (which conveniently does all the Unicode handling) and ending with PDF. The first step extracts and cleans up the data. A second step arranges all this into an ordered set of fronts and backs. A third step does the rendering. In a next version, steps 2 and 3 might be reversed. (So first rendering the cards as cards, then page/layout.) A commercial FO processor (*formatting engine*) was used in addition to a transformation engine (XSLT processor), because that's what it took to get the fonts. Presumably the same set of stylesheets could produce cards for Ancient Greek Vocab from the Dickinson College sources in languages besides English (several are already available) -- though as always, YMMV. (In particular, the sizing of elements are the cards all done relative to what the English glosses require: you might need more space or less.)

Please feel free to send email to the account if you like this or have any use for it.
