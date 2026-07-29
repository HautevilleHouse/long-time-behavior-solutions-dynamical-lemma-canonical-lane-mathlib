import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure LyapunovFunctionPackage {A : GlobalAttractorPackage} where
  lyapunovFunction : A.flowDomain → ℝ
  nonNegative : Prop
  decreasingAlongFlows : Prop
  zeroOnAttractor : Prop
  strictDecayOutside : Prop

structure LyapunovFunctionEvidence {A : GlobalAttractorPackage}
    (L : LyapunovFunctionPackage A) where
  nonNegativeClosed : L.nonNegative
  decreasingAlongFlowsClosed : L.decreasingAlongFlows
  zeroOnAttractorClosed : L.zeroOnAttractor
  strictDecayOutsideClosed : L.strictDecayOutside

def LyapunovFunctionClosed {A : GlobalAttractorPackage}
    (L : LyapunovFunctionPackage A) : Prop :=
  L.nonNegative ∧ L.decreasingAlongFlows ∧ L.zeroOnAttractor ∧ L.strictDecayOutside

theorem lyapunov_function_closed_from_evidence {A : GlobalAttractorPackage}
    (L : LyapunovFunctionPackage A) (E : LyapunovFunctionEvidence L) :
    LyapunovFunctionClosed L :=
  And.intro E.nonNegativeClosed (And.intro E.decreasingAlongFlowsClosed
    (And.intro E.zeroOnAttractorClosed E.strictDecayOutsideClosed))

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse