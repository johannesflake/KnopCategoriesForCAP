LoadPackage("LinearAlgebra");;


deg := x->1;
ConstructPreKnopEnvelope(deg);

field := HomalgRingOfIntegers( 3 );;

V1 := VectorSpaceObject(1, field);;
idmat1 := HomalgIdentityMatrix(1, field);
id1 := VectorSpaceMorphism(V1, idmat1, V1);;
rel1 := CapRelation(id1, id1);;
mor1 := PreKnopEnvelopeMorphism(rel1);;

testInstance1 := PreCompose(mor1,mor1);
ViewObj(testInstance1);