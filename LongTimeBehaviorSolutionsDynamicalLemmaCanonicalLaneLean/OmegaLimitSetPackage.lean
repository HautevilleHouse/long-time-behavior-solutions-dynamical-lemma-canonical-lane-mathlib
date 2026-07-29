import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure OmegaLimitSetPackage {A : GlobalAttractorPackage} where
  forwardOrbit : A.flowDomain → Set A.flowDomain
  omegaLimitSet : A.flowDomain → Set A.flowDomain
  nonEmpty : Prop
  compact : Prop
  invariant : Prop
  attractsForwardOrbit : Prop

structure OmegaLimitSetEvidence {A : GlobalAttractorPackage}
    (Ω : OmegaLimitSetPackage A) where
  nonEmptyClosed : Ω.nonEmpty
  compactClosed : Ω.compact
  invariantClosed : Ω.invariant
  attractsForwardOrbitClosed : Ω.attractsForwardOrbit

def OmegaLimitSetClosed {A : GlobalAttractorPackage}
    (Ω : OmegaLimitSetPackage A) : Prop :=
  Ω.nonEmpty ∧ Ω.compact ∧ Ω.invariant ∧ Ω.attractsForwardOrbit

theorem omega_limit_set_closed_from_evidence {A : GlobalAttractorPackage}
    (Ω : OmegaLimitSetPackage A) (E : OmegaLimitSetEvidence Ω) :
    OmegaLimitSetClosed Ω :=
  And.intro E.nonEmptyClosed (And.intro E.compactClosed
    (And.intro E.invariantClosed E.attractsForwardOrbitClosed))

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse