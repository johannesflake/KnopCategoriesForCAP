#
# KnopCategoriesForCAP: Computing with Knop categories
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "KnopCategoriesForCAP" );

TestDirectory(DirectoriesPackageLibrary( "KnopCategoriesForCAP", "tst" ),
  rec(exitGAP := true));

Read("test_CapRelation.g");
Read("test_PreKnopEnvelope.g");

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
