#!/usr/local/bin/perl -w
# Copyright 2011 Rogan Carr
#  Contact: rogan@uw.edu
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use lib ('./'); #This should point to where you keep NetSeed.pm
use NetSeed;

# Example network
my $networkFile = "network.txt";

# --- -- --- -- --- --- -- Options -- --- --- -- --- -- --- -- --- #

open (my $NetFH, "< $networkFile") or die "Can't find $networkFile: $!\n";
my $sep = "\t";
my $giantComponent = 1;
my $minimal = 0;

# --- -- --- -- --- -- Analyze Network -- --- -- --- -- --- -- --- #

CalculateSeeds($NetFH,$sep,$giantComponent,$minimal);

# Grab the resulting data
my %Seeds = Seeds();
my %GroupedSeeds = GroupedSeeds();
my %NonSeeds = NonSeeds();
my %Ignored = IgnoredNodes();
my %Nodes = AllNodes();
my %Edges = AllEdges();
my $nElements = NumElements();

# --- -- --- -- --- -- --- --- --- --- --- -- --- -- --- -- --- -- #


# --- -- --- -- --- -- Write Out Files -- --- -- --- -- --- -- --- #

# Write out the files
my $prefix = "example/";
my $suffix = '.dat';

unless (-d $prefix) {
  mkdir $prefix;
}
print "writing seeds to $prefix\n";

# Seeds
my $seedLink = "${prefix}seed${suffix}";
open(seedFH, "> ${seedLink}") or print "<br />error opening ${seedLink}<br />";
foreach my $seed (keys %Seeds) { print seedFH "$seed\t$Seeds{$seed}\n"; }
close(seedFH);

# Grouped Seeds
my $groupedLink = "${prefix}seed_grouped${suffix}";
open(groupFH, "> ${groupedLink}") or print "<br />error opening ${groupedLink}<br />";
foreach my $seed (keys %GroupedSeeds) { print groupFH "$seed\n"; }
close(groupFH);

  # Non Seed Nodes
my $nonLink = "${prefix}non_seed${suffix}";
open(nonFH, "> ${nonLink}") or print "<br />error opening ${nonLink}<br />";
foreach my $node (keys %NonSeeds) { print nonFH "$node\n"; }
close(nonFH);

# Pruned Nodes
my $prunedLink = "${prefix}ignored${suffix}";
open(prunedFH, "> ${prunedLink}") or print "<br />error opening ${prunedLink}<br />";
foreach my $node (keys %Ignored) { print prunedFH "$node\n"; }
close(prunedFH);

