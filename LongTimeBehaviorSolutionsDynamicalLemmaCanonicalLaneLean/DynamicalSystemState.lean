import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure DynamicalSystemState (X : Type) where
  carrier : X
  time : ℝ
  orbit : ℝ → X
  evolutionLaw : Prop
  orbitSmoothness : Prop

structure DynamicalSystemStateEvidence {X : Type} (s : DynamicalSystemState X) where
  evolutionLawClosed : s.evolutionLaw
  orbitSmoothnessClosed : s.orbitSmoothness

def DynamicalSystemStateClosed {X : Type} (s : DynamicalSystemState X) : Prop :=
  s.evolutionLaw ∧ s.orbitSmoothness

theorem dynamical_system_state_closed_from_evidence
    {X : Type} (s : DynamicalSystemState X) (E : DynamicalSystemStateEvidence s) :
    DynamicalSystemStateClosed s := by
  exact And.intro E.evolutionLawClosed E.orbitSmoothnessClosed

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse