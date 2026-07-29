import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure ConvergencePackage {A : GlobalAttractorPackage}
    {L : LyapunovFunctionPackage A} {Ω : OmegaLimitSetPackage A} where
  convergenceToAttractor : Prop
  convergenceRate : Prop
  attractionBasinCharacterization : Prop
  omegaLimitSubsetOfAttractor : Prop

structure ConvergenceEvidence {A : GlobalAttractorPackage}
    {L : LyapunovFunctionPackage A} {Ω : OmegaLimitSetPackage A}
    (C : ConvergencePackage A L Ω) where
  convergenceToAttractorClosed : C.convergenceToAttractor
  convergenceRateClosed : C.convergenceRate
  attractionBasinCharacterizationClosed : C.attractionBasinCharacterization
  omegaLimitSubsetOfAttractorClosed : C.omegaLimitSubsetOfAttractor

def ConvergenceClosed {A : GlobalAttractorPackage}
    {L : LyapunovFunctionPackage A} {Ω : OmegaLimitSetPackage A}
    (C : ConvergencePackage A L Ω) : Prop :=
  C.convergenceToAttractor ∧ C.convergenceRate ∧
  C.attractionBasinCharacterization ∧ C.omegaLimitSubsetOfAttractor

theorem convergence_closed_from_evidence {A : GlobalAttractorPackage}
    {L : LyapunovFunctionPackage A} {Ω : OmegaLimitSetPackage A}
    (C : ConvergencePackage A L Ω) (E : ConvergenceEvidence C) :
    ConvergenceClosed C :=
  And.intro E.convergenceToAttractorClosed
    (And.intro E.convergenceRateClosed
      (And.intro E.attractionBasinCharacterizationClosed
        E.omegaLimitSubsetOfAttractorClosed))

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse