import LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean.LyapunovFunction

/-!
# Invariant Measure Package
-/

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure InvariantMeasurePackage {P : LongTimeBehaviorPackage}
    {L : LyapunovFunctionPackage P} where
  measureExistence : Prop
  ergodicity : Prop
  supportOnAttractor : Prop
  physicalMeasure : Prop

structure InvariantMeasureEvidence {P : LongTimeBehaviorPackage}
    {L : LyapunovFunctionPackage P} (M : InvariantMeasurePackage P L) where
  measureExistenceClosed : M.measureExistence
  ergodicityClosed : M.ergodicity
  supportOnAttractorClosed : M.supportOnAttractor
  physicalMeasureClosed : M.physicalMeasure

def InvariantMeasureClosed {P : LongTimeBehaviorPackage}
    {L : LyapunovFunctionPackage P} (M : InvariantMeasurePackage P L) : Prop :=
  M.measureExistence ∧ M.ergodicity ∧ M.supportOnAttractor ∧ M.physicalMeasure

theorem invariant_measure_closed_from_evidence {P : LongTimeBehaviorPackage}
    {L : LyapunovFunctionPackage P} (M : InvariantMeasurePackage P L)
    (E : InvariantMeasureEvidence M) : InvariantMeasureClosed M := by
  exact And.intro E.measureExistenceClosed
    (And.intro E.ergodicityClosed
      (And.intro E.supportOnAttractorClosed E.physicalMeasureClosed))

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse