
#! @Section PreKnopEnvelope

#! @Example

LoadPackage("LinearAlgebraForCAP");;
field := HomalgRingOfIntegers( 3 );;

degreeFunction := x->1;;
terminalObject := VectorSpaceObject(0, field);;
ConstructPreKnopEnvelope(degreeFunction, terminalObject);


V1 := VectorSpaceObject(1, field);;
idmat1 := HomalgIdentityMatrix(1, field);
id1 := VectorSpaceMorphism(V1, idmat1, V1);;
rel1 := CapRelation(id1, id1);;
mor1 := PreKnopEnvelopeMorphism(rel1);;
obj1 := PreKnopEnvelopeObject(V1);;


testObject1 := AdditiveEnvelopeObject(obj1);
testObject2 := AdditiveEnvelopeObject([obj1, obj1]);
testMorphism1 := AdditiveEnvelopeMorphism(id1);
testMorphism2 := AdditiveEnvelopeMorphism([[id1, id1], [id1, id1]] );

