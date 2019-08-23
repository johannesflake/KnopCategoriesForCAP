InstallMethod(CapRelation, [IsCapCategoryMorphism, IsCapCategoryMorphism],
  function(mor1, mor2)
    local res;

    if not IsEqualForObjects(Source(mor1), Source(mor2)) then
      Error("The two morphisms defining a relation must have congruent sources.");
    fi;
  
    res := rec();
    ObjectifyWithAttributes(res, CapRelationType,
      UnderlyingMorphisms, [mor1, mor2],
      Source, Range(mor1),
      Range, Range(mor2)
    );
    return res;
end);
  
InstallMethod(ViewObj, [IsCapRelation], function(rel)
  Print("A CAP relation: \n");
  Display(UnderlyingMorphisms(rel)[1]);
  Display(UnderlyingMorphisms(rel)[2]);
end);

InstallOtherMethod(\*, [IsCapRelation, IsCapRelation], function(rel1_, rel2_)
  local rel1, rel2, fp, dp, a1, a2,
    g, m, q1, q2,
    rel, t;
  
  rel1 := UnderlyingMorphisms(rel1_);
  rel2 := UnderlyingMorphisms(rel2_);

  fp := [rel1[2], rel2[1]];
  a1 := PreCompose(ProjectionInFactorOfFiberProduct(fp, 1), rel1[1]);
  a2 := PreCompose(ProjectionInFactorOfFiberProduct(fp, 2), rel2[2]);

  g := UniversalMorphismIntoDirectProduct(a1, a2);
  m := ImageEmbedding(g);

  dp := [Range(rel1[1]), Range(rel2[2])];
  q1 := ProjectionInFactorOfDirectProduct(dp, 1);
  q2 := ProjectionInFactorOfDirectProduct(dp, 2);
  
  rel := CapRelation(PreCompose(m, q1), PreCompose(m, q2));
  t := CoastrictionToImage(g);

  return [t, rel];
end);