KaroubiEnvelope := CreateCapCategory("Additive Envelope Category");
AddObjectRepresentation(KaroubiEnvelope, IsKaroubiEnvelopeObject);
AddMorphismRepresentation(KaroubiEnvelope, IsKaroubiEnvelopeMorphism);


InstallMethod(KaroubiEnvelopeObject, [IsCapCategoryObject, IsCapCategoryMorphism], function(obj, mor)
  local res;
  res := rec();

  ObjectifyObjectForCAPWithAttributes(
    res, KaroubiEnvelope,
    UnderlyingObject, obj,
    UnderlyingIdempotent, mor
  );

  return res;
end);


InstallMethod(KaroubiEnvelopeMorphism,
  [IsCapCategoryMorphism,IsCapCategoryMorphism,IsCapCategoryMorphism],
  function(f, mor, e)
    local res, objs;
    res := rec();

    objs := [Source(e), Range(e), Source(mor), Range(mor), Source(f), Range(f)];
    if objs{[1..5]} <> objs{[2..6]} then
      Error("morphisms must be composable");
    fi;
    
    ObjectifyMorphismForCAPWithAttributes(
      res, KaroubiEnvelope,
      Source, KaroubiEnvelopeObject(Source(e), e),
      Range, KaroubiEnvelopeObject(Range(f), f),
      UnderlyingMorphism, PreCompose(f, PreCompose(mor, e))
    );

    return res;
end);


InstallMethod( ViewObj, [IsKaroubiEnvelopeObject], function(o)
  Print("An additive envelope object with underlying objects and idempotent: \n");
  ViewObj(UnderlyingObject(o));
  ViewObj(UnderlyingIdempotent(o));
end);

InstallMethod( ViewObj, [IsKaroubiEnvelopeMorphism], function(m)
  Print("An additive envelope morphism with underlying morphism: \n");
  ViewObj(UnderlyingMorphism(m));
end);

AddIsEqualForObjects(KaroubiEnvelope, {o1, o2} ->
  UnderlyingObjects(o1) = UnderlyingObjects(o2) and UnderlyingIdempotent(o1) = UnderlyingIdempotent(o2)
);

AddIsEqualForMorphisms(KaroubiEnvelope, {m1, m2} ->
  UnderlyingMorphisms(m1) = UnderlyingMorphisms(m2)
);

AddIsCongruentForMorphisms(KaroubiEnvelope, function(m1, m2)
  ## todo
  return IsEqualForMorphisms(m1, m2);
end);

AddPreCompose(KaroubiEnvelope, {mor1, mor2} ->
  KaroubiEnvelopeMorphism(
    UnderlyingIdempotent(Source(mor1)),
    PreCompose(UnderlyingMorphism(mor1), UnderlyingMorphism(mor2)),
    UnderlyingIdempotent(Source(mor2))
  )  ## checks
);

Finalize(KaroubiEnvelope);