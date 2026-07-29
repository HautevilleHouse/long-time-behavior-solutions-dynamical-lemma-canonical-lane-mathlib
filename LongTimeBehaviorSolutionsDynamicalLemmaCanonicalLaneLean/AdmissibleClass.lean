import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LongTimeBehaviorSolutionsDynamicalLemma

structure AdmissibleClass where
  object : LTBDAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LTBDWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end LongTimeBehaviorSolutionsDynamicalLemma
end HautevilleHouse