
#! @Section KaroubiEnvelope

#! @Example

LoadPackage("LinearAlgebraForCAP");;
field := HomalgRingOfIntegers( 3 );;

degreeFunction := x->1;;
terminalObject := VectorSpaceObject(0, field);;
ConstructPreKnopEnvelope(degreeFunction, terminalObject);


field := HomalgRingOfIntegers( 3 );;

V1 := VectorSpaceObject(1, field);;
idmat1 := HomalgIdentityMatrix(1, field);
id1 := VectorSpaceMorphism(V1, idmat1, V1);;
zero1 := VectorSpaceMorphism(V1, [0], V1);;
rel1 := CapRelation(id1, id1);;
mor1 := PreKnopEnvelopeMorphism(rel1);;
obj1 := PreKnopEnvelopeObject(V1);


obj1 := AdditiveEnvelopeObject([obj1, obj1]);;
idemp := AdditiveEnvelopeMorphism([[id1, zero1], [zero1, zero1]]);;

testObj1 := KaroubiEnvelopeObject(obj1, idemp);
ViewObj(testObj1);
testMor1 := KaroubiEnvelopeMorphism(idemp, idemp, idemp);
ViewObj(testMor1);
