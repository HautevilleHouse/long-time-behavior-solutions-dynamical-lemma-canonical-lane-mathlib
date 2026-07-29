import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean

structure LongTimeAnalyticFoundation where
  invariantManifold : InvariantManifoldPackage
  invariantManifoldEvidence : InvariantManifoldEvidence invariantManifold
  lyapunovFunction : LyapunovFunctionPackage
  lyapunovFunctionEvidence : LyapunovFunctionEvidence lyapunovFunction
  omegaLimitSet : OmegaLimitSetPackage
  omegaLimitSetEvidence : OmegaLimitSetEvidence omegaLimitSet
  laSallePrinciple : LaSalleInvariancePrinciplePackage
  laSallePrincipleEvidence : LaSalleInvariancePrincipleEvidence laSallePrinciple

def LongTimeAnalyticFoundationClosed (A : LongTimeAnalyticFoundation) : Prop :=
  InvariantManifoldClosed A.invariantManifold ∧
  LyapunovFunctionClosed A.lyapunovFunction ∧
  OmegaLimitSetClosed A.omegaLimitSet ∧
  LaSalleInvariancePrincipleClosed A.laSallePrinciple

theorem long_time_analytic_foundation_closed_from_evidence (A : LongTimeAnalyticFoundation) : LongTimeAnalyticFoundationClosed A := by
  exact And.intro (invariant_manifold_closed_from_evidence A.invariantManifold A.invariantManifoldEvidence)
    (And.intro (lyapunov_function_closed_from_evidence A.lyapunovFunction A.lyapunovFunctionEvidence)
      (And.intro (omega_limit_set_closed_from_evidence A.omegaLimitSet A.omegaLimitSetEvidence)
        (la_salle_invariance_principle_closed_from_evidence A.laSallePrinciple A.laSallePrincipleEvidence)))

end LongTimeBehaviorSolutionsDynamicalLemmaCanonicalLaneLean
end HautevilleHouse
