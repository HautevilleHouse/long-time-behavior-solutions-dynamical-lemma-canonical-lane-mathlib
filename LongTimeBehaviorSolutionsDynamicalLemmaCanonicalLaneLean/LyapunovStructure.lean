import HautevilleHouse.LongTimeBehaviorSolutionsDynamicalLemma.DynamicalSystemState

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure LyapunovStructure {X : Type} (s : DynamicalSystemState X) where
  functional : X → ℝ
  nonincreasing : Prop
  strictDecayOffEquilibrium : Prop
  equilibriumSet : Set X
  functionalBoundedBelow : Prop

structure LyapunovEvidence {X : Type} {s : DynamicalSystemState X} (L : LyapunovStructure s) where
  nonincreasingClosed : L.nonincreasing
  strictDecayOffEquilibriumClosed : L.strictDecayOffEquilibrium
  functionalBoundedBelowClosed : L.functionalBoundedBelow

def LyapunovClosed {X : Type} {s : DynamicalSystemState X} (L : LyapunovStructure s) : Prop :=
  L.nonincreasing ∧ L.strictDecayOffEquilibrium ∧ L.functionalBoundedBelow

theorem lyapunov_closed_from_evidence
    {X : Type} {s : DynamicalSystemState X} (L : LyapunovStructure s) (E : LyapunovEvidence L) :
    LyapunovClosed L := by
  exact And.intro E.nonincreasingClosed (And.intro E.strictDecayOffEquilibriumClosed E.functionalBoundedBelowClosed)

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse