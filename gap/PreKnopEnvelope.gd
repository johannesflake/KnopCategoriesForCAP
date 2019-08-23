DeclareCategory("IsPreKnopEnvelopeObject", IsCapCategoryObject);
DeclareAttribute("UnderlyingObject", IsPreKnopEnvelopeObject);
DeclareOperation("PreKnopEnvelopeObject", [IsCapCategoryObject]);

DeclareCategory("IsPreKnopEnvelopeMorphism", IsCapCategoryMorphism);
DeclareAttribute("UnderlyingRelations", IsPreKnopEnvelopeMorphism);
DeclareOperation("PreKnopEnvelopeMorphism", [IsRecord]);
DeclareOperation("PreKnopEnvelopeMorphism", [IsCapRelation]);
