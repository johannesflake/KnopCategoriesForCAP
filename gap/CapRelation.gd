LoadPackage("CAP");

DeclareCategory("IsCapRelation", IsList);
DeclareRepresentation("IsCapRelationRep", IsCapRelation and IsAttributeStoringRep, []);
CapRelationType := NewType(NewFamily("TheFamilyOfCAPRelations"), IsCapRelationRep);

DeclareAttribute("UnderlyingMorphisms", IsCapRelation);
DeclareAttribute("Source", IsCapRelation);
DeclareAttribute("Range", IsCapRelation);

DeclareOperation("CapRelation", [IsCapCategoryMorphism, IsCapCategoryMorphism]);

