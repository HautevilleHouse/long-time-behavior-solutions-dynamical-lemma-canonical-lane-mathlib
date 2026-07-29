import LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean.AdmissibleClass

/-!
# Long Time Behavior Package
-/

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure LongTimeBehaviorPackage where
  invariantSet : Type u
  globalAttractor : Prop
  omegaLimitSet : Prop
  convergenceRate : Prop
  stability : Prop

structure LongTimeBehaviorEvidence (P : LongTimeBehaviorPackage) where
  globalAttractorClosed : P.globalAttractor
  omegaLimitSetClosed : P.omegaLimitSet
  convergenceRateClosed : P.convergenceRate
  stabilityClosed : P.stability

def LongTimeBehaviorClosed (P : LongTimeBehaviorPackage) : Prop :=
  P.globalAttractor ∧ P.omegaLimitSet ∧ P.convergenceRate ∧ P.stability

theorem long_time_behavior_closed_from_evidence (P : LongTimeBehaviorPackage)
    (E : LongTimeBehaviorEvidence P) : LongTimeBehaviorClosed P := by
  exact And.intro E.globalAttractorClosed
    (And.intro E.omegaLimitSetClosed
      (And.intro E.convergenceRateClosed E.stabilityClosed))

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse