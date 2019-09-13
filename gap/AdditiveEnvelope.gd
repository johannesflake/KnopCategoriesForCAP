DeclareCategory("IsAdditiveEnvelopeObject", IsCapCategoryObject);
DeclareAttribute("UnderlyingObjects", IsAdditiveEnvelopeObject);
DeclareOperation("AdditiveEnvelopeObject", [IsCapCategoryObject]);
DeclareOperation("AdditiveEnvelopeObject", [IsList]);

DeclareCategory("IsAdditiveEnvelopeMorphism", IsCapCategoryMorphism);
DeclareAttribute("UnderlyingMorphisms", IsAdditiveEnvelopeMorphism);
DeclareOperation("AdditiveEnvelopeMorphism", [IsCapCategoryMorphism]);
DeclareOperation("AdditiveEnvelopeMorphism", [IsList]);