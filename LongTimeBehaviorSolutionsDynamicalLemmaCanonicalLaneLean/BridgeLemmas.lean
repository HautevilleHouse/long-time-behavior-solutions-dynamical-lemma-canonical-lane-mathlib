import HautevilleHouse.LongTimeBehaviorSolutionsDynamicalLemma.DynamicalSystemState

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DynamicalSystemStateClosed (A.object : DynamicalSystemState (Type _))

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse