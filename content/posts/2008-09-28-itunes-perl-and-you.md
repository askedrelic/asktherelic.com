---
date: "2008-09-28T18:00:39Z"
slug: itunes-perl-and-you
title: iTunes, Perl, and You
---

I was updating my Facebook profile tonight and wanted to fill in the "Favorite
Music" section with some real data from iTunes, considering I listen to 99% of
my music through iTunes, my iPod, or iPhone, which means all of my stats get
tracked through iTunes. Creating a Smart Playlist in iTunes of my most played
music would be adequate, but I don't know of a way to that data out of iTunes
without copying and pasting, a boring and time waste experience, so I turned to
Perl.

A friend of mine, [Drew][1], maintains a set of Perl scripts on CPAN to parse
and help analyze your iTunes library XML file, aptly called
[Mac-iTunes-Library][2] (you may have to search for it a bit).

I installed the package via CPAN:

```perl
install 'Mac::iTunes::Library'
```

Then coded up up a script to pull the top 50 artists based on the number of
tracks. Assuming I listen to these tracks, it's probably a good statistic that I
like this artist.

```perl
#!/usr/bin/env perl
use strict;
use warnings;

use Mac::iTunes::Library;
use Mac::iTunes::Library::XML;

my $file = $ARGV[0];

# Make a new Library
my $library = Mac::iTunes::Library->new();
$library = Mac::iTunes::Library::XML->parse($file);

#hash of <Artist, numTracks>
my %artists = $library->artist();
my @sortedArtists = ();
my $count = 0;

#sort function
sub numerically {
        $artists{$b} <=> $artists{$a};
}

#sort artists by the number of tracks, then grab the top 50
for my $artist (sort numerically (keys %artists)) {
    if( $count < 50) {
        push(@sortedArtists, $artist);
    }
    $count++;
}

#Now take the top 50 artists sorted by number of tracks,
#and sort alphabetically, and print
foreach my $artist (sort(@sortedArtists)) {
    print "$artist, ";
}

print "n";
```

Now, I'm a beginner with Perl, but from a quick parse of the results, there are
still some case-sensitivity issues that I'm looking into; "Boards of Canada" and
"Boards Of Canada" are seperate artists, but that's also a problem with iTunes
not caring much about case either when saving data. With some minor formatting
to the output, you should be rewarded with a list something like this:

**311, Aphex Twin, Armin Van Buuren, BT, Bear McCreary, Beck, Cake, DJ Miko &
Mini Me, Daft Punk, Deep Forest, Depeche Mode, Dieselboy, Eels, Eminem, Foo
Fighters, Frank Klepacki, Hybrid, Incubus, Infected Mushroom, Jack Johnson,
Johnny Cash, Juno Reactor, Korn, Machinae Supremacy, Massive Attack, Metallica,
Moby, Muse, Nine Inch Nails, Orbital, Pink Floyd, Placebo, Prodigy, Queen,
Queens of the Stone Age, Radiohead, Rammstein, Scooter, Stabbing Westward,
System of a Down, The Chemical Brothers, The Crystal Method, The Offspring, The
Red Hot Chili Peppers, The Smashing Pumpkins, The Strokes, Tiesto, Weezer, Yo La
Tengo, Yoko Kanno**

Hurray data!

**Update 05/17/2009**

I tweaked the script to be compatible with version 0.5 of the library, some
changes had been made since I last looked at this. You need to enter the library
location as an argument now.

[1]: http://dinomite.net/
[2]: http://search.cpan.org/~dinomite/
