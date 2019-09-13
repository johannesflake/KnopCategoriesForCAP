DeclareCategory("IsKaroubiEnvelopeObject", IsCapCategoryObject);
DeclareAttribute("UnderlyingObject", IsKaroubiEnvelopeObject);
DeclareAttribute("UnderlyingIdempotent", IsKaroubiEnvelopeObject);
DeclareOperation("KaroubiEnvelopeObject", [IsCapCategoryObject, IsCapCategoryMorphism]);

DeclareCategory("IsKaroubiEnvelopeMorphism", IsCapCategoryMorphism);
DeclareAttribute("UnderlyingMorphism", IsKaroubiEnvelopeMorphism);
DeclareOperation("KaroubiEnvelopeMorphism", [IsCapCategoryMorphism, IsCapCategoryMorphism, IsCapCategoryMorphism]);