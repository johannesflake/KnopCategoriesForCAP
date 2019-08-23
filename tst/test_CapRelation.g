LoadPackage("LinearAlgebra");;

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

Print("\n");

V2 := VectorSpaceObject(2, field);
id2 := VectorSpaceMorphism(V2, HomalgIdentityMatrix(2, field), V2);
f2 := VectorSpaceMorphism(V2, HomalgMatrix([[1,1],[0,1]], 2, 2, field), V2);
rel2 := CapRelation(id2, f2);

testInstance2 := rel2 * rel2;
ViewObj(testInstance2);


## todo: add finset example
