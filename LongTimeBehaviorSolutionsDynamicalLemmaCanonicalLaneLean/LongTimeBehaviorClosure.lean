import HautevilleHouse.LongTimeBehaviorSolutionsDynamicalLemma.OmegaLimitSet

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure LongTimeBehaviorPackage {X : Type} (s : DynamicalSystemState X) where
  lyapunov : LyapunovStructure s
  lyapunovEvidence : LyapunovEvidence lyapunov
  invariantManifold : InvariantManifold lyapunov
  invariantManifoldEvidence : InvariantManifoldEvidence invariantManifold
  omegaLimitSet : OmegaLimitSet invariantManifold
  omegaLimitSetEvidence : OmegaLimitSetEvidence omegaLimitSet
  omegaClosure : OmegaLimitSetClosed omegaLimitSet

def LongTimeBehaviorClosure {X : Type} (s : DynamicalSystemState X) (P : LongTimeBehaviorPackage s) : Prop :=
  LyapunovClosed P.lyapunov ∧ InvariantManifoldClosed P.invariantManifold ∧ OmegaLimitSetClosed P.omegaLimitSet

theorem long_time_behavior_closure_holds {X : Type} (s : DynamicalSystemState X) (P : LongTimeBehaviorPackage s) :
    LongTimeBehaviorClosure s P := by
  refine And.intro ?_ (And.intro ?_ ?_)
  · exact lyapunov_closed_from_evidence P.lyapunov P.lyapunovEvidence
  · exact invariant_manifold_closed_from_evidence P.invariantManifold P.invariantManifoldEvidence
  · exact omega_limit_set_closed_from_evidence P.omegaLimitSet P.omegaLimitSetEvidence

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse