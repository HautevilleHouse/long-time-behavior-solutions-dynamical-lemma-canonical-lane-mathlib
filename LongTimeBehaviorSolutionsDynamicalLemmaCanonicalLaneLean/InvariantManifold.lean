import HautevilleHouse.LongTimeBehaviorSolutionsDynamicalLemma.LyapunovStructure

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure InvariantManifold {X : Type} {s : DynamicalSystemState X} (L : LyapunovStructure s) where
  manifold : Set X
  forwardInvariant : Prop
  backwardInvariant : Prop
  limitingDynamics : Prop
  convergenceRate : Prop

structure InvariantManifoldEvidence {X : Type} {s : DynamicalSystemState X} {L : LyapunovStructure s}
    (M : InvariantManifold L) where
  forwardInvariantClosed : M.forwardInvariant
  backwardInvariantClosed : M.backwardInvariant
  limitingDynamicsClosed : M.limitingDynamics
  convergenceRateClosed : M.convergenceRate

def InvariantManifoldClosed {X : Type} {s : DynamicalSystemState X} {L : LyapunovStructure s}
    (M : InvariantManifold L) : Prop :=
  M.forwardInvariant ∧ M.backwardInvariant ∧ M.limitingDynamics ∧ M.convergenceRate

theorem invariant_manifold_closed_from_evidence
    {X : Type} {s : DynamicalSystemState X} {L : LyapunovStructure s}
    (M : InvariantManifold L) (E : InvariantManifoldEvidence M) :
    InvariantManifoldClosed M := by
  exact And.intro E.forwardInvariantClosed
    (And.intro E.backwardInvariantClosed
      (And.intro E.limitingDynamicsClosed E.convergenceRateClosed))

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse