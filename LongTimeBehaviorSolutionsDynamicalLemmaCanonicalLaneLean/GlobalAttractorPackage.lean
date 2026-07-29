import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure GlobalAttractorPackage where
  flowDomain : Type u
  topology : TopologicalSpace flowDomain
  flowMap : flowDomain → ℝ → flowDomain
  invariantSet : Set flowDomain
  attractorSet : Set flowDomain
  forwardInvariant : Prop
  attracting : Prop
  compactness : Prop
  basinOfAttraction : Prop

structure GlobalAttractorEvidence (A : GlobalAttractorPackage) where
  forwardInvariantClosed : A.forwardInvariant
  attractingClosed : A.attracting
  compactnessClosed : A.compactness
  basinOfAttractionClosed : A.basinOfAttraction

def GlobalAttractorClosed (A : GlobalAttractorPackage) : Prop :=
  A.forwardInvariant ∧ A.attracting ∧ A.compactness ∧ A.basinOfAttraction

theorem global_attractor_closed_from_evidence (A : GlobalAttractorPackage)
    (E : GlobalAttractorEvidence A) : GlobalAttractorClosed A :=
  And.intro E.forwardInvariantClosed (And.intro E.attractingClosed
    (And.intro E.compactnessClosed E.basinOfAttractionClosed))

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse