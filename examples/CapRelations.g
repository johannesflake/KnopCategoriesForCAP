
#! @Section CapRelation

#! @Example

LoadPackage("LinearAlgebraForCAP");;

field := HomalgRingOfIntegers( 3 );;

V1 := VectorSpaceObject(1, field);;
idmat1 := HomalgIdentityMatrix(1, field);
id1 := VectorSpaceMorphism(V1, idmat1, V1);;
rel1 := CapRelation(id1, id1);;
testInstance1 := rel1 * rel1;;

UnderlyingMatrix(testInstance1[1]) = idmat1;
#! true
UnderlyingMatrix(UnderlyingMorphisms(testInstance1[2])[1]) = idmat1;
#! true
UnderlyingMatrix(UnderlyingMorphisms(testInstance1[2])[2]) = idmat1;
#! true

V2 := VectorSpaceObject(2, field);
id2 := VectorSpaceMorphism(V2, HomalgIdentityMatrix(2, field), V2);
f2 := VectorSpaceMorphism(V2, HomalgMatrix([[1,1],[0,1]], 2, 2, field), V2);
rel2 := CapRelation(id2, f2);

testInstance2 := rel2 * rel2;
ViewObj(testInstance2);

#! @EndExample



#! @Example

LoadPackage("FinSetsForCAP");;

S1 := FinSet([1]);;
S2 := FinSet([1..2]);;
S3 := FinSet([1..3]);;

id1 := Opposite(MapOfFinSets(S1, [[1,1]], S1));;
id2 := Opposite(MapOfFinSets(S2, [[1,1], [2,2]], S2));;
cross := Opposite(MapOfFinSets(S2, [[1,2], [2,1]], S2));;
map21a := Opposite(MapOfFinSets(S1, [[1,1]], S2));;
map21b := Opposite(MapOfFinSets(S1, [[1,2]], S2));;
map12 := Opposite(MapOfFinSets(S2, [[1,1], [2,1]], S1));;


rId1 := CapRelation(id1, id1);;
rId2 := CapRelation(id2, id2);;
rCross := CapRelation(id2, cross);;
rDots := CapRelation(map21a, map21b);;


InstallMethod(ImageEmbedding, [IsCapCategoryOppositeMorphismRep],
  f->Opposite(CoastrictionToImage(Opposite(f)))
);
InstallMethod(CoastrictionToImage, [IsCapCategoryOppositeMorphismRep],
  f->Opposite(ImageEmbedding(Opposite(f)))
);


rId1 = (rId1 * rId1)[2];

#! @EndExample
