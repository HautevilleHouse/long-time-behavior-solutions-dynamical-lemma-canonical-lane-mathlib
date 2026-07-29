import canonicalLaneMathlib.AttractorStructure

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure LyapunovFunctionPackage {M : LTBDAdmittedObject} where
  domain : Type u
  functionValued : Type v
  smooth : Prop
  nonincreasing : Prop
  strictDecayOffAttractor : Prop
  lowerBounded : Prop

structure LyapunovEvidence {M : LTBDAdmittedObject}
    (L : LyapunovFunctionPackage M) where
  smoothClosed : L.smooth
  nonincreasingClosed : L.nonincreasing
  strictDecayOffAttractorClosed : L.strictDecayOffAttractor
  lowerBoundedClosed : L.lowerBounded

def LyapunovClosed {M : LTBDAdmittedObject} (L : LyapunovFunctionPackage M) : Prop :=
  L.smooth ∧ L.nonincreasing ∧ L.strictDecayOffAttractor ∧ L.lowerBounded

theorem lyapunov_closed_from_evidence {M : LTBDAdmittedObject}
    (L : LyapunovFunctionPackage M) (E : LyapunovEvidence L) : LyapunovClosed L := by
  exact And.intro E.smoothClosed (And.intro E.nonincreasingClosed
    (And.intro E.strictDecayOffAttractorClosed E.lowerBoundedClosed))

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse