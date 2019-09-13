AdditiveEnvelope := CreateCapCategory("Additive Envelope Category");
AddObjectRepresentation(AdditiveEnvelope, IsAdditiveEnvelopeObject);
AddMorphismRepresentation(AdditiveEnvelope, IsAdditiveEnvelopeMorphism);


InstallMethod(AdditiveEnvelopeObject, [IsCapCategoryObject], o-> AdditiveEnvelopeObject([o]));
InstallMethod(AdditiveEnvelopeObject, [IsList], function(objs)
  local res;
  res := rec();

  ObjectifyObjectForCAPWithAttributes(
    res, AdditiveEnvelope,
    UnderlyingObjects, objs
  );

  return res;
end);


InstallMethod(AdditiveEnvelopeMorphism, [IsCapCategoryMorphism], m->AdditiveEnvelopeMorphism([[m]]));
InstallMethod(AdditiveEnvelopeMorphism, [IsList], function(mat)
    local res;
    res := rec();

    # todo: checks
    
    ObjectifyMorphismForCAPWithAttributes(
      res, AdditiveEnvelope,
      Source, AdditiveEnvelopeObject(List(mat[1], mor -> Source(mor))),
      Range, AdditiveEnvelopeObject(List(mat, row -> Range(row[1]))),
      UnderlyingMorphisms, mat
    );

    return res;
end);


InstallMethod( ViewObj, [IsAdditiveEnvelopeObject], function(o)
  Print("An additive envelope object with underlying objects: \n");
  ViewObj(UnderlyingObjects(o));
end);

InstallMethod( ViewObj, [IsAdditiveEnvelopeMorphism], function(m)
  Print("A additive envelope morphism with underlying morphisms: \n");
  ViewObj(UnderlyingMorphisms(m));
end);

AddIsEqualForObjects(AdditiveEnvelope, {o1, o2} ->
  UnderlyingObjects(o1) = UnderlyingObjects(o2)
);

AddIsEqualForMorphisms(AdditiveEnvelope, {m1, m2} ->
  UnderlyingMorphisms(m1) = UnderlyingMorphisms(m2)
);

AddIsCongruentForMorphisms(AdditiveEnvelope, function(m1, m2)
  ## todo
  return IsEqualForMorphisms(m1, m2);
end);

AddPreCompose(AdditiveEnvelope, function(mor1, mor2)
  local a, b;

  a := UnderlyingMorphisms(mor1);
  b := UnderlyingMorphisms(mor2);

  return AdditiveEnvelopeMorphism(
    List([1..Length(a)], i->
      List([1..Length(b[1])], j->
        Sum([1..Length(a[1])], k-> PreCompose(a[i][k],b[k][j]) )
    ) ) );
end);

Finalize(AdditiveEnvelope);