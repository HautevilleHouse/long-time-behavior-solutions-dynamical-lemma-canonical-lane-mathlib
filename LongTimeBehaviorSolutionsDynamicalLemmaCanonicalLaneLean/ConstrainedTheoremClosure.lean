import HautevilleHouse.LongTimeBehaviorSolutionsDynamicalLemma.LongTimeBehaviorClosure
import HautevilleHouse.LongTimeBehaviorSolutionsDynamicalLemma.DynamicalSystemState

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

def ConstrainedLongTimeBehaviorClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_long_time_behavior_endgame (A : AdmissibleClass) :
    ConstrainedLongTimeBehaviorClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse