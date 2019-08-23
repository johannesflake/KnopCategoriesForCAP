ConstructPreKnopEnvelope := function(degreeFunction)

local PreKnopEnvelope;

PreKnopEnvelope := CreateCapCategory("Knop Envelope Category");
AddObjectRepresentation(PreKnopEnvelope, IsPreKnopEnvelopeObject);
AddMorphismRepresentation(PreKnopEnvelope, IsPreKnopEnvelopeMorphism);

InstallMethod(PreKnopEnvelopeObject, [IsCapCategoryObject], function(obj)
  local res;
  res := rec();

  ObjectifyObjectForCAPWithAttributes(
    res, PreKnopEnvelope,
    UnderlyingObject, obj
  );

  return res;
end);

InstallMethod(PreKnopEnvelopeMorphism, [IsRecord], function(rels)
    local res, rel;
    res := rec();

    rel := rels.elements[1];

    ObjectifyMorphismForCAPWithAttributes(
      res, PreKnopEnvelope,
      Source, PreKnopEnvelopeObject(Range(rel[1])),
      Range, PreKnopEnvelopeObject(Range(rel[2])),
      UnderlyingRelations, rels
    );

    return res;
end);

InstallMethod(PreKnopEnvelopeMorphism, [IsCapRelation],
  rel -> PreKnopEnvelopeMorphism(rec(factors:=[1], elements:=[rel]))
);

InstallMethod( ViewObj, [IsPreKnopEnvelopeObject], function(o)
  Print("A Knop envelope object with underlying object: \n");
  ViewObj(UnderlyingObject(o));
end);

InstallMethod( ViewObj, [IsPreKnopEnvelopeMorphism], function(m)
  local rels, i;
  rels := UnderlyingRelations(m);
  Print("A Knop envelope morphism with underlying relations: \n");
  for i in [1..Size(rels.factors)] do
    ViewObj(rels.factors[i]);
    Print("* \n");
    ViewObj(rels.elements[i]);
  od;
end);

AddIsEqualForObjects(PreKnopEnvelope, {o1, o2} ->
  UnderlyingObject(o1) = UnderlyingObject(o2)
);

AddIsEqualForMorphisms(PreKnopEnvelope, {m1, m2} ->
  UnderlyingRelations(m1) = UnderlyingRelations(m2)
);

AddIsCongruentForMorphisms(PreKnopEnvelope, function(m1, m2)
  ## todo
  return UnderlyingRelations(m1) = UnderlyingRelations(m2);
end);

AddPreCompose(PreKnopEnvelope, function(mor1, mor2)
  local x, y;

  x := UnderlyingRelations(mor1);
  y := UnderlyingRelations(mor2);

  return
    Sum([1..Length(x.factors)], i -> x.factors[i] *
      Sum([1..Length(y.factors)], j -> y.factors[j] *
        (res -> degreeFunction(res[1]) *
          PreKnopEnvelopeMorphism(res[2]))(x.elements[i] * y.elements[j])
    ) );
end);

AddAdditionForMorphisms(PreKnopEnvelope, function(x, y)
    local factors, elements, res;
    if not IsEqualForObjects(Source(x.elements[1]), Source(y.elements[1]))
      or not IsEqualForObjects(Range(x.elements[1]), Range(y.elements[1])) then
        Error("<x> and <y> must have same source and range (as relations)");
    fi;
      
    return PreKnopEnvelopeMorphism(rec(
      factors := Concatenation(x.factors, y.factors),
      elements := Concatenation(x.elements, y.elements)
    ) );
end);

AddAdditiveInverseForMorphisms(PreKnopEnvelope, x -> (-1) * x);

AddZeroObject(PreKnopEnvelope, PreKnopEnvelopeMorphism(
  (m->CapRelation(m,m))( IdentityMorphism(TerminalObject())  )
));

AddIdentityMorphism(PreKnopEnvelope, x -> PreKnopEnvelopeMorphism(
  (m->CapRelation(m,m))( IdentityMorphism(UnderlyingObject(x)) )
));


AddMultiplyWithElementOfCommutativeRingForMorphisms(PreKnopEnvelope, {r, m} ->
  (rels -> PreKnopEnvelopeMorphism(rec(factors := r *rels.factors, elements := rels.elements)))
  (UnderlyingRelations(m))
);

InstallOtherMethod(\+, [IsPreKnopEnvelopeMorphism, IsCapRelation],
  {x,y} -> x + PreKnopEnvelopeMorphism(y)
);
  

SetIsLinearCategoryOverCommutativeRing(PreKnopEnvelope, true);

SetCommutativeRingOfLinearCategory(PreKnopEnvelope, HomalgFieldOfRationals);

Finalize(PreKnopEnvelope);

end; ## CreatePreKnopEnvelope