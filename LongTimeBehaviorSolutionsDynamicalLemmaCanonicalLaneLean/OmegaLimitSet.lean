import HautevilleHouse.LongTimeBehaviorSolutionsDynamicalLemma.InvariantManifold

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure OmegaLimitSet {X : Type} {s : DynamicalSystemState X} {L : LyapunovStructure s}
    (M : InvariantManifold L) where
  omegaSet : Set X
  nonempty : Prop
  compact : Prop
  connected : Prop
  invariant : Prop
  attractorProperty : Prop

structure OmegaLimitSetEvidence {X : Type} {s : DynamicalSystemState X} {L : LyapunovStructure s}
    {M : InvariantManifold L} (Ω : OmegaLimitSet M) where
  nonemptyClosed : Ω.nonempty
  compactClosed : Ω.compact
  connectedClosed : Ω.connected
  invariantClosed : Ω.invariant
  attractorPropertyClosed : Ω.attractorProperty

def OmegaLimitSetClosed {X : Type} {s : DynamicalSystemState X} {L : LyapunovStructure s}
    {M : InvariantManifold L} (Ω : OmegaLimitSet M) : Prop :=
  Ω.nonempty ∧ Ω.compact ∧ Ω.connected ∧ Ω.invariant ∧ Ω.attractorProperty

theorem omega_limit_set_closed_from_evidence
    {X : Type} {s : DynamicalSystemState X} {L : LyapunovStructure s}
    {M : InvariantManifold L} (Ω : OmegaLimitSet M) (E : OmegaLimitSetEvidence Ω) :
    OmegaLimitSetClosed Ω := by
  exact And.intro E.nonemptyClosed
    (And.intro E.compactClosed
      (And.intro E.connectedClosed
        (And.intro E.invariantClosed E.attractorPropertyClosed)))

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse