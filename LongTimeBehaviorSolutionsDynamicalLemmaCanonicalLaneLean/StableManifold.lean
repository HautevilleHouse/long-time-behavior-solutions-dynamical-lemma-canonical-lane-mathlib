import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure StableManifoldPackage where
  hyperbolicFixedPoint : Type
  stableSubspace : Type
  unstableSubspace : Type
  smoothSubmersion : Prop
  exponentialContraction : Prop
  exponentialExpansion : Prop

structure StableManifoldEvidence (P : StableManifoldPackage) where
  smoothSubmersionClosed : P.smoothSubmersion
  exponentialContractionClosed : P.exponentialContraction
  exponentialExpansionClosed : P.exponentialExpansion

def StableManifoldClosed (P : StableManifoldPackage) : Prop := 
  P.smoothSubmersion ∧ P.exponentialContraction ∧ P.exponentialExpansion

theorem stable_manifold_closed_from_evidence (P : StableManifoldPackage) (E : StableManifoldEvidence P) : StableManifoldClosed P := by
  exact And.intro E.smoothSubmersionClosed (And.intro E.exponentialContractionClosed E.exponentialExpansionClosed)

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse