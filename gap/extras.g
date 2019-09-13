
AddAdditionForMorphisms(AdditiveEnvelope, function(x, y)
  local a, b;

  a := UnderlyingMorphisms(mor1);
  b := UnderlyingMorphisms(mor2);

  return AdditiveEnvelopeMorphism(
    List([1..Length(a)], i->
      List([1..Length(a[1])], j->
        a[i][j] + b[i][j]
    ) ) );
end);

AddAdditiveInverseForMorphisms(AdditiveEnvelope, x -> (-1) * x);

AddZeroObject(AdditiveEnvelope, AdditiveEnvelopeObject([]) );




AddIdentityMorphism(AdditiveEnvelope, function(obj)
  local objs, delta;
  objs = UnderlyingObjects(obj);
  delta := {o1, o2} -> if IsEqualForObjects(o1,o2) then
      IdentityMorphism(o1)
    else
      PreCompose(UniversalMorphismToZeroObject(o2), UniversalMorphismToZeroObject(o1)
    end;

  return AdditiveEnvelopeMorphism(
    List(objs, o1-> List(objs, o2-> delta(o1,o2) ) )
  );
end);

AddMultiplyWithElementOfCommutativeRingForMorphisms(AdditiveEnvelope, {r, m} ->
  (rels -> AdditiveEnvelopeMorphism(
    List(UnderlyingMorphisms(m), row->
      List(row, el -> r*m)
    ))
  )
);

InstallOtherMethod(\+, [IsAdditiveEnvelopeMorphism, IsCapRelation],
  {x,y} -> x + AdditiveEnvelopeMorphism(y)
);
  
InstallOtherMethod(\+, [IsCapRelation, IsAdditiveEnvelopeMorphism],
  {x,y} -> AdditiveEnvelopeMorphism(x) + y
);

SetIsLinearCategoryOverCommutativeRing(AdditiveEnvelope, true);

SetCommutativeRingOfLinearCategory(AdditiveEnvelope, HomalgFieldOfRationals);
